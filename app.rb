require_relative 'inputs'
require_relative 'book'
require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :books, :people, :rental

  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def list_all_books
    @books.each_with_index do |book, idx|
      puts "\n#{idx}) Book title: #{book.title}, written by #{book.author}"
    end
  end

  def list_all_people
    @people.each_with_index do |person, idx|
      puts "\n #{idx}) #{person.type} id: (#{person.id}) Name: #{person.name} age: #{person.age}"
    end
  end

  def create_person
    selected_person = selected_person_input
    name = get_person_name
    age = get_person_age

    if selected_person == 1
      create_a_student(name, age)
    elsif selected_person == 2
      create_a_teacher(name, age)
    else
      puts 'Option not recognized, please try another one'
      create_person
    end
  end

  def create_a_student(name, age)
    type = 'Student'

    classroom = assign_student_classroom
    Classroom.new(classroom)

    parent_permission = student_has_permission
    permission = (parent_permission == 'Y')
    @people.push(Students.new(classroom, type, age, name, parent_permission: permission))
    puts 'Student was created successfully'
    puts "\n"
  end

  def create_a_teacher(name, age)
    type = 'Teacher'
    specialization = get_teacher_specialization

    @people.push(Teacher.new(specialization, type, age, name))
    puts 'Teacher was created successfully'
    puts "\n"
  end

  def create_a_book
    title = get_book_title

    author = get_book_author
    puts 'Book was created successfully'
    puts "\n"

    @books.push(Book.new(title, author))
  end

  def create_a_rental
    book = select_book_for_rental
    person = select_who_will_rent
    
    date = define_rental_date
    @rental.push(Rental.new(date, @people[person], @books[book]))
    puts 'Rental was created successfully'
    puts "\n"
  end

  def rental_person_id
    id = select_person_id_for_rentals

    @rental.map do |rental|
      puts "\n On #{rental.date} rental of #{rental.book.title}, by #{rental.book.author}" if rental.person.id == id
    end
  end
end
