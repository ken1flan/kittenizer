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
  describe 'version' do
    subject { Kittenizer::VERSION }

    it { is_expected.not_to be_nil }
  end

  describe 'String#kittenize' do
    subject { str.kittenize }

    WORD_PAIRS.each do |word_pair|
      context "when str = '#{word_pair[0]}'" do
        let(:str) { word_pair[0].dup }

        it { is_expected.to eq word_pair[1] }
      end
    end
  end

  describe 'String#kittenize!' do
    WORD_PAIRS.reject { |item| item[0] == item[1] }.each do |word_pair|
      context "when str = '#{word_pair[0]}'" do
        let(:str) { word_pair[0].dup }

        it { expect { str.kittenize! }.to change { str }.from(word_pair[0]).to(word_pair[1]) }
      end
    end

    WORD_PAIRS.select { |item| item[0] == item[1] }.each do |word_pair|
      context "when str = '#{word_pair[0]}'" do
        let(:str) { word_pair[0].dup }

        it { expect { str.kittenize! }.not_to(change { str }) }
      end
    end
  end

  describe 'String#DICTIONARY' do
    it { expect { String::DICTIONARY }.to raise_error(NameError) }
  end
end
