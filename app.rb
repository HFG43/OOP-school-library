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
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    selected_person = gets.chomp.to_i

    if selected_person == 1
      create_a_student
    elsif selected_person == 2
      create_a_teacher
    else
      puts 'Option not recognized, please try another one'
      create_person
    end
  end

  def create_a_student
    type = 'Student'
    puts 'Age: '
    age = gets.chomp.to_i

    puts 'Name: '
    name = gets.chomp

    puts 'Classroom: '
    classroom = gets.chomp
    Classroom.new(classroom)

    puts 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp.capitalize
    permission = (parent_permission == 'Y')
    @people.push(Students.new(classroom, type, age, name, parent_permission: permission))
    puts 'Student was created successfully'
    puts '\n'
  end

  def create_a_teacher
    type = 'Teacher'
    puts 'Specialization: '
    specialization = gets.chomp

    puts 'Name: '
    name = gets.chomp

    puts 'Age: '
    age = gets.chomp

    @people.push(Teacher.new(specialization, type, age, name))
    puts 'Teacher was created successfully'
    puts '\n'
  end

  def create_a_book
    puts 'Book title: '
    title = gets.chomp

    puts 'Book Author: '
    author = gets.chomp
    puts 'Book was created successfully'
    puts '\n'

    @books.push(Book.new(title, author))
  end

  def create_a_rental
    puts 'Select the book (index) for rent'
    puts '\n'
    list_all_books
    book = gets.chomp.to_i

    puts 'Select the person (index) that will rent the book'
    puts '\n'
    list_all_people
    person = gets.chomp.to_i

    puts 'Define the rental date: '
    puts '\n'
    date = gets.chomp
    @rental.push(Rental.new(date, @people[person], @books[book]))
    puts 'Rental was created successfully'
    puts '\n'
  end

  def rental_person_id
    puts 'Select the person (id) to review its rentals'
    list_all_people
    id = gets.chomp.strip.to_i

    @rental.map do |rental|
      puts "\n On #{rental.date} rental of #{rental.book.title}, by #{rental.book.author}" if rental.person.id == id
    end
  end
end
