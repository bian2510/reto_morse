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
		@error = {
			"error1" => "..--",
			"error2" => ".-.-",
			"error3" => "---.",
			"error4" => "----"
		}
	end
	
	def start
		input = gets.chomp.to_s
		@length_letras = input.length

		letras = input.split("")
		count = 0
		@inicio = 0	
		@count2 = 0
		@count3 = 0
		@morse = ""

		while count < @length_letras
			@morse << @alfabeto[letras[count]]
			count = count + 1
		end

		@length_morse = @morse.length
		combinaciones
		puts @count3
	end

	def combinaciones
		@alfabeto.each do |key, value|
			if @morse[@inicio..-1] != ""
				if value == @morse[@inicio..@inicio+value.length-1]
					@count2 += 1
					@coincidencia = value
					@inicio = @inicio + value.length
					if @morse[@inicio..-1] == "" && @count2 == @length_letras
						@count3 += 1
					end
					combinaciones
					@coincidencia = value
					if @inicio != 0
						@inicio = @inicio - @coincidencia.length
					else
						@inicio = 0
					end
				end
			end
		end
		@count2 -= 1
	end
end

object =  Morse.new
object.start