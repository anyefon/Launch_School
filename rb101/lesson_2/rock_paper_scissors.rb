
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

def increment_score(score_hash, scorer)
  score_hash[scorer] += 1
end

def display_results(str)
  prompt messages str
end

def win?(player, computer, scores_hsh)
  if WINNING_PAIRS[player].include?(computer)
    display_results("my_win")
    increment_score(scores_hsh, 'you')
  elsif WINNING_PAIRS[computer].include?(player)
    display_results("computer_win")
    increment_score(scores_hsh, 'computer')
  else
    display_results("tie")
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

  prompt format(messages("choice_output"), p1: my_choice, p2: computer_choice)

  win?(my_choice, computer_choice, scores)
  p scores

  break unless !(scores.values.include?(5))

  prompt messages "continuation_prompt"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  clear_screen
end

clear_screen
prompt format(messages("g_mes"), wr: scores.key(5)) if scores.values.include?(5)
prompt messages "thanks"
