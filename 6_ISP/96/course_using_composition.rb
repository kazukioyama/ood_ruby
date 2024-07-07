# 「コンポジション」でISPを解消

# 全ユーザ共通で使える用
class Course
  #全ユーザ共通で使えるようにするメソッド（講師も生徒も視聴可能）
  def view_lecture
  end
end


# 講師用に使う具象クラス
class InstructorBehaviour
  # 講師専用のメソッド
  def add_lecture(content_name)
    # レクチャー作成処理
    puts "新規レクチャー「#{content_name}」を作成しました"
  end
end

# 生徒用に使う具象クラス
class StudentBehaviour
  # 生徒専用のメソッド
  def review_course
    puts "コースのレビューをお願いします"
    # レビュー投稿処理
  end
end


## 講師用のコースクラス
class CourseFromInstructor < Course
  # attr_readerで設定する必要ない（instracutor_behaviorは外部から参照しない属性なので）

  def initialize
    @instructor_behavior = InstructorBehaviour.new
  end

  def view_lecture
    super
    puts "視聴を開始します"
    # 講師用コース動画の再生処理
  end

  def add_lecture(content_name)
    @instructor_behavior.add_lecture(content_name)
  end
end

## 生徒用のコースクラス
class CourseFromStudents < Course
  # attr_readerで設定する必要ない（course_behaviorは外部から参照しない属性なので）

  def initialize
    @student_behavior = StudentBehaviour.new
  end

  def view_lecture
    super
    puts "視聴を開始します"
    # 講師用コース動画の再生処理
  end

  def review_course
    @student_behavior.review_course
  end
end

# 呼び出し
course_from_instructor = CourseFromInstructor.new
course_from_instructor.view_lecture
course_from_instructor.add_lecture("授業テスト")



# 全ユーザ共通で使える用
class Course
  #全ユーザ共通で使えるようにするメソッド（講師も生徒も視聴可能）
  def view_lecture
  end
end


# 講師用に使う具象クラス
class InstructorBehaviour
  # 講師専用のメソッド
  def add_lecture(content_name)
    # レクチャー作成処理
    puts "新規レクチャー「#{content_name}」を作成しました"
  end
end

# 生徒用に使う具象クラス
class StudentBehaviour
  # 生徒専用のメソッド
  def review_course
    puts "コースのレビューをお願いします"
    # レビュー投稿処理
  end
end


## 講師用のコースクラス
class CourseFromInstructor < Course
  # attr_readerで設定する必要ない（instracutor_behaviorは外部から参照しない属性なので）

  def initialize
    @instructor_behavior = InstructorBehaviour.new
  end

  def view_lecture
    super
    puts "視聴を開始します"
    # 講師用コース動画の再生処理
  end

  def add_lecture(content_name)
    @instructor_behavior.add_lecture(content_name)
  end
end

## 生徒用のコースクラス
class CourseFromStudents < Course
  # attr_readerで設定する必要ない（course_behaviorは外部から参照しない属性なので）

  def initialize
    @student_behavior = StudentBehaviour.new
  end

  def view_lecture
    super
    puts "視聴を開始します"
    # 講師用コース動画の再生処理
  end

  def review_course
    @student_behavior.review_course
  end
end

# 呼び出し
course_from_instructor = CourseFromInstructor.new
course_from_instructor.view_lecture
course_from_instructor.add_lecture("授業テスト")


