# LSPを満たしていないコード（置換不可能）

# 基本型（親クラス）
class Bird
  def fly
    "飛びます"
  end
end

# 派生型（子クラス）
class Penguin < Bird
  def fly
    raise StandardError, "飛べません"
  end
end

def bird_fly(bird)
  puts bird.fly()
end

bird = Bird.new
penguin = Penguin.new

bird_fly(bird) # 出力してくれる
bird_fly(penguin) # 例外が発生して出力してくれない

# →上の基本型(Bird)とは同様に扱えていないので、LSPに反する