def cuenta(archivo)
	file = File.open(archivo, 'r')
	cuent = file.readlines.count
	puts "el número de filas es #{cuent}"
	file.close

end

cuenta("peliculas.txt")
