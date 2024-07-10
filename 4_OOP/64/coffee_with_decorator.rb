# Decoratorパターン（Coffeeのトッピング処理での例）

# コーヒーインターフェース（抽象クラス）
class AbstractCoffee
  def cost
  end

  def description
  end
end

# ベースのコーヒークラス（具象クラス）（何もトッピングされていないシンプルなコーヒー）
class Coffee < AbstractCoffee
  def cost
    return 200
  end

  def description
    return 'コーヒー'
  end
end

# コーヒーのトッピング"デコレーター"用の抽象クラス（デコレーターで"ラップ"してあげる）
class CoffeeDecorator
  def initialize(abstract_coffee)
    @decorated_coffee = abstract_coffee
  end

  def cost
    return @decorated_coffee.cost
  end

  def description
    return @decorated_coffee.description
  end
end

# コーヒーの具体的なトッピングデコレータークラス（クリーム・バニラ・etc）
class CreamDecorator < CoffeeDecorator
  def cost
    return super + 50
  end

  def description
    return "#{super}、生クリーム"
  end
end

class VanillaDecorator < CoffeeDecorator
  def cost
    return super + 70
  end

  def description
    return "#{super}、バニラ"
  end
end


# 出力用関数
def print_coffee_details(coffee)
  puts "注文：#{coffee.description}"
  puts "料金：#{coffee.cost}"
end


# 呼び出し部分
coffee = Coffee.new
## トッピング追加処理
coffee_with_cream = CreamDecorator.new(coffee) # コーヒーに生クリームをトッピング
coffee_with_vanilla = VanillaDecorator.new(coffee) # コーヒーにバニラをトッピング
coffee_with_cream_and_vanilla = VanillaDecorator.new(coffee_with_cream) # 生クリームコーヒーにバニラをトッピング
##出力
print_coffee_details(coffee) # 通常のコーヒー（トッピング無し）の出力
print_coffee_details(coffee_with_cream) # 生クリーム入りコーヒーの出力
print_coffee_details(coffee_with_vanilla) # バニラ入りコーヒーの出力
print_coffee_details(coffee_with_cream_and_vanilla) # 生クリーム&バニラ入りコーヒーの出力