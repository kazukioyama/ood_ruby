#  RepositoryパターンとDIパターンにより、DIPを満たした形（DB操作が絡んだユーザ登録処理）
## 上位であるUserApplicationServiceが、下位であるSQLiteUserRepositoryに依存しないよう、引数でrepositoryを渡す形にした（DIパターンを適用）

class User
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# DIパターンを適用する(SQLiteUserRepositoryを引数で渡す形にする)ための、UserRepositoryの抽象クラス
class UserRepository
  def add(user)
  end
end

# Repositoryパターン（SQLite用のDB操作を行う）
class SQLiteUserRepository
  def add(user)
    # DBに接続する処理
    # クエリの検証・実行、DBの開放処理
    query = "INSERT INTO users (name) VALUES (#{user.name})"
    puts "ユーザを作成しています"
  end
end

# ユーザのユースケース（を表現するクラス）
class UserApplicationService
  def initialize(user_repository) # DIパターン（引数を抽象クラス(UserRepository)として定義し、具象クラスを外から注入できるようにする）
    @repository = user_repository
  end

  def register_user(name)
    user = User.new(name)
    @repository.add(user)
  end
end

# 呼び出し
sqlite_user_repository = SQLiteUserRepository.new
user_application_service = UserApplicationService.new(sqlite_user_repository) # DIパターン（具象クラスを外から注入している）
user_application_service.register_user("ユーザ太郎")

