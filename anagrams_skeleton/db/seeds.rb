# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 
module WordsSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../words")
    field_names = ["word","word_can"]
     Word.transaction do
      File.open(filename).each do |line|
        data = [line.chomp ,line.chomp.downcase.split("").sort.join("")] 
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          word = Word.create!(attribute_hash)
        end
      end
    end
  end
end
WordsSeeds.import