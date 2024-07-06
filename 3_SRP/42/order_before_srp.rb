def Order
  def place_order
    #在庫管理の処理
    puts "在庫を確認します"
    puts "在庫を減らします"

    #支払い処理
    puts "支払いを処理します"

    #配送処理
    puts "注文を出荷します"
  end
end

order = Order.new
order.place_order