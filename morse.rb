class Morse
		
	def initialize()
		@alfabeto = { 
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
			"z" => "--.."}

		@error = 
			{"error1" => "..--",
			"error2" => ".-.-",
			"error3" => "---.",
			"error4" => "----"}

		def start
			a = ""
			b = ""
			largo_combinaciones =[]
			posibles_combinaciones = []
			input = gets.chomp.to_s
			@length_letras = input.length

			while @length_letras > 10 || @length_letras == 0
				input = gets.chomp.to_s
				@length_letras = input.length
			end

			letras = input.split("")
			count = 0
			@morse = ""

			while count < @length_letras
				@morse << @alfabeto[letras[count]]
				count = count + 1
			end

			@length_morse = @morse.length
			puts @morse




				
			@count2 = 0
			@count3 = 0
			combinaciones
		end

		def combinaciones
			@alfabeto.each {|key, value|
				puts key
				if value == @morse[0..value.length-1]
					puts value
					puts key
					@morse = @morse[value.length..-1]
					puts @morse
					puts @count2 += 1
					if @morse == "" && @count2 == @length_letras
						count3 += 1
					end
					combinaciones
					puts "$"
				end
			}
			puts count3
		end

	end
	
end

object =  Morse.new
object.start

