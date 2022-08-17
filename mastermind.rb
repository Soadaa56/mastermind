# mastermind.rb
require 'pry-byebug'

class Mastermind
  def initialize
    player_computer_roles
    setup_code
  end

  @player = ''
  @computer = ''
  @code = Array.new
  @valid_colors = ['r','b','g','pu','o','pi']

  def player_computer_roles
    puts 'Do you want to be the Code Master(1) or the Guesser(2)?'
    answer = gets.chomp.to_i
    if answer != 1 && answer != 2
      puts 'Invalid ouput, try again.'
      player_computer_roles
    elsif answer == 1
      puts 'You chose Code Master.'
      @player = :code_master
      @computer = :guesser
    elsif answer == 2
      puts 'You chose Guesser.'
      @player = :guesser
      @computer = :code_master
    else
      puts 'Error -.-'
    end
  end

  def setup_code()
    if @player == :code_master
      until valid_code?(@code)
        puts 'Your secret code will be a length  of four inputs, with the option'
        puts 'of 6 diffrent colors. Input the intial(s) of the color.'
        puts 'Red (r), Blue (b), Green (g), Purple (pu), Orange (o), and Pink (pi).'
        puts "Input the first code color:"
        @code[1] = gets.chomp.downcase
        puts "Input the second code color:"
        @code[2] = gets.chomp.downcase
        puts "Input the third code color:"
        @code[3] = gets.chomp.downcase
        puts "Input the fourth code color:"
        @code[4] = gets.chomp.downcase
        valid_code?(@code)
      end
    else
      
    end
  end

  def valid_code?(code)
    if @code.all? { |key, color| @valid_colors.include?(color) }
      puts "test"
      return true
    else
      return false
    end
  end
end

class Player
end

class Computer
end

game = Mastermind.new
game