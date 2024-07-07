# Repositoryパターン（DB操作してのユーザ登録処理）

class User
  attr_reader :name

  def initialize(name)
    @name = name
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
  def initialize
    @repository = SQLiteUserRepository.new
  end

  def register_user(name)
    user = User.new(name)
    @repository.add(user)
  end
end

# 呼び出し
user_application_service = UserApplicationService.new
user_application_service.register_user("ユーザ太郎")


# Repositoryパターンによる効果
## - DB操作をSQLiteUserRepositoryクラスで抽象化した
## - DB操作の責務がSQLiteUserRepositoryクラスに分割された


# ただ、まだ上位であるUserApplicationServiceが下位であるSQLiteUserRepositoryに依存している（DIPに違反している）ので、DIパターンで改善する