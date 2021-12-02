require 'pry-byebug'


def position(commands)
  PositionCalculator.new
                    .process_batch_commands(commands)
end


def position_with_aim(commands)
  PositionCalculator.new(with_aim: true)
                    .process_batch_commands(commands)
end


 class PositionCalculator
  attr_reader :with_aim
  def initialize(with_aim: false)
    @vertical = 0
    @horizontal = 0
    @aim = 0
    @with_aim = with_aim
  end

  def process_batch_commands(commands)
    commands.each do |cmd|
      action, amount = cmd
      public_send(action, amount)
    end
    { vertical: @vertical, horizontal: @horizontal }
  end

  def up(amount)
    with_aim ? (@aim -= amount) : (@vertical -= amount)
  end

  def down(amount)
    with_aim ? (@aim += amount) : (@vertical += amount)
  end

  def forward(amount)
    @horizontal += amount
    @vertical += (@aim * amount) if with_aim
  end

 end
