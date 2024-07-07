# 良くない設計の例(Decoratorパターンにする前)

# ベースのコーヒークラス
class Coffee
  def cost
    return 200
  end

  def desription
    return "コーヒー"
  end
end

# 生クリームをトッピングしたコーヒー
class CreamCoffee < Coffee
  def cost
    return super + 50
  end

  def desription
    return "#{super}、生クリーム"
  end
end

# バニラアイスをトッピングしたコーヒー
class VanillaCoffee < Coffee
  def cost
    return super + 70
  end

  def desription
    return "#{super}、バニラアイス"
  end
end

# このようにトッピング毎にクラスを増やすと、(トッピングを2種類以上組み合せる場合に)その都度クラスを作る必要が出てきてしまう
# →それを解決するのが「Decorator」パターン
# →→以下のように呼び出せるようにする

## Decoratorパターンを使った場合の呼び出し
## coffee = Coffee.new
## coffee_with_cream = CreamDecorator(coffee) #注意：インスタンス化して呼び出していない
## coffee_with_vanilla = VanillaDecorator(coffee)
## coffee_with_cream_and_vanilla = VanillaDecorator(coffee_with_vanilla) #トッピングの組み合わせを追加(このように呼び出し側で1行追加するだけ)