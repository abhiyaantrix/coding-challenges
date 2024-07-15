# frozen_string_literal: true

require_relative 'tree_node'

# Simple Binary Tree data structure based on TreeNode
class BinaryTree

  attr_reader :root

  def initialize(node_values)
    @root = build_tree(node_values)
  end

  def build_tree(values)
    return nil if values.nil? || values.empty?

    root_node = TreeNode.new(values[0]) # first element is root

    queue = [root_node]

    index = 1

    while index < values.length
      current_node = queue.shift

      unless values[index].nil?
        current_node.left = TreeNode.new(values[index]) # second element is left node

        queue.push(current_node.left)
      end

      index += 1

      break if index >= values.length

      unless values[index].nil?
        current_node.right = TreeNode.new(values[index]) # second element is right node

        queue.push(current_node.right)
      end

      index += 1
    end

    root_node
  end

  def to_a
    return [] if root.nil?

    arr = []
    queue = [root]

    until queue.empty?
      current_node = queue.shift

      if current_node
        arr << current_node.val

        queue.push(current_node.left)
        queue.push(current_node.right)
      elsif queue.any? { |node| !node.nil? }
        arr << nil
      end
    end

    arr
  end

end
