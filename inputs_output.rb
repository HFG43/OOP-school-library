module InputOutput
  def write_file(taked_book, file_name)
    json_file = JSON.generate(taked_book)
    file = File.open(file_name, 'w')
    File.write(file_name, json_file)
  end

  def read_file_book
    if (File.exist?("books.json"))
      file_name = "books.json"
      file = File.open(file_name)
      take_data = File.read("books.json")
      @taked_book = JSON.parse(take_data)
      self.convert_book
    else
      return []
    end
  end

  def convert_book
    @taked_book.each do |i|
      @books.push(Book.new(i["title"], i["author"]))
    end
  end
  #Read peoples

  def read_file_people
    if (File.exist?("people.json"))
      file_name = "people.json"
      file = File.open(file_name)
      take_data = File.read("people.json")
      @taked_people = JSON.parse(take_data)
      self.convert_people
    else
      return []
    end
  end

  def convert_people
    @taked_people.each do |i|
      if i["type"] == 'Teacher'
        @people.push(Teacher.new(i["specialization"], i["type"], i["age"], i["name"], i["id"]))
      else
        @people.push(Students.new(i["classroom"], i["type"], i["age"], i["name"], i["id"], parent_permission:i["parent_permission"]))
      end
    
    end
  end

  #Read rental in file rentals
  def read_file_rental
    if (File.exist?("rentals.json"))
      file_name = "rentals.json"
      file = File.open(file_name)
      take_data = File.read("rentals.json")
      @taked_rental = JSON.parse(take_data)
      self.convert_rental
    else
      return []
    end
  end

  def convert_rental
    @taked_rental.each do |i|
      if i["person"]["type"] == 'Student'
        @rental.push(Rental.new(i["date"], Students.new(i["person"]["classroom"], i["person"]["type"], i["person"]["age"], i["person"]["name"], i["person"]["id"], i["person"]["permission"]), Book.new(i["book"]["title"], i["book"]["author"])))
      else
        @rental.push(Rental.new(i["date"], Teacher.new(i["person"]["specialization"], i["person"]["type"], i["person"]["age"], i["person"]["name"],i["person"]["id"]), Book.new(i["book"]["title"], i["book"]["author"])))
      end
    end
  end
  
end