require 'spec_helper'

describe Kittenizer do
  it 'has a version number' do
    expect(Kittenizer::VERSION).not_to be nil
  end

  WORD_PAIRS = [
    ["こんばんは", "こんばんは"],
    ["こんにちは。", "こんにちはにゃ。"],
    ["あのとき食べたアレは本当においしかった。。。", "あのとき食べたアレは本当においしかったにゃ。。。"],
    ["あれは一度食べておかないとー", "あれは一度食べておかにゃいとー"],
    ["バナナ", "バニャニャ"],
    ["おねがいします", "おねがいしみゃす"],
    ["おはよう", "おはにゃう"],
    ["オハヨウ", "オハニャウ"],
  ]

  describe "String#kittenize" do
    WORD_PAIRS.each do |word_pair|
      it "returns #{word_pair[1]}" do
        expect(word_pair[0].kittenize).to eq word_pair[1]
      end
    end
  end

  describe "String#kittenize!" do
    WORD_PAIRS.each do |word_pair|
      context "when @str = '#{word_pair[0]}', then @str.kittenize!" do
        before do
          @str = word_pair[0].dup
          @str.kittenize!
        end

        it "changes #{word_pair[1]}" do
          expect(@str).to eq word_pair[1]
        end
      end
    end
  end
end
