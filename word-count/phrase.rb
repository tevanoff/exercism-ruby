
class Phrase < Struct.new(:text)

  def word_count
    words.each_with_object(Hash.new(0)) do |word, word_counts| 
      word_counts[word] += 1
    end
  end


  private

  def words
    text.downcase.scan(/\w+/)
  end
end