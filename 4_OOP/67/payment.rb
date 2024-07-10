# 演習問題3

# OOP修正前
class Payment
  def pay(amount, method)
    case method
    when 'cash'
    when 'credit_card'
    when 'QRPay'
    else
      railse StandardError, '利用できない決済方法です。'
    end
  end
end

# OOP修正後（Strategyパターン適用）
class AbstractPayment
  def pay(amount)
  end
end

class CashPayment < AbstractPayment
  def pay(amount)
    super
    puts "#{amount}円を現金で払いました"
  end
end

class CreditCardPayment < AbstractPayment
  def pay(amount)
    super
    puts "#{amount}円をクレジットカードで払いました"
  end
end

class QRPayPayment < AbstractPayment
  def pay(amount)
    super
    puts "#{amount}円をQRコードで払いました"
  end
end

## 呼び出し処理
def buy(amount, abstract_payment)
  abstract_payment.pay(amount)
end

payments = {
  cash: CashPayment.new,
  credit_card: CreditCardPayment.new,
  qr_pay: QRPayPayment.new
}
buy(3000, payments[:cash])