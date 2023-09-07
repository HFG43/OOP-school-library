
module DataToHash
  def student_from_hash(people_data)
    classroom = people_data['classroom']
    type = 'Student'    
    name = people_data['name']
    age = people_data['age']
    permission = people_data['parent_permission']
    Students.new(classroom, type, age, name, parent_permission: permission)
  end
 
  def teacher_from_hash(people_data)
    specialization = people_data['specialization']
    type = 'Teacher'
    name = people_data['name']
    age = people_data['age']
    Teacher.new(specialization, type, age, name)
  end
end