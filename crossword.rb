# frozen_string_literal: true

require_relative 'grid'
require_relative 'cell'
# Crossword class
class Crossword
  attr_reader :grid, :horizontal_word, :vertical_word, :vertical_ary, :horizontal_ary

  def initialize(horizontal_word, vertical_word)
    @horizontal_word = horizontal_word.to_s
    @vertical_word = vertical_word.to_s
    @vertical_ary = @vertical_word.chars
    @horizontal_ary = @horizontal_word.chars
    @grid = Grid.new(@horizontal_word.length, @vertical_word.length)
  end

  def build!
    common = common_char
    vindex = vertical_ary.index(common)
    hindex = horizontal_ary.index(common)
    fill_row(vindex, horizontal_word)
    fill_column(hindex, vertical_word)
  end

  def print
    if horizontal_word.empty? && vertical_word.empty?
      puts 'You have entered blank string.'
    else
      puts "Print crossword pattern #{horizontal_word} & #{vertical_word}"
      display_words.each do |word|
        word.each_char { |c| printf "#{c} " }
        printf "\n"
      end
    end
  end

  private

  def rows
    (0..(grid.height - 1))
  end

  def display_words
    rows.map do |row|
      grid.cells_in_row(row).map(&:letter).join
    end
  end

  def common_char
    if horizontal_word.length < vertical_word.length
      (vertical_ary & horizontal_ary).first
    else
      (horizontal_ary & vertical_ary).first
    end
  end

  def fill_row(row, word)
    cells = grid.cells_in_row(row)
    word.chars.each_with_index do |letter, i|
      cells[i].letter = letter
    end
  end

  def fill_column(column, word)
    cells = grid.cells_in_column(column)
    word.chars.each_with_index do |letter, i|
      cells[i].letter = letter
    end
  end
end

puzzle = Crossword.new('cat', 'hat')
puzzle.build!
puzzle.print

puzzle = Crossword.new('balloon', 'bat')
puzzle.build!
puzzle.print

puzzle = Crossword.new('faint', 'test')
puzzle.build!
puzzle.print

puzzle = Crossword.new('road', 'dad')
puzzle.build!
puzzle.print

puzzle = Crossword.new('dad', 'road')
puzzle.build!
puzzle.print
