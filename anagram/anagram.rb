
class Anagram

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(words)
    AnagramAnalyzer.new(words).find(word)
  end
end

class AnagramAnalyzer
  
  attr_reader :anagrams

  def initialize(words)
    @anagrams = create_anagrams(words)
  end

  def find(word)
    anagrams[key_for(word)]
  end


  private

  def key_for(word)
    word.downcase.chars.sort.join
  end

  def create_anagrams(words)
    initial = Hash.new { |hash, key| hash[key] = [] }
    words.each_with_object(initial) { |word, hash| hash[key_for(word)] << word }
  end
end