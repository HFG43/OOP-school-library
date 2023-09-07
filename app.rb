require_relative 'inputs'
require_relative 'book'
require_relative 'inputs_output'
require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'
require 'json'

class App
  include InputOutput
  attr_accessor :books, :people, :rental

  def initialize
    @books = []
    @people = []
    @rental = []
    @taked_book = []
    @taked_people = []
    @taked_rental = []
  end

  def list_all_books
    read_file_book if @books == []
    @books.each_with_index do |book, idx|
      puts "\n#{idx}) Book title: #{book.title}, written by #{book.author}"
    end
  end

  def list_all_people
    read_file_people if @people == []
    @people.each_with_index do |person, idx|
      puts "\n #{idx}) #{person.type} id: (#{person.id}) Name: #{person.name} age: #{person.age}"
    end
  end

  def create_person
    read_file_people if @people == []
    selected_person = selected_person_input
    name = obtain_person_name
    age = obtain_person_age

    case selected_person
    when 1
      create_a_student(name, age)
    when 2
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
    @people.push(Students.new(classroom, type, age, name, 1, parent_permission: permission))
    @taked_people.push({ classroom: classroom, type: type, age: age, name: name, id: @people.last.id,
                         parent_permission: permission })
    write_file(@taked_people, 'people.json')
    puts 'Student was created successfully'
    puts "\n"
  end

  def create_a_teacher(name, age)
    type = 'Teacher'
    specialization = obtain_teacher_specialization

    @people.push(Teacher.new(specialization, type, age, name, 1))
    @taked_people.push({ specialization: specialization, type: type, age: age, name: name, id: @people.last.id })
    write_file(@taked_people, 'people.json')
    puts 'Teacher was created successfully'
    puts "\n"
  end

  def create_a_book
    read_file_book if @books == []
    title = obtain_book_title

    author = obtain_book_author
    puts 'Book was created successfully'
    puts "\n"

    @books.push(Book.new(title, author))
    @taked_book.push({ title: title, author: author })
    write_file(@taked_book, 'books.json')
  end

  def create_a_rental
    read_file_rental if @rental == []
    book = select_book_for_rental
    person = select_who_will_rent

    date = define_rental_date
    @rental.push(Rental.new(date, @people[person], @books[book]))
    puts 'Rental was created successfully'
    puts "\n"
    if @people[person].type == 'Teacher'
      @taked_rental.push({ date: date, book: { title: @books[book].title, author: @books[book].author },
                           person: { name: @people[person].name, age: @people[person].age, id: @people[person].id,
                                     type: @people[person].type, specialization: @people[person].specialization } })
    else
      @taked_rental.push({ date: date, book: { title: @books[book].title, author: @books[book].author },
                           person: { name: @people[person].name, age: @people[person].age, id: @people[person].id,
                                     type: @people[person].type, classroom: @people[person].classroom,
                                     permission: @people[person].parent_permission } })
    end

    write_file(@taked_rental, 'rentals.json')
  end

  def rental_person_id
    read_file_rental if @rental == []
    id = select_person_id_for_rentals

    @rental.map do |rental|
      puts "\n On #{rental.date} rental of #{rental.book.title}, by #{rental.book.author}" if rental.person.id == id
    end
  end
end
