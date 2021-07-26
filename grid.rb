# frozen_string_literal: true

# Grid class
class Grid
  attr_reader :cells, :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @cells = []
    height.times do |x|
      width.times do |y|
        @cells.push(Cell.new(x, y))
      end
    end
  end

  def cells_in_row(row)
    cells.select { |c| c.row == row }.sort_by(&:col)
  end

  def cells_in_column(column)
    cells.select { |c| c.col == column }.sort_by(&:row)
  end
end
