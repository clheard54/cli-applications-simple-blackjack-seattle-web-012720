def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
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
  first_card = deal_card
  second_card = deal_card
  sum = first_card + second_card
  display_card_total(sum)
  sum
end

def invalid_command
  puts "Please enter a valid command"
end

def hit?(current_total)
  prompt_user
  choice = get_user_input
  if choice == 'h'
    new = deal_card
    current_total += new
    return current_total
  elsif choice == 's'
    return current_total
  else
    invalid_command
    hit?(current_total)
  end
end


#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome 
  sum = initial_round
  while sum < 21 do
    new_total = hit?(sum)
    display_card_total(new_total)
    sum = new_total
  end
  if sum == 21
    puts "Blackjack!"
  elsif sum > 21
    end_game(sum)
  end
end