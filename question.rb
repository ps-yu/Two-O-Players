class Question 
  def initialize(number)
    @number = number 
  end
  def check_answer()
    number1 = rand(20);
    puts number1
    number2 = rand(20);
    puts number2
    sum = number1 + number2;
    if @number == sum
      true
    else 
      false
    end
  end
end

p = Question.new(12);
puts p.check_answer