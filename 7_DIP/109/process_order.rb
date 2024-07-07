# DIPに違反しているコード（旧来の構造化プログラミングの形）

# 上位モジュール（内側）
## eコマースの注文処理（下位モジュールのメソッドを呼び出しているので、下位に依存してしまっている）
def process_order(user_name, product_name)
  if !validate_user(user_name)
    return "無効なユーザです"
  elsif !check_stock(product_name)
    return "在庫切れです"
  elsif !make_payment(user_name, product_name)
    return "購入額が足りません"
  end

  update_stock(product_name)
  return "注文処理が完了しました"
end

# 下位モジュール（外側）
def validate_user(user_name)
  #ユーザの有効性をチェック
  true
end

def check_stock(product_name)
  #在庫をチェック
  true
end

def make_payment(user_name, product_name)
  #支払いを処理
  true
end

def update_stock(product_name)
  puts "在庫更新中"
  #在庫を更新
end

puts process_order("kazukioyama", "MacbookPro")