# mastermind.rb
require 'pry-byebug'

class Mastermind

  @@valid_colors = ['r','b','g','pu','o','pi']
  @@code = Array.new
  @@code_length = 4
  @@guess = Array.new
  @@attempt_counter = 0
  @@game_over = false
  @player = ''
  @computer = ''
  @current_guess_of_code = Array.new

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
        puts "#{@@code}"
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
      computer_setup_code_to_guess
    end
  end

  def valid_code?
    if !@@code.empty? && @@code.all? { |color| @@valid_colors.include?(color) }
      puts 'Successfully made your secret code.'
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

  def computer_setup_code_to_guess
    @@code_length.times do
      @@code.push(@@valid_colors.sample)
    end
  end

  def guess_code
    if @player == :guesser
      puts "\n"
      player_to_guess_code
    else
      puts "\n"
      puts 'The computer will now crack your code.'
      computer_code_cracker
    end
  end

  def player_to_guess_code
    puts 'You will have 6 colors to choose from (red, blue, green, purple, orange and pink).'
    attempt_number_counter
    if @@game_over == false
      until valid_guess? do
        puts 'Input the 4 colors you want to guess(r, b, g, pu, o, pi).'
        puts 'Input 1:'
        @@guess[0] = gets.chomp.downcase
        puts 'Input 2:'
        @@guess[1] = gets.chomp.downcase
        puts 'Input 3:'
        @@guess[2] = gets.chomp.downcase
        puts 'Input 4:'
        @@guess[3] = gets.chomp.downcase
        end
    end
    binding.pry
    check_guess
  end

  def attempt_number_counter
    @@attempt_counter += 1
    if @@attempt_counter == 13
      @@game_over = true
      game_over_failure
    end
  end

  def valid_guess?
    if !@@guess.empty? && @@guess.all? { |color| @@valid_colors.include?(color) }
      return true
    elsif !@@guess.empty?
      puts 'Invalid code, please try again'
      puts "\n"
      sleep(1)
      return false
    else
      return false
    end
  end

  def check_guess
   if @@guess == @@code
    game_over_victory
   else
    puts "Guess number ##{@@attempt_counter}: #{@@guess}, was wrong. Try again"
    @@guess == Array.new
    player_to_guess_code
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

game = Mastermind.new
game