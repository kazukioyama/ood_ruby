# OOPに違反しているコード
class Notification
  def send(notification_type, user_id)
    if notification_type == "email"
      #送信ロジック
      puts "メール"
    elsif notification_type == "sms"
      #送信ロジック
      puts "SMS"
    elsif notification_type == "push"
      #送信ロジック
      puts "プッシュ通知"
    end
  end
end

notification = Notification.new
notification.send("email", 1)

##問題点：新しいパターン("push"等)を追加する際、sendメソッドを変更する必要が出てくる
# →ただでさえ送信ロジックが含まれているのに、さらに肥大化もしてしまう
# →パターン追加の際に、既存の機能("email"等)に影響してバグが起こる可能性がある

# →解決策：抽象(Abstract)クラスを作成する
# →→sendメソッドを変更せずとも(既存の機能に影響することなく)、ただそのパターン用のクラスを追加するだけで良くなる