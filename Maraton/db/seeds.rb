# Este archivo sirve para crear registros de prueba
module Seeds
  def self.import_1(filename = File.dirname(__FILE__) + "/../deck_1.csv")
    field_names = ["deck","pregunta","respuesta","opcion_A","opcion_B","opcion_C"]
    Question.transaction do
      array = []
      File.open(filename).each do |line|
        array << line.chomp
      end
      for i in 0..9 
        data = [1]
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
  def self.import_2(filename = File.dirname(__FILE__) + "/../deck_2.csv")
    field_names = ["deck","pregunta","respuesta","opcion_A","opcion_B","opcion_C"]
    Question.transaction do
      array = []
      File.open(filename).each do |line|
        array << line.chomp
      end
      for i in 0..9 
        data = [2]
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
  def self.import_3
    Deck.transaction do
      deck = Deck.create!(category:"Deck_1")
      deck = Deck.create!(category:"Deck_2") 
    end    
  end
end
Seeds.import_1
Seeds.import_2
Seeds.import_3