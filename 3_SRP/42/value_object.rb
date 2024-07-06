#通常の、属性をプリミティブ型で定義したクラス（値オブジェクトではない）
class User
  attr_reader :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end
end

#これ(値オブジェクトを使わない場合)の問題点
##name（str型）はあらゆる文字を入れることができてしまうし、文字制限がないし、一部記号を脆弱性対策で無効化したいができない（ユーザ名の性質と一致しない）
##age（（int型）はあらゆる整数値を入れることができてしまう（年齢の性質と一致しない）

# →つまりユーザ名や年齢といったドメインが持つ性質と一致しない
# →→そのために使うのが値オブジェクト


# 値オブジェクト
class Username
  attr_reader :value
  def initialize(value)
    raise StandardError, 'ユーザ名は3文字以上20文字以内にしてください' if value.nil?
    raise StandardError, 'ユーザ名は3文字以上20文字以内にしてください' if (value.length < 3 || value.length > 20)

    @value = value
  end
end

class Age
  attr_reader :value
  def initialize(value)
    raise StandardError, '年齢は、は0歳以上150歳以下にしてください' if value.nil?
    raise StandardError, '年齢は、は0歳以上150歳以下にしてください' if (value < 0 || value > 150)

    @value = value
  end
end

username = Username.new('ka')
puts username.value

# Userクラスの中でガード処理をするのはなく、UserNameとAgeと属性毎に分けてそれぞれクラス作った理由(User単位ではなく、属性単位で値オブジェクトにする理由)
# →単一責任(SRP)にするため


