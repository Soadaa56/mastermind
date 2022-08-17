# mastermind.rb
require 'pry-byebug'

class Mastermind
  def initialize
    player_computer_roles
    setup_code
  end


  def player_computer_roles
    @player = ''
    @computer = ''
    puts 'Do you want to be the Code Master(1) or the Guesser(2)?'
    answer = gets.chomp.to_i
    if answer != 1 && answer != 2
      puts 'Invalid ouput, try again.'
      player_computer_roles
    elsif answer == 1
      puts 'You chose Code Master.'
      puts "\n"
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
    @code = Array.new
    if @player == :code_master
      until valid_code?(@code) do
        # sleep(2)
        puts 'Your secret code will be a length  of four inputs, with the option'
        puts 'of 6 diffrent colors. Input the intial(s) of the color.'
        # sleep (5)
        puts 'Red (r), Blue (b), Green (g), Purple (pu), Orange (o), and Pink (pi).'
        puts "\n"
        # sleep(2.5)
        puts "Input the first code color:"
        @code[0] = gets.chomp.downcase
        puts "Input the second code color:"
        @code[1] = gets.chomp.downcase
        puts "Input the third code color:"
        @code[2] = gets.chomp.downcase
        puts "Input the fourth code color:"
        @code[3] = gets.chomp.downcase
        # valid_code?(@code)
        puts @code
      end
    else
      puts 'Setting up code...'
      # sleep(0.5)
      puts 'Please wait while our top CPU\'s pick only the hardest to decipher code.'
      # sleep(0.8)
      puts 'This may take anywhere from a few seconds to a few hours depending on your altitude.'
      # sleep(3)
      puts "..."
      # sleep(1)
      computer_choose_code
    end
  end

  def valid_code?(code)
    @valid_colors = ['r','b','g','pu','o','pi']
    if !code.empty? && code.all? { |color| @valid_colors.include?(color) }
      return true
      puts "success"
    else
      return false
      puts "false"
    end
  end
end

class Player
end

class Computer
end

game = Mastermind.new
game