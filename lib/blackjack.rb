def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  return rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  sum = deal_card
  new_sum = deal_card               #deal_card is being called here
  card_total = sum + new_sum
  display_card_total(card_total)
  return card_total                 #need to return card_total to use elsewhere
end

def hit? (card_total)
  prompt_user
  answer = get_user_input #call get_user_input only once, not multiple times.
    if answer == 's'      # and variable = value, not other way around.  But it gets called.
      return card_total
    elsif answer == 'h'
      new_card = deal_card
      new_card_total = new_card + card_total
      display_card_total(new_card_total)
      return new_card_total
    else invalid_command
    end
  return card_total
end

def invalid_command
  puts "Please enter a valid command"
  prompt_user
end


#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round
  until card_total > 21
    card_total = hit?(card_total)
  end
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end
