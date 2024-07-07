# 「多重継承」でISPを解消（Rubyでは多重継承できないので、複数のmoduleをincludeすること（ミックスイン）で実現）

# 全ユーザ共通で使える用
class Course
  #全ユーザ共通で使えるようにするメソッド（講師も生徒も視聴可能）
  def view_lecture
    puts "継承元Course"
  end
end

# 講師でしか使えない用のインターフェース
module InstructorCourseInterface
  # 講師専用のメソッド
  def add_lecture
    puts "継承元InstructorCourseInterface"
  end
end

# 生徒でしか使えない用のインターフェース
module StudentCourseInterface
  # 生徒専用のメソッド
  def review_course
    puts "継承元StudentCourseInterface"
  end
end


# 多重継承して、クライアントに必要な機能だけを用意する
## 講師用
class CourseFromInstructor < Course
  include InstructorCourseInterface # 生徒専用のインターフェースを継承
  def view_lecture
    super
    puts "視聴を開始します"
    # 講師用コース動画の再生処理
  end

  def add_lecture(content_name) # (モジュールのメソッドはそのまま使うことができるので、super は不要)
    # レクチャー作成処理
    puts "新規レクチャー「#{content_name}」を作成しました"
  end
end

## 生徒用
class CourseFromStudents < Course
  include StudentCourseInterface # 生徒専用のインターフェースを継承
  def view_lecture
    super
    puts "視聴を開始します"
    # 生徒用コース動画の再生処理
  end

  def review_course # (モジュールのメソッドはそのまま使うことができるので、super は不要)
    puts "コースのレビューをお願いします"
    # レビュー投稿処理
  end
end

course_from_students = CourseFromStudents.new
course_from_students.view_lecture
course_from_students.review_course

