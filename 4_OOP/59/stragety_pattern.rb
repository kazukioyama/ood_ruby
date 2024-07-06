# Strategeyパターン

# strategyのインターフェース（抽象クラス）
class AbstractStrategy
  def do
  end
end

# stratetyの具体クラス
class StrategeyA < AbstractStrategy
  def do
    super
    puts "StrategeyA"
  end
end

class StrategeyB < AbstractStrategy
  def do
    super
    puts "StrategeyB"
  end
end

class StrategeyA < AbstractStrategy
  def do
    super
    puts "StrategeyA"
  end
end

# クライアント（抽象クラス(インターフェース)にのみ依存していて、具象クラスには依存していない)
def client(strategy) # strategyにはAbstractStrategyのサブクラスだけ渡せる
  strategy.do
end
# →do関数を使える前提の処理になっているので、いわゆるダックタイピングの性質でもある