class Question
  attr_reader :questions

  def initialize
    @questions = ["sum" , "multiplication", "division", "minus"]
  end

  def calculation(num1,num2)
    num1 + num2
  end


end