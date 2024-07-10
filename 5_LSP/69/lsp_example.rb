#　LSPを満たすコード（派生型を、基本型(継承元の親クラス)と同様に扱える(置換可能))

# 基本型（親クラス）
class Bird
  def fly
    "飛びます"
  end
end

# 派生型（子クラス）
class Penguin < Bird
  def fly
    "飛べません"
  end
end

def bird_fly(bird)
  puts bird.fly()
end

bird = Bird.new
penguin = Penguin.new

bird_fly(bird)
bird_fly(penguin) # 基本型(Bird)と同様に扱えている！