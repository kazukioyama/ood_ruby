# 抽象クラスを用いたコード（SRPの解消）（Strategyパターンと呼ばれる）

# 通知のインターフェース（抽象クラス）
class AbstractNotification
  def send(user_id)
    puts "通知開始"
  end
end

# 具体クラス
class EmailNotification < AbstractNotification
  def send(user_id)
    #メールで通知を送信
    super
    puts "メール"
  end
end

class SMSNotification < AbstractNotification
  def send(user_id)
    #SMSで通知を送信
    super
    puts "SMS"
  end
end

# 新規追加した具体クラス（新しくプッシュ通知機能を追加）
class PushNotification < AbstractNotification
  def send(user_id)
    #プッシュで通知を送信
    super
    puts "プッシュ通知"
  end
end

## 通知処理
email_notification = EmailNotification.new
email_notification.send(1)

# 新しいパターン("push")を追加する際に、既存の機能部分を修正せずとも、ただそのパターンの具体クラス(PushNotifiation)を追加するだけで良くなった（変更に強くなった）
# (→また、実はORPだけでなくSRPも解消されている)
# → いわゆるStrategyパターン


# →また抽象クラスを用意することで"他箇所での利用時に抽象クラスを使える"ので、全体として具象クラスに依存しないコードにできる（以下notify関数が例）

# 通知機能のクライアントであるnotify関数
def notify(user_id, notification) # notificationには、AbstractNotificaitonのサブクラスだけ渡せる形（具象クラスに依存していない）
  notification.send(user_id)
end
# →send関数を使える前提の処理になっていて、いわゆるダックタイピングの性質でもある

## 通知処理(クライアント経由)
notifications = {
  email: EmailNotification.new,
  sms: SMSNotification.new,
  push: PushNotification.new
}
notify(1, notifications[:email])