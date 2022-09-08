# frozen_string_literal: true

# rubocop:disable Style/Documentation
class String
  def kittenize
    result = dup
    DICTIONARY.each do |word|
      result.gsub!(word[0], word[1])
    end
    result
  end

  def kittenize!
    DICTIONARY.each do |word|
      gsub!(word[0], word[1])
    end
    self
  end

  DICTIONARY = [
    [/([^。])(。+)/, '\1にゃ\2'],
    [/な/, 'にゃ'],
    [/ナ/, 'ニャ'],
    [/ま/, 'みゃ'],
    [/マ/, 'ミャ'],
    [/よう/, 'にゃう'],
    [/ヨウ/, 'ニャウ']
  ].freeze

  private_constant :DICTIONARY
end
# rubocop:enable Style/Documentation
