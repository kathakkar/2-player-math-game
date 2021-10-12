class Player
  attr_reader :name
  attr_accessor :score

  def initialize(name)
    @name = name
    @score = 3
  end

  def winner?
     @score > 0
  end

end