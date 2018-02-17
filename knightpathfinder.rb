require_relative '00_tree_node.rb'

def KnightPathfinder
  def initialize(current_pos = [0,0])
    @current_pos = pos
    @visited_positions = [current_pos]
    build_move_tree
  end

  def build_move_tree
    root = PolyTreeNode.new([0,0])

  end

  def self.valid_moves(pos)

  end


  def new_move_positions(pos)
    #should call valid moves && filter out visited_positions
    new_positions = KnightPathfinder.valid_moves(pos) - @visited_positions
    @visited_positions += new_positions
    new_positions
  end

end
