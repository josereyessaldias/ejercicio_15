def nueva_pag(string1,string2)
	file = File.new("index.html", 'w')
	file.puts "#{string1}<br>#{string2}"
	file.close
	nil
end

nueva_pag("aaaaa", "lo que sea 2")


def nueva_pag2(string1,string2,array)
	file = File.new("index2.html", 'w')
	file.puts "#{string1}<br>#{string2}<br>"
	file.puts array.join("<br>")
	file.close
	nil
end

nueva_pag2("bbbb", "lo que sea 2",[1,2,3])

def nueva_pag3(string1,string2,array,rgb)
	file = File.new('index3.html', 'w')
	file.puts "<body style='background-color:#{rgb}'"
	file.puts "#{string1}<br>#{string2}<br>"
	file.puts array.join("<br>")
	file.puts "</body>"
	file.close
	nil
end

nueva_pag3('bbbb', 'lo que sea 2',[1,2,3],"green")