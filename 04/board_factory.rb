class BoardFactory
  class BingoNumber
    attr_reader :num

    def initialize(num:)
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
      @rows.each do |row|
         num = row.find { |bingo_num| bingo_num.num == number }
         num.mark! if num
      end
    end

    def bingo?
      @rows.any? { |row| row.all?(&:marked?) }  ||
      @columns.any? { |col| col.all?(&:marked?) }
    end

    def to_a
      @rows.map do |row|
        row.map { |bingo_num| bingo_num.num }
      end
    end

    def unmarked_sum
      @rows.map do |row|
        row.map { |bingo_num| bingo_num.num unless bingo_num.marked? }
      end.flatten.compact.sum
    end

    private
    def populate_columns
      @columns = @rows.transpose
    end
  end

  def self.generate(raw_boards)
    raw_boards.each_with_object([]) do |rw, obj|
      board_data = rw.map { |row| row.map { |n| BingoNumber.new(num: n) } }
      obj << BingoBoard.new(board_data)
    end
  end
end
