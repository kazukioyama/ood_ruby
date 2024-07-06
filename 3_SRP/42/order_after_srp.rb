#在庫管理クラス
class Inventory
  def check
    puts "在庫を確認します"
  end

  def reduce
    puts "在庫を減らします"
  end
end

#支払い処理クラス
class Payment
  def process
    puts "支払いを処理します"
  end
end

#配送処理クラス
class Shipping
  def ship_order
    puts "注文を出荷します"
  end
end


#注文処理
inventory = Inventory.new
payment = Payment.new
shipping = Shipping.new

inventory.check
inventory.reduce
payment.process
shipping.ship_order


#単一責任にできたが、注文処理の記述(呼び出し部分)が多くなってしまっている
# →これを解決するためにFacadeパターンを使う
