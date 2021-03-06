class Morse
	ALFABETO = { 
		"a" => ".-",
		"b" => "-...",
		"c" => "-.-.",
		"d" => "-..",
		"e" => ".",
		"f" => "..-.",
		"g" => "--.",
		"h" => "....",
		"i" => "..",
		"j" => ".---",
		"k" => "-.-",
		"l" => ".-..",
		"m" => "--",
		"n" => "-.",
		"o" => "---",
		"p" => ".--.",
		"q" => "--.-",
		"r" => ".-.",
		"s" => "...",
		"t" => "-",
		"u" => "..-",
		"v" => "...-",
		"w" => ".--",
		"x" => "-..-",
		"y" => "-.--",
		"z" => "--.."
	}.freeze

	def initialize()
		@alfabeto = ALFABETO
	end
	
	def start
		input = gets.chomp.to_s
		length_letras = input.length

		letras = input.split("")
		count = 0
		morse = ""

		while count < length_letras
			morse << @alfabeto[letras[count]]
			count = count + 1
		end

		inicio = 0	
		@count2 = 0
		@count3 = 0
		combinaciones(morse,length_letras,inicio)
		puts @count3
	end

	def combinaciones(morse,length_letras,inicio)
		@alfabeto.each do |key, value|
			if morse[inicio..-1] != ""
				if value == morse[inicio..inicio+value.length-1]
					@count2 += 1
					coincidencia = value
					inicio = inicio + value.length
					if morse[inicio..-1] == "" && @count2 == length_letras
						@count3 += 1
					end
					combinaciones(morse,length_letras,inicio)
					coincidencia = value
					if inicio != 0
						inicio = inicio - coincidencia.length
					else
						inicio = 0
					end
				end
			end
		end
		@count2 -= 1
	end
end

object =  Morse.new
object.start