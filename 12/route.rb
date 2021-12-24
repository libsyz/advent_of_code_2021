
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

list = ['dc-end',
        'HN-start',
        'start-kj',
        'dc-start',
        'dc-HN',
        'LN-dc',
        'HN-end',
        'kj-sa',
        'kj-HN',
        'kj-dc']

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


node_list = NodeParser.new.generate(list).nodes

start_node = node_list.find { |nd| nd.name == 'start' }



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
      if node.name == node.name.downcase && routes.last[1].count(node.name) > 1
        next
      end

      queue << [node, "#{first[1]}, #{node.name} " ]
    end
  end

  return routes
end


puts get_routes(start_node, [])


# def sum(n, arr)
#   if n == 1
#     return arr << n
#   end

#   return "#{arr << n}, #{sum(n - 1, arr)}"
# end




# get the start node
# start a route as an empty string
# add the start node's name
# get the children
# for each of them
# is the node the end node?
  # if it is, add it to the solution string
  # add the node to the queue
