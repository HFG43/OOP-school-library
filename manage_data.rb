require_relative 'app'
require_relative 'hash_module'
require 'json'

class Data_manager
  include DataToHash

  def write_file_people(people)
    people_list = people.map { |person| person.hash_structure }
    File.write('people.json', JSON.generate(people_list))   
  end
    
  def read_file_people
    return [] unless File.exist?("people.json")
    people_saved = JSON.parse(File.read("people.json"))
    people_list = []
    people_saved.each do |person|
      if (person['type'] == "Student")
        people_list << student_from_hash(person)
      else
        people_list << teacher_from_hash(person)
      end  
    end   
    people_list  
  end    
end  
