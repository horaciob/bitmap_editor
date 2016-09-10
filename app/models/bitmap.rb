# frozen_string_literal: true

# Bitmap model
class Bitmap
  attr_reader :matrix, :rows, :columns
  def initialize(columns, rows)
    @rows = rows.to_i
    @columns = columns.to_i
    @matrix = []
    @rows.times do
      @matrix << Array.new(@columns, 'O')
    end
  end

  def clear
    @matrix.each_with_index do |_, row_index|
      @matrix[row_index].fill('O')
    end
  end

  def change(column, row, value)
    row = row.to_i - 1
    column = column.to_i - 1
    @matrix[row][column] = value
  end

  def horizontal_change(from, to, row, value)
    row = row.to_i - 1
    r = range(from, to)
    @matrix[row].fill(value, r)
  end

  def vertical_change(col, from, to, value)
    col = col.to_i - 1
    rows = *range(from, to)
    rows.each do |row|
      @matrix[row][col] = value
    end
  end

  private

  def range(from, to)
    from = from.to_i - 1
    to = to.to_i - 1
    if from > to
      aux = from
      from = to
      to = aux
    end
    from..to
  end
end
