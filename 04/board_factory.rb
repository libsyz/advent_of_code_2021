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
      @columns = @rows.transpose
      @nums = @rows.flatten
    end

    def mark_at(number)
      num = @nums.flatten.find { |bingo_num| bingo_num.num == number }
      num.mark! if num
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
      @nums.map { |bingo_num| bingo_num.num unless bingo_num.marked? }
           .compact
           .sum
    end

  end

  def self.generate(raw_boards, random_sequence)
    raw_boards.each_with_object([]) do |raw_board, obj|
      # skip boards that cannot get to bingo
      next if raw_board.flatten - random_sequence != []
      board_data = raw_board.map { |row| row.map { |n| BingoNumber.new(num: n) } }
      obj << BingoBoard.new(board_data)
    end
  end
end
