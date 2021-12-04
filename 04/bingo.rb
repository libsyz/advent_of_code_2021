
def bingo(random_sequence, boards)
  res = {}
  bingo_boards = BoardFactory.generate(boards)
  random_sequence.each do |num|
    res[:last_called] = num
    bingo_boards.each do |board|
      board.mark_at(num)
      res[:winner] = board and return res if board.bingo?
    end
  end
end


class BoardFactory
  class BingoNumber
    attr_reader :num

    def initialize(num)
      @num = num
      @marked = false
    end

    def marked?
      @marked
    end

    def mark!
      @marked = true
    end
  end

  class BingoBoard
    def initialize(board_data)
      @rows = board_data
      @columns = nil
      populate_columns
    end

    def mark_at(number)
      bingo_number = @rows.find { |bingo_num| bingo_num.num == number }
      bingo_number.mark! if bingo_number
    end

    def bingo?
      @rows.any? { |row| row.all?(&:marked?) }  ||
      @columns.any? { |col| col.all?(&:marked?) }
    end

    private
    def populate_columns
      @columns = @rows.transpose
    end
  end

  def self.generate(raw_boards)
    raw_boards.each_with_object([]) do |rw, obj|
      board_data = rw.map { |num| BingoNumber.new(num: num)}
      obj << BingoBoard.new(board_data)
    end
  end
end
