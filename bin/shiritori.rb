#!/usr/bin/env ruby

$:.unshift File.expand_path("../lib", __dir__)
require "shiritori"

japanese_nouns_as_katakana = Shiritori.japanese_nouns.map {|string| Shiritori.to_katakana(string) }

puts "I'll let you start. What's your first word?"

used_words = []

loop do
  word = Shiritori.to_katakana(gets.chomp)
  require "byebug";byebug
  # ①日本語かどうかチェック
  if japanese_nouns_as_katakana.include?(word)

    first_word = word.split("").first
  #  require "byebug";byebug
    if used_words.empty?
      # require "byebug";byebug
      used_words << word
      last_word = used_words.last.split("").last
    else
      last_word = used_words.last.split("").last
      used_words << word
      # ②過去に使われてないかどうか
      if used_words.include?(word)
        puts "その言葉は使われてます。負けです。"
        exit
      # ③'ん'で終わってないか
      elsif word.split("").last == "ン"
        puts "んで終わってます。"
        exit
      # ④前の人の入力の最後と次の人の入力の最初が等しいか

      elsif last_word == first_word
        require "byebug";byebug
      # ①〜④がOKだったら最初のループに戻る
        used_words << word
        last_word = used_words.last.split("").last
      else
        puts "That doesn't count! You lose."
        exit
      end
    end
  end

end
