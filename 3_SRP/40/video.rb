class Video
  attr_reader :title, :full_name, :comments

  def initialize(title, full_name)
    @title = title
    @full_name = full_name
    @comments = []
  end
end


class VideoUploader
  def upload(video)

    puts "#{video.title}がアップロードされました"
  end
end

class VideoPlayer
  def play(video)

    puts "#{video.title}を再生します"
  end
end

class CommentPost
  def comment_post(video, user_name, comment)
    video.comments << [user_name, comment]

    puts "#{user_name}が次のコメントを投稿しました #{comment}"
  end
end

#責務を1つ（変更箇所が1つ）になるように分割
##低結合なクラスになり、変更に強くなった
##クラスの役割が分かりやすくなり、可読性が上がった