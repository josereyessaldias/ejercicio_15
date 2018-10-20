def cuenta(archivo)
	file = File.open(archivo, 'r')
	palabras = file.readlines.map(&:chomp)
	palabras = palabras.join.split
	puts "En total hay #{palabras.count} palabras"
end

cuenta("peliculas.txt")


def cuenta2(archivo,pal)
	file = File.open(archivo, 'r')
	palabras = file.readlines.map(&:chomp)
	palabras = palabras.join
	a = palabras.split
	b = a.select {|i| i == pal}
	puts "En total hay #{b.count} palabras #{pal} en el archivo"
	file.close
end

cuenta2('peliculas.txt','Guerra')