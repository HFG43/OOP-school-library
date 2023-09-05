require 'json'
# READING FILES
# File.open("test.txt", "r") do |file|
        #   path/name       Mode OPEN A FILE inside variable file
    # puts file
    # puts file.read()
    # puts file.read().include? "test"
    # puts file.readline() 
    # puts file.readline()
      # # Imprime una linea y pasa a la siguiente
    # puts file.readchar()
    # puts file.readchar()
    # puts file.readchar()
      # Imprime un caracter y pasa al siguiente
    # for line in file.readlines()
    #     puts line
    # end
      # loop to go trhought every line    
# end

# si lo uso como file = "xx" al final cierro con file.close()

# WRITING FILES

# File.open("test.txt", "a") do |file|
#     # si tiene la a, es append, que quiere decir que se le puede agregar informacion al final
#     file.write("\nAgregado 1, test 1")    
# end

File.open("test.txt", "a") do |file|
    # si tiene la a, es append, que quiere decir que se le puede agregar informacion al final
    file.write({foo: 0, bar: 's', baz: :bat})    
end
# {foo: 0, bar: 's', baz: :bat}
# File.open("test.txt", "w") do |file|
#        # si tiene la w, es writte, que quiere decir que se puede modificar el archivo
#     # file.write("\nAgregado 1, test 1")
#     # OJO   # si lo dejo asi hace un overwrite de todo    
# end


# File.open("index.html", "r+") do |file|
#     # si tiene la r+, es writte & read, que quiere decir que se puede modificar el archivo
#    file.write("<h1>Hello, this is a test!</h1>")
#    puts file.read() 
# end

# se puede usar file.readline() para saltaer y que escriba en la siguiente linea
# se puede usar file.readchar() para saltear un caracter

car = {:make => "bmw", :year => "2003"}
puts car.to_json

ruby = JSON.parse('1')
puts ruby