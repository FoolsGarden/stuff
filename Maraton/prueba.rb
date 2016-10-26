def import(filename=File.dirname(__FILE__) + "/preguntas.csv")
    field_names =["pregunta","respuesta","opcion_A","opcion_B","opcion_C"]
    Question.transaction do
      array=[]
      File.open(filename).each do |line|
        array<<line.chomp
      end
      for i in 0..19 
        data=[]
        data << array[i*6]
        data << array[i*6+1] 
        data << array[i*6+2]
        data << array[i*6+3]
        data << array[i*6+4] 
        attribute_hash = Hash[field_names.zip(data)]
        pregunta = Question.create!(attribute_hash)
      end        
    end    
  end
import()