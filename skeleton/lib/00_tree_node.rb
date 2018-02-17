require 'byebug'

class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value, parent=nil, children=[])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(parent)
    if self.parent != nil && self.parent != parent
      self.parent.children.delete(self)
    end

    @parent = parent

    return nil if parent.nil?
    # if parent.nil?
    #   remove_child(self)
    # end

    if @parent.children.include?(self)
      ##
    else
      @parent.children.push(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
    raise "Node is not a child!" unless self.children.include?(child_node)
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?

      current_node = queue.shift
      return current_node if current_node.value == target_value
      current_node.children.each {|child| queue.push(child)}
    end
    nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end

    nil
  end

  def inspect
    self.value
  end

end
#
# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")
# # puts n1
# # connect n3 to n1
# n3.parent = n2
# # connect n3 to n2
# n2.remove_child(n3)
#
# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]
#
# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []
