# frozen_string_literal: true

# Cell class
class Cell
  attr_reader   :row, :col
  attr_accessor :letter

  def initialize(row, col)
    @row = row
    @col = col
    @letter = ' '
  end
end
