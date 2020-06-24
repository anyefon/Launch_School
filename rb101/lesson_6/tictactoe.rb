WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_PLAYER = 'choose'
CONTENDERS = Hash['p', 'player', 'c', 'computer']
scores = Hash['Player', 0, 'Computer', 0]

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def display_score(scores)
  clear_screen
  prompt "Scores Player:#{scores['Player']} Computer:#{scores['Computer']}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts " You're #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER}"
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def validate_input?(letter)
  CONTENDERS.keys.include?(letter)
end

def choose_first_player
  prompt "Enter p for 'player' or c for 'computer' "
  letter = ''
  loop do
    letter = gets.chomp
    break unless !(validate_input?(letter))
    prompt "Invalid input. Enter p for 'player' or c for 'computer' "
  end
  CONTENDERS[letter]
end

def initialize_player
  if FIRST_PLAYER == 'choose'
    choose_first_player
  else
    FIRST_PLAYER
  end
end

def empty_spaces(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr[-1]
  when 2 then "#{arr.first} #{word} #{arr.last}"
  else
    arr[-1] = "#{word} #{arr[-1]}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (#{joinor(empty_spaces(brd))})"
    square = gets.chomp.to_i
    break if empty_spaces(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  square = 5 if empty_spaces(brd).include?(5)

  square = empty_spaces(brd).sample if !square
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  else
    'player'
  end
end

def board_full?(brd)
  empty_spaces(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def keep_score!(scores, brd)
  scores[detect_winner(brd)] += 1
end

first_taker = initialize_player

loop do
  current_player = first_taker
  board = initialize_board

  loop do
    display_score(scores)
    display_board(board)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_score(scores)
  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} wins this round!"
    keep_score!(scores, board)
  else
    prompt "It's a tie!"
  end

  if scores.values.include?(5)
    clear_screen
    prompt "#{scores.key(5)} is the super winner!"
    break
  else
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

unless scores.values.include?(5)
  clear_screen
  prompt "Not the super winner yet. Better luck next time."
end
prompt "Scores Player:#{scores['Player']} Computer:#{scores['Computer']}"
prompt "Thanks for playing Tictactoe! Goodbye!"
