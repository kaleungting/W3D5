require "byebug"
class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    #@parent = n1
    #     # removing itself from self.parent.children 
    def parent=(parent_node)

        if @parent != nil and @parent != parent_node
            self.parent.children.delete(self)
        end 

        @parent = parent_node

        if parent_node != nil
            if !parent_node.children.include?(self)
                parent_node.children << self
            end
        end

    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        if child_node.parent == nil
            raise "error"
        else 
            child_node.parent=(nil)
        end
    end

    def dfs(target)
        return self if target == self.value

        if self.children != nil
            self.children.each do |child|
                search_result = child.dfs(target)
                return search_result if search_result != nil
            end
        end 
        nil
    end

    def bfs(target) 5
        return self if self.value == target
        array = [self] 

        until array.empty?
            el = array.shift
            return el if el.value == target #1 != 5
            el.children.each {|child| array << child}
        end
        nil

    end

    def inspect
        self.value
    end 




end

   