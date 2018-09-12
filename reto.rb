class Reto5
    
    def initialize
      @preguntas = leer_preg
    end

    def start
        puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!\n\n"
        jugar
    end

    def leer_preg
        File.open('question.txt','r+') do |f|
            preguntas_array =[]
            f.each_line do |line|
                line=line.chomp
                a =line.split(";")
                preguntas_array << {definicion: a[0], respuesta: a[1]}
            end 
            preguntas_array       
        end        
    end

    def jugar
        @preguntas.shuffle!
        
        @preguntas.each  do |clave|
            
            puts "Definicion: \n #{clave[:definicion]}"
            puts "Respuesta: "
            ans = gets.chomp
            
            #puts "#{clave[:respuesta]}"
            if ans.downcase == clave[:respuesta]
            puts "Correcto!\n"
            else 
                puts "Incorrecto!, Trata de nuevo"
                redo
            end      
        end 
        puts "Gracias por jugar"
    end
    
end

reto5 = Reto5.new
reto5.start
