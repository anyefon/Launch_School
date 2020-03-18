
require 'yaml'
MESSAGES = YAML.load_file('rock_paper_scissors.yml')

CHOICE_LIST = Hash['r', 'rock',
                   'p', 'paper',
                   'sc', 'scissors',
                   'l', 'lizard',
                   'sp', 'spock']

WINNING_LIST = Hash['rock', %w(lizard scissors),
                    'paper', %w(rock spock),
                    'scissors', %w(paper lizard),
                    'lizard', %w(spock paper),
                    'spock', %w(scissors rock)]

scores = Hash['you', 0,
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
    letter = gets.chomp
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

def increment_score(score_hash, scorer)
  score_hash[scorer] += 1
end

def display_results(player, computer, scores_hsh)
  if WINNING_LIST[player].include?(computer)
    prompt messages "my_win"
    increment_score(scores_hsh, 'you')
  elsif WINNING_LIST[computer].include?(player)
    prompt messages "computer_win"
    increment_score(scores_hsh, 'computer')
  else
    prompt messages "tie"
  end
end

def clear_screen
  system('clear') || system('cls')
end

clear_screen

prompt messages "welcome"
my_choice = ''

loop do
  abbr_choice = validate_input

  my_choice = CHOICE_LIST[abbr_choice]

  computer_choice = CHOICE_LIST[CHOICE_LIST.keys.sample()]
  prompt format(messages("choice_output"), p1: my_choice, p2: computer_choice)

  display_results(my_choice, computer_choice, scores)
  p scores

  break unless !(scores.values.include?(5))

  prompt messages "continuation_prompt"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  clear_screen
end

clear_screen
prompt "#{scores.key(5)} is the grand winner!" if scores.values.include?(5)
prompt messages "thanks"
