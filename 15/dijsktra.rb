
require 'pry-byebug'

graph = {
  #node => [ node, distance ]
  0 => [ [1, 2], [2, 6] ],
  1 => [ [0, 2], [3, 5] ],
  2 => [ [0, 6], [3, 8] ],
  3 => [ [1, 5],[2, 8], [5, 15], [4, 10] ],
  4 => [ [3, 10], [6, 2], [5, 6] ],
  5 => [ [3, 15], [4, 6],[6, 6] ],
  6 => [ [4, 2], [5, 6]]
}


distances = graph.keys.map { Float::INFINITY }
distances[0] = 0
               # node
                  # distance to node
prio_queue = [[0, 0]]
visited = []

until prio_queue.empty?
    # sleep 1
    current_node = prio_queue.min { |(node, distance)| distance }
    prio_queue.delete(current_node  )
    p prio_queue
    visited << current_node[0]
    adjacents = graph[current_node[0]]
    adjacents.each do |(node, distance)|
      unless visited.include?(node)
        distances[node] = distance + current_node[1] if (distance + current_node[1]) <= distances[node]
        prio_queue << [ node, distances[node] ]
      end
    end
end
