require_relative 'app'
require_relative 'menu_choice'

def options_menu
  puts 'Please choose your menu option!'
  puts "\n"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for person(id)'
  puts '7 - Exit'
  puts "\n"
end

def main
  app = App.new

  puts "\n"
  puts 'Welcome to the School Library App!!'
  puts "\n"

  loop do
    options_menu
    choice = gets.chomp.to_i
    exit if choice == 7
    handle_menu_choice(choice, app)
  end
end

main
