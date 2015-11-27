class String
  def kittenize
    result = self.dup
    DICTIONARY.each do |word|
      result.gsub!(word[0], word[1])
    end
    result
  end

  def kittenize!
    DICTIONARY.each do |word|
      self.gsub!(word[0], word[1])
    end
    self
  end

  DICTIONARY = [
    [/([^。])(。+)/, '\1にゃ\2'],
    [/な/, "にゃ"],
    [/ナ/, "ニャ"],
    [/ま/, "みゃ"],
    [/マ/, "ミャ"],
    [/よう/, "にゃう"],
    [/ヨウ/, "ニャウ"]
  ]

  private_constant :DICTIONARY
end
