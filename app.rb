require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'classroom'

class App
  attr_accessor :books, :people, :rental
  
  def initialize
    @books = []
    @people = []
    @rental = []
  end   

  def list_all_books
    @books.each_with_index do |book, idx| 
      puts { "#{idx} Title: #{book.title}, by #{book.author}" }    
    end
  end

  def list_all_people
    @people.each_with_index do |person, idx|
      puts { "#{idx} #{person.type} #{person.id}: #{person.name} age: #{person.age}" }
    end
  end
  
  def create_person
    print 'Do you want to create a sutdent (1) or a teacher (2)? [Input the number]'
    selected_person = gets.chomp.to_i

    if selected_person == 1
      create_a_student
    elsif selected_person == 2
      create_a_teacher
    else 
      puts 'Option not recognized, please try again'
      create_person
    end

  def create_a_student
    type = "Student"
    print "Age: "
    age = gets.chomp.to_i
    
    print "Name: "
    name = gets.chom

    print "Classroom"
    classroom = gets.chom
    Classroom.new(classroom) 
    
    print "Has parent permission? [Y/N]:"
    parent_permission = gets.chomp.capitalize
      if parent_permission == "Y"
        parent_permission: true
      else 
        parent_permission: false
      end
    
    @people.push(Students.new(classroom, type, age, name, parent_permission: parent_permission)
  end
  
  def create_a_teacher
    type = "Teacher"
    print "Specialization: "
    specialization = gets.chomp

    print "Name: "
    name = gets.chomp

    print "Age: "
    age = gets.chomp

    @people.push(Teacher.new(specialization, type, age, name))
  end

  def create_a_book
    print "Book title: "
    title = gets.chomp

    print "Book Author: "
    author = gets.chomp
    puts "Book created successfully" 
  
    @books.push(Book.new(title, author))
  end

  def create_a_rental
    print "Select the number of book for to be rented"
    list_all_books
    book = gets.chomps

    print "Select the number of person that is renting the book"
    list_all_people
    person = gets.chomp

    print "Define the rental date"
    date = gets.chomp
    @rental.push(Rental.new(date, @people[person], @books[book]))
    puts "The rental was created successfully"
  end

  def rental_person_id
    print "Select the person (id) to review rentals"
    list_all_people
    person_id = gets.chomp.strip.to_i

    @rental.map do |rental|
      puts "Rent on #{rental.date} book #{rental.book.title} by #{rental.book.author}" if rental.person.id = person_id
  end  
end
