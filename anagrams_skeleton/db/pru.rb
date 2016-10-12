def import(filename=File.dirname(__FILE__) + "/../words")
  field_names = ["word","word_can"]
  File.open(filename).each do |line|
    data = [line.chomp ,line.chomp.downcase.split("").sort.join("")]

  end
end

import