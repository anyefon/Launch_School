class Score
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

  private

  attr_reader :name, :scores
end

class Move
  attr_accessor :value

  def >(other_obj)
    losers.include?(other_obj.value)
  end

  private

  attr_accessor :losers

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
end

class Rock < Move
  def initialize
    @value = 'rock'
    @losers = ['scissors', 'lizard']
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
    @losers = ['rock', 'spock']
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
    @losers = ['lizard', 'paper']
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
    @losers = ['paper', 'spock']
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
    @losers = ['rock', 'scissors']
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @rock = Rock.new
    @paper = Paper.new
    @scissors = Scissors.new
    @lizard = Lizard.new
    @spock = Spock.new
    @values = Hash['rock', @rock, 'paper', @paper, 'scissors', @scissors,
                   'lizard', @lizard, 'spock', @spock]
    @history = Hash.new(0)
  end

  private

  def add_history
    history[move.value] += 1
  end

  attr_reader :history, :values
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, spock or lizard:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid input."
    end
    self.move = values[choice]
    add_history
  end

  def to_s
    history.inspect
  end

  private

  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.match(/[^a-zA-Z]/)
      puts "Sorry, must enter a valid name."
    end
    self.name = n.capitalize
  end
end

class Computer < Player
  attr_accessor :personality

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

  def choose
    sampled_move = robots[name].personality.sample
    self.move = values[sampled_move]
    add_history
  end

  def to_s
    history.inspect
  end

  private

  attr_reader :robots

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end
end

class R2D2 < Computer
  def initialize
    @personality = ['rock']
  end
end

class Hal < Computer
  def initialize
    @personality = ['scissors'] * 4 + ['rock']
  end
end

class Chappie < Computer
  def initialize
    @personality = ['paper', 'lizard', 'spock']
  end
end

class Sonny < Computer
  def initialize
    @personality = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  end
end

class Number5 < Computer
  def initialize
    @personality = ['spock'] * 5 + ['lizard'] * 4 +
                   ['scissors'] * 3 + ['paper'] * 2 + ['rock']
  end
end

class RPSGame
  GRAND_SCORE = 10

  def initialize
    initialize_game
    @human = Human.new
    @computer = Computer.new
    human.score = Score.new(human.name)
    computer.score = Score.new(computer.name)
  end

  def play
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      increment_n_display_scores
      break unless play_again? || grand_winner?
      clear_screen
    end
    conclude_game
  end

  private

  attr_accessor :human, :computer

  def initialize_game
    clear_screen
    display_welcome_message
    display_rules
    clear_screen
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
  end

  def display_game_rules
    puts "Here are the rules:"
    puts "---------------------------------------"
    puts "1. There are five moves: rock, paper, scissors, lizard, spock."
    puts " Scissors cuts Paper covers Rock crushes Lizard poisons Spock smashes"
    puts " Scissors decapitates Lizard eats Paper disproves Spock vaporizes"
    puts " Rock crushes Scissors."
    puts "2. Out of the five moves, choose one at a time."
    puts "3. The winner of each round will increment score by one."
    puts "3. Be the first to reach a score of ten and win a prize."
  end

  def display_rules
    display_game_rules

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
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def increment_score
    if human.move > computer.move
      human.score.increment
    elsif computer.move > human.move
      computer.score.increment
    end
  end

  def display_scores
    puts "#{human.name} = #{human.score.show_score}"
    puts "#{computer.name} = #{computer.score.show_score}"
  end

  def increment_n_display_scores
    increment_score
    display_scores
  end

  def display_history
    puts "#{human.name.capitalize} made the following moves: "
    puts human
    puts "#{computer.name.capitalize} made the following moves: "
    puts computer
  end

  def grand_winner?
    (human.score.show_score == GRAND_SCORE) ||
      (computer.score.show_score == GRAND_SCORE)
  end

  def display_grand_winner
    if human.score.show_score == GRAND_SCORE
      puts "#{human.name} is the grand winner!"
    elsif computer.score.show_score == GRAND_SCORE
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

    ['y', 'yes'].include?(answer.downcase)
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
end

RPSGame.new.play
