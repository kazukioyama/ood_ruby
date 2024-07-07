# Dependency Injection（DI）パターン

# 4章でStrategyパターンで書いた通知機能（4_OOP/56/notification.rb）（実は既にDIを使っていた）
## 通知のインターフェース（抽象クラス）
class AbstractNotification
  def send(user_id)
    puts "通知開始"
  end
end

## 具象クラス
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

# notify関数（この定義時点ではまだ、どの具象クラスに依存するかは決まっていない）
def notify(user_id, notification) #DIパターン（外部から(Notification系の)あらゆる具象クラスを注入できるように、抽象クラスを引数に定義している）
  notification.send(user_id)
end

## 通知処理
notifications = {
  email: EmailNotification.new,
  sms: SMSNotification.new
}
notify(1, notifications[:email]) # # DIパターン（具象クラスを外から注入している）