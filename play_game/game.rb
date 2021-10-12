require_relative './player'
require_relative './question'

class Game

  def initialize
    @player1 = Player.new("A")
    @player2 = Player.new("B")
    @players = [@player1, @player2]

    @question = Question.new
    @questions = @question.questions
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end
  
  def game_loop
    @players.rotate!
    @questions.rotate!
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def game_over?
    @player1.winner? || @player2.winner?
  end

  def game_status
    puts "P#{@player1.name}: #{@player1.score} vs P#{@player2.name}: #{@player2.score}"
    if @player1.score === 0
      puts "Player #{@player2.name} wins with a score of #{@player2.score}/3"
      puts "-----GAME OVER -----"
      exit
    elsif @player2.score === 0
      puts "Player #{@player1.name} wins with a score of #{@player1.score}/3"
      puts "-----GAME OVER -----"
      exit
    end
  end

  def play
    
    until (!game_over?) do
    
      puts "----- NEW TURN --------"

      current_player = @players.first
      current_question = @questions.first
      num1 = @num1
      num2 = @num2

      puts "player #{current_player.name}: What does #{num1} plus #{num2} equals?"

      player_answer = gets.chomp
    
      correct_answer = @question.calculation(num1, num2)
    

      if Integer(player_answer) === Integer(correct_answer)
        puts "YES! You are correct."
      else
        current_player.score -= 1;
        puts "Seriously? No!"
      end

      game_status

      game_loop
      sleep 0.5
    end


  end

end