require_relative 'app'

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
