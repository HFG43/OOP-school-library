require_relative 'app'

#Methods for creating persons
def selected_person_input
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
  gets.chomp.to_i
end

def get_person_name
  puts 'Name: '
  gets.chomp
end

def get_person_age
  puts 'Age: '
  gets.chomp
end

def assign_student_classroom
  puts 'Classroom: '
  gets.chomp
end 

def student_has_permission
  puts 'Has parent permission? [Y/N]:'
  gets.chomp.capitalize
end

def get_teacher_specialization
  puts 'Specialization: '
  gets.chomp
end  

#Methods for creating a book
def get_book_title
  puts 'Book title: '
  gets.chomp
end

def get_book_author
  puts 'Book Author: '
  gets.chomp
end

#Methods for generating a book rental
def select_book_for_rental
  puts 'Select the book (index) for rent'
  puts "\n"
  list_all_books
  gets.chomp.to_i
end

def select_who_will_rent
  puts 'Select the person (index) that will rent the book'
  puts "\n"
  list_all_people
  gets.chomp.to_i
end

def define_rental_date
  puts 'Define the rental date: '
  puts "\n"
  gets.chomp
end

#Method for getting rentals per person ID
def select_person_id_for_rentals
  puts 'Select the person (id) to review its rentals'
  list_all_people
  gets.chomp.strip.to_i
end  
