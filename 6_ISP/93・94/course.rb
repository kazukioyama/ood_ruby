# ISPに違反しているコード（クライアントに、クライアントが利用しないメソッドへの依存を強制してしまっている）

# コースのインターフェース（抽象クラス）
class Course
  #全ユーザ共通で使えるようにするメソッド
  def view_lecture
  end

  # 講師専用のメソッド
  def add_lecture
  end

  # 生徒専用のメソッド
  def review_course
  end
end

# 講師から見たコースクラス（具象クラス）
class CourseFromInstructors < Course
  def view_lecture
    super
    puts "視聴を開始します"
    # 講師用コース動画の再生処理
  end

  def add_lecture(content_name)
    # レクチャー作成処理
    super
    puts "新規レクチャー「#{content_name}」を作成しました"
  end

  def review_course
    # 講師にレビューさせたくないのでこのメソッドを実行できないようにしたいが、継承元で定義されてしまっているのでオーバーライドする必要がある（superを入れないで上書き）
  end
end

# 生徒から見たコースクラス（具象クラス）
class CourseFromStudents < Course
  def view_lecture
    super
    puts "視聴を開始します"
    # 生徒用コース動画の再生処理
  end

  def add_lecture(content_name)
    # 生徒にレクチャー追加させたくないのでこのメソッドを実行できないようにしたいが、継承元で定義されてしまっているのでオーバーライドする必要がある（superを入れないで上書き）
  end

  def review_course
    super
    puts "コースのレビューをお願いします"
    # レビュー投稿処理
  end
end


# →このISPに違反した設計のままだと、具象側で使わないメソッドをわざわざオーバーライドする必要が出てきてしまう
# (ちなみにこのCourseクラスはSRPにも違反している（ISPに違反していると抽象クラスが巨大になりがち）

# ISPを解消する2種類の方法
# - "多重継承"を使う（Mix-inを使って、複数の親クラスを継承する）（95）
# - "コンポジション"を使う（96）
# →2つとも「巨大化したインターフェース(抽象クラス)を分割する」という目的