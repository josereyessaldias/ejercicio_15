
opciones = ["Opción 1: mostrar productos existentes",
			"Opción 2: mostrar total stock de un producto específico",
			"Opción 3: mostrar productos sin registro",
			"Opción 4: mostrar productos con valor menor a: (elegir valor)",
			"Opción 5: registrar nuevo producto",
			"Opción 6: salir del programa"
			]


def mostrar(archivo)

	opciones2 = ["Opción 1: mostrar productos por tienda",
			 	 "Opción 2: mostrar existencia total por tienda",
			 	 "Opción 3: mostrar existencia total",
			 	 "Opción 4: volver a menú principal",
				]

	def prod(item,a,b,c)
		puts item
	end

	file = File.open(archivo, 'r')
	datos = file.readlines
	file.close
	datos = datos.join.split
	datos = datos.map do |i|
		i.gsub(",","")
	end

	elegir = 0
	while elegir != 4
	puts "\nElija una de las siguientes opciones:\n\n"
	puts opciones2
	elegir = gets.chomp.to_i

	while elegir <0 or elegir>4
		puts "\nSeleccione una opción entre 1 y 4\n"
		puts opciones2
		elegir = gets.chomp.to_i
	end
	
	case elegir
		when 1
			puts ""
			a = []
			datos.each_slice(4) do |i|
				a.push(i)
			end
			a.each do |i|
				puts "El #{i[0]} tiene #{i[1]} unidades en la tienda 1, #{i[2]} unidades en la tienda 2 y #{i[3]} unidades en la tienda 3."
			end
		when 2
			a = []
			datos.each_slice(4) do |i|
				a.push(i)
			end
			b = 0
			c = 0
			d = 0
			a.each do |i|
				b += i[1].to_i
				c += i[2].to_i
				d += i[3].to_i
			end
			puts "\nLa tienda 1 tiene #{b} unidades de productos."
			puts "La tienda 1 tiene #{c} unidades de productos."
			puts "La tienda 1 tiene #{d} unidades de productos."

		when 3
			a = []
			datos.each_slice(4) do |i|
				a.push(i)
			end
			puts ""
			a.each do |i|
				b = 0
				i.each do |e|
					b += e.to_i
				end
				puts "#{i[0]} tiene #{b} existencias en total."
			end
		end
	end
end

def mostrar_total(archivo)
	file = File.open(archivo, 'r')
	datos = file.readlines
	file.close
	datos = datos.join.split
	datos = datos.map do |i|
		i.gsub(",","")
	end
	a = []
	datos.each_slice(4) do |i|
		a.push(i)
	end
	puts "\n¿Qué producto desea revisar? Elija de la siguiente lista:"
	a.each do |i|
		puts i[0]
	end
	
	z = 0
	while z == 0
		eleccion = ""
		eleccion = gets.chomp

		a.each do |i|
			if i[0] == eleccion
				puts "\nEl #{i[0]} tiene en total #{i[1].to_i+i[2].to_i+i[3].to_i} productos en stock."
				z = 1
			end
		end
		puts "\nDebe escribir correctamente el nombre del producto." if z == 0
	end
end

def no_reg(archivo)
	file = File.open(archivo, 'r')
	datos = file.readlines
	file.close
	datos = datos.join.split
	datos = datos.map do |i|
		i.gsub(",","")
	end
	a = []
	datos.each_slice(4) do |i|
		a.push(i)
	end

	puts "\nLos productos no registrados en bodega son:\n"
	a.each do |i|
		i.each_with_index do |e,n|
			if e == "NR"
				puts "#{i[0]} tiene productos no registrados en tienda #{n}"
			end
		end
	end

end

def existencia_total(archivo)
	file = File.open(archivo, 'r')
	datos = file.readlines
	file.close
	datos = datos.join.split
	datos = datos.map do |i|
		i.gsub(",","")
	end
	a = []
	datos.each_slice(4) do |i|
		a.push(i)
	end

	puts "\nIndique el umbral de stock a revisa."
	umbral = gets.chomp.to_i
	
	puts "\nLos productos con un stock menor a #{umbral} son:"
	a.each do |i|
		b = 0
		i.each do |e|
			b += e.to_i
		end
	puts "#{i[0]}, con #{b} existencias en total." if b < umbral
	end


end

def agregar(archivo)
	file = File.open(archivo, 'a')
	
	nuevo = ""
	puts "\nIngrese el nombre del nuevo producto"
	nuevo = gets.chomp

	while nuevo.split.length != 1
	puts "\nIngrese sólo una palabra"
	nuevo = gets.chomp
	end

	puts "\nIngrese stock en tienda 1"
	tienda1 = gets.chomp.to_i
	puts "\nIngrese stock en tienda 2"
	tienda2 = gets.chomp.to_i
	puts "\nIngrese stock en tienda 3"
	tienda3 = gets.chomp.to_i

	file.puts "\n#{nuevo}, #{tienda1}, #{tienda2}, #{tienda3}"
	file.close
end


seleccion = 0
while seleccion != 6
	puts "\nIngrese una de las siguientes opciones\n"
	puts opciones
	seleccion = gets.chomp.to_i

	while seleccion < 1 or seleccion > 6
		puts "\nIngrese una opción entre 1 y 6\n\n"
		seleccion = gets.chomp.to_i
	end

	case seleccion
		when 1
			mostrar("productos.txt")
	
		when 2
			mostrar_total("productos.txt")

		when 3
			no_reg("productos.txt")


		when 4
			existencia_total("productos.txt")
	
		when 5
			agregar("productos.txt")

	end
end

puts "\nElegió opción 6.\nFin del programa.\n"