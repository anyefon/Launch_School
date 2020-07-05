WHATEVER_ONE = 21
MIN_HIT = 17
MAX_SCORE = 5
SUITS = ['hearts', 'diamonds', 'clubs', 'spades']
VALUES = Hash['2', 2, '3', 3, '4', 4, '5', 5, '6', 6, '7', 7, '8', 8, '9', 9,
              '10', 10, 'Jack', 10, 'Queen', 10, 'King', 10, 'Ace', 11]
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack',
         'Queen', 'King', 'Ace']
scores = Hash[:player, 0, :dealer, 0]

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def display_instructions
  clear_screen
  puts "============================================"
  prompt "     *****Welcome to Twenty-One!*****"
  prompt "Some rules"
  prompt "First contender to attain a score of five is the winner"
  prompt "Don't lose!"
  puts "============================================"
end

def continue_to_game
  loop do
    prompt "Input any key and press 'Enter' to continue: "
    answer = gets.chomp
    break if answer
  end
end

def initialize_deck(cards)
  new_deck = {}
  SUITS.each do |suit|
    new_deck[suit] = cards.clone
  end
  new_deck
end

def hit(deck)
  hsh_key = deck.to_a.sample.first
  value = deck[hsh_key].sample
  deck[hsh_key].delete(value) + hsh_key[0]
end

def deal_cards(deck)
  cards = []

  2.times { |_| cards << hit(deck) }
  cards
end

def hit_or_stay
  player_turn = nil

  loop do
    prompt "Would you like to (h)it or (s)tay?"
    player_turn = gets.chomp.downcase
    break if ['h', 's'].include?(player_turn)
    prompt "Sorry, must enter 'h' or 's'."
  end

  player_turn
end

def total(arr)
  cloned_arr = arr.clone
  cloned_arr.map! { |i| i[0..-2] }
  values = VALUES.values_at(*cloned_arr)
  sum = values.sum

  if sum > WHATEVER_ONE
    values.select { |i| i == 11 }.each do |_|
      sum -= 10
      break if sum < WHATEVER_ONE
    end
  end
  sum
end

def player_turn(player_hand, deck, player_total)
  if player_total == WHATEVER_ONE
    prompt "You have reached the limit, advise you (s)tay"
    player_turn = 's'
  else
    player_turn = hit_or_stay
  end

  if hit?(player_turn)
    player_hand << hit(deck)
    player_total = total(player_hand)
    prompt "You chose to hit!"
    prompt "Your cards are now: #{player_hand}"
    prompt "Your total is now: #{player_total}"
  end
  [player_turn, player_total]
end

def dealer_turn(dealer_hand, deck)
  prompt "Dealer hits!"
  dealer_hand << hit(deck)
  dealer_total = total(dealer_hand)
  prompt "Dealer's card are now: #{dealer_hand}"
  dealer_total
end

def hit?(player_turn)
  player_turn == 'h'
end

def stay?(player_turn)
  player_turn == 's'
end

def busted?(whoever_total)
  whoever_total > WHATEVER_ONE
end

def winner?(scores)
  scores.values.include?(MAX_SCORE)
end

def keep_score!(scores, scorer)
  scores[scorer] += 1
end

def detect_results(dealer_total, player_total, scores)
  if player_total > WHATEVER_ONE
    keep_score!(scores, :dealer)
    :player_busted
  elsif dealer_total > WHATEVER_ONE
    keep_score!(scores, :player)
    :dealer_busted
  elsif player_total < dealer_total
    keep_score!(scores, :dealer)
    :dealer
  elsif player_total > dealer_total
    keep_score!(scores, :player)
    :player
  else
    :tie
  end
end

def display_results(dealer_total, player_total, scores)
  result = detect_results(dealer_total, player_total, scores)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_cards(dealer_hand, player_hand, dealer_total, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_hand}, for a total of: #{dealer_total}"
  prompt "Player has #{player_hand}, for a total of: #{player_total}"
  puts "=============="
end

def display_score(scores)
  prompt "Scores Player:#{scores[:player]} Dealer:#{scores[:dealer]}"
end

def displays(dealer, player, dealer_total, player_total, scores)
  display_cards(dealer, player, dealer_total, player_total)
  display_results(dealer_total, player_total, scores)
end

def display_match_winner(scores)
  prompt "#{scores.key(MAX_SCORE).capitalize} is the super winner!"
end

def play_again?
  answer = ''

  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  loop do
    answer = gets.chomp.downcase
    break if ['y', 'n', 'yes', 'no'].include?(answer)
    prompt "Invalid input. Enter 'y', 'yes', 'no' or 'n'"
  end
  ['y', 'yes'].include?(answer)
end

display_instructions
continue_to_game

loop do
  clear_screen
  display_score(scores)
  deck = initialize_deck(cards)
  player_hand = deal_cards(deck)
  dealer_hand = deal_cards(deck)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)
  prompt "Dealer has: #{dealer_hand.first} and unknown card"
  prompt "You have: #{player_hand[0]} and #{player_hand[-1]}"

  # player's turn
  loop do
    player_choice, player_total = player_turn(player_hand, deck, player_total)

    break if stay?(player_choice) || busted?(player_total)
  end

  if busted?(player_total)
    displays(dealer_hand, player_hand, dealer_total, player_total, scores)

    if winner?(scores)
      display_match_winner(scores)
      break
    else
      prompt "Not the super winner yet!"
      play_again? ? next : break
    end
  else
    prompt "You stayed at #{player_total}"
  end
  # dealer's turn

  prompt "Dealer's turn..."

  loop do
    break if dealer_total >= MIN_HIT

    dealer_total = dealer_turn(dealer_hand, deck)
  end

  if busted?(dealer_total)
    prompt "Dealer total is now: #{dealer_total}"
    displays(dealer_hand, player_hand, dealer_total, player_total, scores)
    if winner?(scores)
      display_match_winner(scores)
      break
    else
      prompt "Not the super winner yet!"
      play_again? ? next : break
    end
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  displays(dealer_hand, player_hand, dealer_total, player_total, scores)
  if winner?(scores)
    display_match_winner(scores)
    break
  else
    prompt "Not the super winner yet!"
    break unless play_again?
  end
end

display_score(scores)
prompt "Thank you for playing Twenty-One! Good bye!"
