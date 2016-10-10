#iteration #0 test de git
class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end
homes = [
  Home.new("Andrea place", "Caracas", 2, 70),
  Home.new("Orlando place", "Valencia", 5, 36),
  Home.new("Adolfo place", "Paris", 3, 41),
  Home.new("Blanca place", "Málaga", 2, 40),
  Home.new("Ninoska place", "San Juan", 4, 49),
  Home.new("Yakeline place", "San Juan", 2, 120),
  Home.new("Daniel place", "Seville", 5, 47),
  Home.new("Jorge place", "Pittsburgh", 3, 37),
  Home.new("Mario place", "Málaga", 2, 45),
  Home.new("Joanna place", "San Juan", 4, 40)
]
#iteration #1
puts("")
puts ("Listado original de pisos")
puts("")
homes.each do |piso|
  puts piso.name
end
#iteration #2

respuesta1 = "0"
while respuesta1 == "0" do
  puts (" ")
  puts ("Seleccione la forma de ordenar los pisos disponibles")
  puts ("1=> Por Precio")
  puts ("2=> Por Capacidad")
  ordenar_x = gets.chomp
  if ordenar_x == "1" || ordenar_x == "2"
    respuesta1 = "1"
    respuesta2 = "0"
    while respuesta2 == "0"
      puts ("Seleccione la forma de mostrar los resultados de ordenar")
      puts ("1=> De menor a mayor")
      puts ("2=> de mayor a menor")
      orden_x = gets.chomp
      if orden_x == "1" || orden_x == "2"
        respuesta2 = "1"
        if ordenar_x == "1"
          if orden_x == "1"
            pisos_ordenados = homes.sort do |piso1, piso2|
              piso1.price <=> piso2.price
            end
          else
            pisos_ordenados = homes.sort do |piso1, piso2|
              piso2.price <=> piso1.price
            end
          end
        else
          if orden_x == "1"
            pisos_ordenados = homes.sort do |piso1, piso2|
              piso1.capacity <=> piso2.capacity
            end
          else
            pisos_ordenados = homes.sort do |piso1, piso2|
              piso2.capacity <=> piso1.capacity
            end
          end
        end
        puts("")
        pisos_ordenados.each do |piso|
          puts piso.name
        end
      else
        puts ("Seleción incorrecta intentalo de nuevo")
      end
    end
  else
    puts ("Seleción incorrecta intentalo de nuevo")
  end
end
#iteration #3
puts("")
puts "¿Dime que ciudad deseas consultar?"
puts("")
ciudad = gets.chomp
ciudad_seleccion = homes.select do |piso|
  piso.city.downcase == ciudad.downcase
end
if ciudad_seleccion.size > 0
  puts ("Aprovecha tenemos pisos disponibles en #{ciudad}: ")
  ciudad_seleccion.each do |piso|
    puts piso.name
  end
else
  puts("Lo lamentamos no disponimos de pisos en #{ciudad}")
end

#iteration #4
total_precio = homes.reduce(0) do |sum, piso|
  sum + piso.price
end
puts("")
puts("")
puts ("El promedio por noche de nuestros pisos es #{total_precio / homes.size}")
puts("")

#iteration #5
puts "¿Que precio quieres consultar?"
puts("")
precio = gets.chomp.to_i
home_precio = homes.find do |piso|
  piso.price == precio
end
if home_precio
  puts("")
  puts ("lo encontramos!!! el #{home_precio.name} se ajusta a tu presupuesto")
else
  puts("")
  puts ("Lo sentimos no tenemos pisos disponibles a ese precio")
end
