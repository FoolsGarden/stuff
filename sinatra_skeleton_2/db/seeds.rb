module UlrSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../urls.csv")
    Url.transaction do
      File.open(filename).each do |line|
        data = line.chomp 
        url = Url.create!(long_url: data)
      end
    end
  end
end
UlrSeeds.import