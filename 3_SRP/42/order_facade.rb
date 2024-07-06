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

class OrderFacade
  attr_reader :inventory, :payment, :shipping
  def initialize(inventory, payment, shipping)
    @inventory = inventory
    @payment = payment
    @shipping = shipping
  end

  def place_order
    @inventory.check
    @inventory.reduce
    @payment.process
    @shipping.ship_order
  end
end

#呼び出し
order_facade = OrderFacade.new(Inventory.new, Payment.new, Shipping.new)
order_facade.place_order

#Facadeパターン（「複雑なオブジェクト操作の手順をまとめて、簡単なインターフェースを提供するパターン」）を使用
# →呼び出し側で処理の中身を意識する必要がなくなった（呼び出し側は、place_orderというメソッドのみ知っていれば良くなった）
# →→注文の処理手続き(呼び出し順など)を変える場合でも、Facadeの中身を変えるだけで良くなった
