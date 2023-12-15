# Player Class in Ruby

class Player
    attr_reader :name, :lives, :scores
  
    def initialize(name)
      @name = name
      @lives = 3
      @scores = 0
    end
  
    def answer_question(num1, num2)
      puts "#{@name}, what is #{num1} + #{num2}?"
      answer = gets.chomp.to_i
      if answer == num1 + num2
        puts "Correct! #{@name} got a point!"
        @scores += 1
      else
        puts "Incorrect! #{@name} loses a life!"
        @lives -= 1
      end
    end
  
    def out_of_lives?
      @lives <= 0
    end
  end
  