# SRPに違反しているコード
class Video
  attr_reader :title, :full_name, :comments

  def initialize(title, full_name)
    @title = title
    @full_name = full_name
    @comments = []
  end
end

# 動画の処理を行うクラス
class VideoController
  def upload_video(video)

    puts "#{video.title}がアップロードされました"
  end

  def play_video(video)

    puts "#{video.title}を再生します"
  end

  def post_comment(video, user_name, comment)
    video.comments << [user_name, comment]

    puts "#{user_name}が次のコメントを投稿しました #{comment}"
  end
end

# 問題点：責務を3つ持ってしまっている。
## →高凝集・低結合でなく、変更に弱い設計