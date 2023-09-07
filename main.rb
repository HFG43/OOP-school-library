require_relative 'app'

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

def handle_menu_choice(choice, app)
  case choice
  when 1 then app.list_all_books
  when 2 then app.list_all_people
  when 3 then app.create_person
  when 4 then app.create_a_book
  when 5 then app.create_a_rental
  when 6 then app.rental_person_id
  end
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
