require_relative 'inputs'
require_relative 'book'
require_relative 'manage_data'
require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'
require 'json'

class App
  attr_accessor :books, :people, :rental
 
  def initialize
    @data_manager = Data_manager.new
    @books = []
    @people = @data_manager.read_file_people
    @rental = []
    @taked_book = []
  end
  
  def save_people_data
    @data_manager.write_file_people(@people)
  end

  def list_all_books
    if @books == []
      read_file_book 
    end
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
    name = obtain_person_name
    age = obtain_person_age

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
    new_student = Students.new(classroom, type, age, name, parent_permission: permission)
    @people << new_student
    puts 'Student was created successfully'
    puts "\n"
  end

  def create_a_teacher(name, age)
    type = 'Teacher'
    specialization = obtain_teacher_specialization

    new_teacher = Teacher.new(specialization, type, age, name)
    @people << new_teacher
  
    puts 'Teacher was created successfully'
    puts "\n"
  end

  def create_a_book
    title = obtain_book_title

    author = obtain_book_author
    puts 'Book was created successfully'
    puts "\n"

    @books.push(Book.new(title, author))
    @taked_book.push({title: title, author: author})
    self.write_file_book(@taked_book)
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

  def write_file_book(taked_book)

    json_file = JSON.generate(@taked_book)
    if (File.exist?("books.json"))
      File.write("books.json", json_file)
    else
      file_name = "books.json"
      file = File.open(file_name)
      File.write(file_name, json_file)
    end
  end

  def read_file_book
    if (File.exist?("books.json"))
      file_name = "books.json"
      file = File.open(file_name)
      take_data = File.read("books.json")
      @taked_book = JSON.parse(take_data)
      self.convert_book
    end
  end

  def convert_book
    @taked_book.each do |i|
      @books.push(Book.new(i["title"], i["author"]))
    end
  end
end
