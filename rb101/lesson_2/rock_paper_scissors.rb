
require 'yaml'
MESSAGES = YAML.load_file('rock_paper_scissors.yml')

CHOICE_LIST = Hash['r', 'rock',
                   'p', 'paper',
                   'sc', 'scissors',
                   'l', 'lizard',
                   'sp', 'spock']

WINNING_PAIRS = Hash['rock', %w(lizard scissors),
                     'paper', %w(rock spock),
                     'scissors', %w(paper lizard),
                     'lizard', %w(spock paper),
                     'spock', %w(scissors rock)]

scores = Hash['player', 0,
              'computer', 0]

def messages(message)
  MESSAGES[message]
end

def prompt(key)
  puts("=> #{key}")
end

def validate_s_input
  letter = ''

  loop do
    letter = gets.chomp.downcase
    break unless letter == 's'
    prompt messages "invalid_s_input"
  end
  letter
end

def validate_input
  choice = ''

  loop do
    prompt messages "input_message"
    choice = validate_s_input

    break unless !(CHOICE_LIST.key?(choice))
    prompt messages "invalid_input"
  end
  choice
end

def obtain_my_choice
  str = validate_input
  CHOICE_LIST[str]
end

def obtain_computer_choice
  CHOICE_LIST[CHOICE_LIST.keys.sample()]
end

def display_choices(my_choice, computer_choice)
  prompt "You chose #{my_choice} and the computer chose #{computer_choice}"
end

def win?(my_choice, computer_choice)
  if WINNING_PAIRS[my_choice].include?(computer_choice)
    'player'
  elsif WINNING_PAIRS[computer_choice].include?(my_choice)
    'computer'
  end
end

def display_results(winner)
  if winner
    prompt messages winner
  else
    prompt messages 'tie'
  end
end

def display_current_scores(hsh)
  prompt "Scores: player #{hsh['player']}, computer #{hsh['computer']}"
end

def increment_score(scores, winner)
  scores[winner] += 1 if winner
end

def grand_winner?(scores)
  !(scores.values.include?(5))
end

def play_again?
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def print_grand_winner_message(scores)
  if scores['player'] == 5
    prompt messages "grand_winner_player"
  elsif scores['computer'] == 5
    prompt messages "grand_winner_computer"
  else
    prompt messages "not_grand_winner"
  end
end

def clear_screen
  system('clear') || system('cls')
end

clear_screen

prompt messages "welcome"
my_choice = ''

loop do
  my_choice = obtain_my_choice
  computer_choice = obtain_computer_choice
  display_choices(my_choice, computer_choice)
  round_winner = win?(my_choice, computer_choice)
  display_results(round_winner)
  increment_score(scores, round_winner)
  display_current_scores(scores)
  break unless grand_winner?(scores)
  prompt messages "continuation_prompt"
  break unless play_again?
  clear_screen
end

clear_screen
print_grand_winner_message(scores)
prompt messages "thanks"
