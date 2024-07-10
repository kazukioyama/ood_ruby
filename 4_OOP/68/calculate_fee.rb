# カラオケ料金計算の関数

# 良くないコード
def calculate_fee(hours, is_student, is_member)
  base_rate = 700
  discount_rate = 1.0

  if is_student && is_member
    discount_rate = 0.8 * 0.9
  elsif is_student
    discount_rate = 0.8
  elsif is_member
    discount_rate = 0.9
  end

  total_fee = hours * base_rate * discount_rate
  return total_fee
end


# 修正後(Decoratorクラス)
## Feeのインターフェース（抽象クラス）
class AbstractRoomFee
  def base_rate
  end

  def discount_rate
  end
end

## Feeの具象クラス（通常料金）
class BaseFee < AbstractFee
  def base_rate
    700
  end

  def discount_rate
    1.0
  end
end

## デコレーターのインターフェース（抽象クラス）
class FeeDecorator
  def initialize(abstract_fee)
    @abstract_fee = abstract_fee
  end

  def base_rate
    @abstract_fee.base_rate
  end

  def discount_rate
    @abstract_fee.discount_rate
  end
end

## デコレーターの具象クラス（学生料金用）
class StudentFeeDecorator < FeeDecorator
  def base_rate
    super
  end

  def discount_rate
    super * 0.8
  end
end

## デコレーターの具象クラス（会員料金用）
class MemberFeeDecorator < FeeDecorator
  def base_rate
    super
  end

  def discount_rate
    super * 0.9
  end
end

# 合計金額の計算
def calculate_total_fee(hours, abstract_fee)
  hours * abstract_fee.base_rate * abstract_fee.discount_rate
end


# 呼び出し
fee = BaseFee.new
student_fee = StudentFeeDecorator.new(fee)
member_fee = MemberFeeDecorator.new(fee)
student_and_member_fee = MemberFeeDecorator.new(student_fee)

puts calculate_total_fee(2, fee) #通常料金(5時間)
puts calculate_total_fee(2, student_fee) #学生料金(5時間)
puts calculate_total_fee(2, member_fee) #会員料金(5時間)
puts calculate_total_fee(2, student_and_member_fee) #学生&会員料金(5時間)



# シニア料金を追加する場合
## デコレーターの具象クラス（シニア料金用）
class SeniorFeeDecorator < FeeDecorator
  def base_rate
    super
  end

  def discount_rate
    super * 0.7
  end
end
## 呼び出し
senior_fee = SeniorFeeDecorator.new(fee)
senior_and_member_fee = MemberFeeDecorator.new(senior_fee)
puts calculate_total_fee(3, senior_fee) #シニア料金(2時間)
puts calculate_total_fee(3, senior_and_member_fee) #シニア&会員料金(2時間)
# →元々の実装(オブジェクト)を一切汚さずに、シニア料金を追加できた