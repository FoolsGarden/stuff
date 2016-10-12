class Word < ActiveRecord::Base
  # Remember to create a migration!
  def self.anagrams(word_can,word)
    array =[]
    p array = Word.where(word_can: word_can).pluck(:word)
    array.delete(word)
    if array.size == 0
      return "THIS WORD DOESN'T HAVE ANY ANAGRAM"
    else 
      return "THE ANAGRAMS FOR THIS WORD ARE:\n #{array.join(", ")}"
    end
  end
end
