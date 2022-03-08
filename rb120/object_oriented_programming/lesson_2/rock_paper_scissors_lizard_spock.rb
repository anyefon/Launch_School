class Score
  attr_reader :name, :scores

  def initialize(name)
    @name = name
    @scores = Hash.new(0)
    scores[name] = 0
  end

  def increment
    scores[name] += 1
  end

  def show_score
    scores.values.first
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  attr_reader :choice

  def initialize(choice)
    @rock = Rock.new
    @paper = Paper.new
    @scissors = Scissors.new
    @lizard = Lizard.new
    @spock = Spock.new
    @values = Hash['rock', @rock, 'paper', @paper, 'scissors', @scissors,
                   'lizard', @lizard, 'spock', @spock]
    @choice = @values[choice]
  end
end

module Retrievable
  def value
    @value
  end

  def losers
    @losers
  end
end

class Rock
  include Retrievable

  def initialize
    @value = 'rock'
    @losers = ['scissors', 'lizard']
  end
end

class Paper
  include Retrievable

  def initialize
    @value = 'paper'
    @losers = ['rock', 'spock']
  end
end

class Scissors
  include Retrievable

  def initialize
    @value = 'scissors'
    @losers = ['lizard', 'paper']
  end
end

class Lizard
  include Retrievable

  def initialize
    @value = 'lizard'
    @losers = ['paper', 'spock']
  end
end

class Spock
  include Retrievable

  def initialize
    @value = 'spock'
    @losers = ['rock', 'scissors']
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @history = Hash.new(0)
  end

  def add_history
    history[move.value] += 1
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value"
    end
    self.name = n
  end

  def choose
    input = nil
    loop do
      puts "Please choose rock, paper, scissors, spock or lizard:"
      input = gets.chomp.downcase
      break if Move::VALUES.include?(input)
      puts "Sorry, invalid input."
    end
    self.move = Move.new(input).choice
    add_history
  end

  def to_s
    history.inspect
  end
end

class Computer < Player
  attr_reader :robots

  def initialize
    super
    @r2d2 = R2D2.new
    @hal = Hal.new
    @chappie = Chappie.new
    @sonny = Sonny.new
    @number5 = Number5.new
    @robots = Hash['R2D2', @r2d2, 'Hal', @hal,
                   'Chappie', @chappie, 'Sonny', @sonny,
                   'Number 5', @number5]
  end

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    sampled_move = robots[name].personality.sample
    self.move = Move.new(sampled_move).choice
    add_history
  end

  def to_s
    history.inspect
  end
end

module Personable
  def personality
    @personality
  end
end

class R2D2
  include Personable

  def initialize
    @personality = ['rock']
  end
end

class Hal
  include Personable

  def initialize
    @personality = ['scissors'] * 4 + ['rock']
  end
end

class Chappie
  include Personable

  def initialize
    @personality = ['paper', 'lizard', 'spock']
  end
end

class Sonny
  include Personable

  def initialize
    @personality = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  end
end

class Number5
  include Personable

  def initialize
    @personality = ['spock'] * 5 + ['lizard'] * 4 +
                   ['scissors'] * 3 + ['paper'] * 2 + ['rock']
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    initialize_game
    @human = Human.new
    @computer = Computer.new
    human.score = Score.new(human.name)
    computer.score = Score.new(computer.name)
  end

  def initialize_game
    clear_screen
    display_welcome_message
    display_rules
    clear_screen
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
  end

  def game_rules
    puts "Here are the rules:"
    puts "---------------------------------------"
    puts "1. There are five moves: rock, paper, scissors, lizard, spock."
    puts "2. Choose a move out of the about list."
    puts "3. Be the first to reach a score of ten and win a prize."
  end

  def display_rules
    game_rules

    loop do
      puts
      puts "If you understand the rules, press any key to continue"
      key = gets.chomp
      break if key
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."
  end

  def display_winner
    player1 = human.move
    player2 = computer.move

    if player1.value == player2.value
      puts "It's a tie!"
    elsif player1.losers.include?(player2.value)
      puts "#{human.name} won!"
    else
      puts "#{computer.name} won!"
    end
  end

  def increment_score
    player1 = human.move
    player2 = computer.move

    if player1.losers.include?(player2.value)
      human.score.increment
    elsif player2.losers.include?(player1.value)
      computer.score.increment
    end
  end

  def display_scores
    puts "#{human.name} = #{human.score.show_score}"
    puts "#{computer.name} = #{computer.score.show_score}"
  end

  def display_history
    puts "#{human.name.capitalize} made the following moves: "
    puts human
    puts "#{computer.name.capitalize} made the following moves: "
    puts computer
  end

  def grand_winner?
    (human.score.show_score == 10) || (computer.score.show_score == 10)
  end

  def display_grand_winner
    if human.score.show_score == 10
      puts "#{human.name} is the grand winner!"
    elsif computer.score.show_score == 10
      puts "#{computer.name} is the grand winner!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp
      break if ['y', 'n', 'yes', 'no'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return true if ['y', 'yes'].include?(answer.downcase)
    return false if ['n', 'no'].include?(answer.downcase)
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def conclude_game
    clear_screen
    display_history
    display_scores
    display_goodbye_message
  end

  def play
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      increment_score
      if grand_winner?
        display_grand_winner
        break
      else
        display_scores
        break unless play_again?
        clear_screen
      end
    end
    conclude_game
  end
end

RPSGame.new.play
