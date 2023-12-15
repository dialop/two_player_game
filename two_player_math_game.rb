# 2-Player Math Game in Ruby

class Player
    attr_reader :name, :lives, :scores 


    def initialize(name)
        @name = name
        @lives = 3
        @scores = 0
    end 


    def answer_question
        puts "{name}, what is #{@num1} + #{@num2}?"
        answer = gets.chop.to_i
        if answer == @num1 + @num2
            puts "Correct! #{@name} got a point!"
            @score += 1
        else
            puts "Incorrect! #{@name} loses a life!"
            @lives -= 1
        end
    end 

    def out_of_lives?
        @lives <= 0
  end
end

class Game
  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1
  end

  def play
    while true
      @current_player.instance_variable_set(:@num1, rand(1..20))
      @current_player.instance_variable_set(:@num2, rand(1..20))

      @current_player.answer_question

      puts "Scores: #{@player1.name} - #{@player1.score}, #{@player2.name} - #{@player2.score}"

      if @current_player.out_of_lives?
        announce_winner
        break
      end

      switch_players
    end
  end

  def announce_winner
    if @player1.out_of_lives?
      puts "#{@player2.name} wins with a score of #{@player2.score}"
    else
      puts "#{@player1.name} wins with a score of #{@player1.score}"
    end
    puts "Game Over!"
  end

  def switch_players
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end
end

# Start the game with two players named "Player 1" and "Player 2"
game = Game.new("Player 1", "Player 2")
game.play