# frozen_string_literal: true

require 'spec_helper'

WORD_PAIRS = [
  %w[こんばんは こんばんは],
  %w[こんにちは。 こんにちはにゃ。],
  %w[あのとき食べたアレは本当においしかった。。。 あのとき食べたアレは本当においしかったにゃ。。。],
  %w[あれは一度食べておかないとー あれは一度食べておかにゃいとー],
  %w[バナナ バニャニャ],
  %w[おねがいします おねがいしみゃす],
  %w[おはよう おはにゃう],
  %w[オハヨウ オハニャウ]
].freeze

describe Kittenizer do
  it 'has a version number' do
    expect(Kittenizer::VERSION).not_to be_nil
  end

  describe 'String#kittenize' do
    WORD_PAIRS.each do |word_pair|
      it "returns #{word_pair[1]}" do
        expect(word_pair[0].kittenize).to eq word_pair[1]
      end
    end
  end

  describe 'String#kittenize!' do
    WORD_PAIRS.each do |word_pair|
      context "when str = '#{word_pair[0]}', then str.kittenize!" do
        let(:str) { word_pair[0].dup }

        before { str.kittenize! }

        it "changes #{word_pair[1]}" do
          expect(str).to eq word_pair[1]
        end
      end
    end
  end

  describe 'String#DICTIONARY' do
    it 'raises NameError' do
      expect { String::DICTIONARY }.to raise_error(NameError)
    end
  end
end
