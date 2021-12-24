
require 'pry-byebug'

class Node
  attr_reader :links, :name

  def initialize(name)
    @name = name
    @links = []
    @visited = 0
  end

  def inspect
    "#{@name} -> #{links.map(&:name)}"
  end

  def single?
    @links.size == 1 && @links.last.name == @links.last.name.downcase
  end

  def to_s
    "#{@name}"
  end

  def add_link(node)
    return if node == self

    @links.push(node) unless @links.include? node
    node.add_link(self) unless node.include? self
  end

  def include?(node)
    @links.include? node
  end

end


# list = ["start-A",
#         "start-b",
#         "A-c",
#         "A-b",
#         "b-d",
#         "A-end",
#         "b-end"]

# list = ['dc-end',
#         'HN-start',
#         'start-kj',
#         'dc-start',
#         'dc-HN',
#         'LN-dc',
#         'HN-end',
#         'kj-sa',
#         'kj-HN',
#         'kj-dc']

# list = ['fs-end',
#         'he-DX',
#         'fs-he',
#         'start-DX',
#         'pj-DX',
#         'end-zg',
#         'zg-sl',
#         'zg-pj',
#         'pj-he',
#         'RW-he',
#         'fs-DX',
#         'pj-RW',
#         'zg-RW',
#         'start-pj',
#         'he-WI',
#         'zg-he',
#         'pj-fs',
#         'start-RW']

puzzle_input =  ['nu-start',
                'rx-start',
                'db-qh',
                'PE-end',
                'sl-rx',
                'qh-end',
                'ZH-rx',
                'nu-rx',
                'PE-db',
                'db-sl',
                'nu-ZH',
                'nu-qh',
                'PE-qh',
                'ZH-db',
                'ne-end',
                'ne-ZH',
                'QG-db',
                'qh-sl',
                'ZH-qh',
                'start-ZH',
                'nu-PE',
                'uf-db',
                'ne-sl']

class NodeParser
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def to_s
    name
  end

  def generate(list)
    list.each do |link|
      first, second = link.split('-').map do |node_name|
        found = @nodes.find { |nd| nd.name == node_name  }
        found ? found : Node.new(node_name)
      end
      first.add_link(second)
      @nodes.push(first) unless @nodes.include?(first)
      @nodes.push(second) unless @nodes.include?(second)
    end
    self
  end
end


# node_list = NodeParser.new.generate(puzzle_input).nodes

# start_node = node_list.find { |nd| nd.name == 'start' }



def get_routes(start, routes)
  queue = [ [start,'start'] ]

  until queue.empty?
    first = queue.shift

    first[0].links.each do |node|

      if node.name == 'start'
        next
      end

      routes << [node, "#{first[1]}, #{node.name}" ]

      if node.name == 'end'
        next
      end
      # end node should not be added to the queue - not allowed to go back up

      # small caves should not be added if visited
      if node.name == node.name.downcase && routes.last[1].scan(node.name).size > 1
        next
      end

      queue << [node, "#{first[1]}, #{node.name} " ]
    end
  end

  return routes
end

def get_long_routes(start, routes)
  queue = [ [start,'start'] ]

  until queue.empty?
    first = queue.shift

    first[0].links.each do |node|

      if node.name == 'start'
        next
      end

      routes << [node, "#{first[1]}, #{node.name}" ]

      # end node should not be added to the queue - not allowed to go back up
      if node.name == 'end'
        next
      end

      # small, single caves should not be added if visited
      if node.single? && routes.last[1].scan(node.name).size > 1
        next
      end

      # small caves should not be added if visited twice
      if node.name == node.name.downcase && routes.last[1].scan(node.name).size > 2
        next
      end

      queue << [node, "#{first[1]}, #{node.name} " ]
    end
  end

  return routes
end

# nodes = NodeParser.new.generate(puzzle_input).nodes
# binding.pry
# start = nodes.find { |nd| nd.name == 'start' }

# routes = get_routes( start, [])

# p routes.select { |route| route[1].include?('end') }.size
