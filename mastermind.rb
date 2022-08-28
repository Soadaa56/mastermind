# mastermind.rb
require 'pry-byebug'

class Mastermind

  @@valid_colors = ['r','b','g','pu','o','pi']
  @@code = Array.new
  @@code_length = 4
  @@guess = Array.new
  @player = ''
  @computer = ''
  @current_guess_of_code = Array.new
  @attempt_counter += 1

  def initialize
    player_computer_roles
    setup_code
    guess_code
  end


  def player_computer_roles
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
    if @player == :code_master
      until valid_code? do
        # sleep(2)
        puts 'Your secret code will be a length  of four inputs, with the option'
        puts 'of 6 diffrent colors. Input the intial(s) of the color.'
        # sleep (5)
        puts 'Red (r), Blue (b), Green (g), Purple (pu), Orange (o), and Pink (pi).'
        puts "\n"
        # sleep(2.5)
        puts "Input the first code color:"
        @@code[0] = gets.chomp.downcase
        puts "Input the second code color:"
        @@code[1] = gets.chomp.downcase
        puts "Input the third code color:"
        @@code[2] = gets.chomp.downcase
        puts "Input the fourth code color:"
        @@code[3] = gets.chomp.downcase
        # valid_code?(@code)
        puts @code
      end
    else
      puts 'Setting up code...'
      # sleep(0.5)
      puts 'Please wait while our top CPU\'s pick from only the hardest to decipher codes.'
      # sleep(0.8)
      puts 'This may take up to a few hours, depending on your altitude.'
      # sleep(3)
      puts '...'
      # sleep(1)
      computer_choose_code
    end
  end

  def valid_code?
    if !@@code.empty? && @@code.all? { |color| @@valid_colors.include?(color) }
      puts 'Success'
      return true
    elsif !@@code.empty?
      puts 'Invalid code, please try again'
      puts '\n'
      sleep(1)
      return false
    else
      return false
    end
  end

  def computer_choose_code
    @@code_length.times do
      @@code.push(@@valid_colors.sample)
    end
  end

  def guess_code
    if @player == :guesser
      puts '\n'
      puts 'Guess what you think is the 4 digit code'
      player_to_guess_code
    else
      puts '\n'
      puts 'The computer will now crack your code.'
      computer_code_cracker
    end
  end

  def attempt_number_counter
    @number_counter += 1
    if @number_counter == 13
      game_over_failure
    else
      puts "Attempt ##{@attempt_number}:"
    end
  end

  def valid_guess?
    if !@@guess.empty? && @@guess.all? { |color| @@valid_colors.include?(color) }
      puts 'Success'
      return true
    elsif !@@guess.empty?
      puts 'Invalid code, please try again'
      puts '\n'
      sleep(1)
      return false
    else
      return false
    end
  end

  def player_to_guess_code
    attempt_number_counter
    until valid_guess? do
      puts 'Input the 4 colors you want to guess(r, b, g, pu, o, pi).'
      @@code_length.times do
        @@code.push(gets.chomp)
      end
    end
    check_guess
    player_to_guess_code
  end

  def check_guess
   if @@guess == @@code
    game_over_victory
   elsif 
    
   else
    
   end
  end

  def computer_to_guess_code
    attempt_number_counter
  end
  
  def computer_code_cracker

  end

  def computer_code_cracker_attempt
    
  end

  def game_over_failure
    puts 'Too bad, you didn\'t crack the code and the world is doomed!'
    puts "BTW, the code was #{@@code}."
  end

  def game_over_victory
    puts "Congratulations, you figured out the code was #{@@guess}!"
  end

end

class Player
end

class Computer
end

game = Mastermind.new
game