class PolyTreeNode
    attr_accessor :value, :parent, :children
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        if node == nil
            @parent = nil
            return
        end
        
        self.parent.children.delete(self) unless @parent.nil?
        @parent = node
        node.children << self if !node.children.include?(self)
        # if !node.children.include?(self)
        #     @parent = node
        #     node.children << self
        #     @parent.children.delete(self)
        # end
    end

    def inspect
        "#<PolyTreeNode: #{self.object_id}>"
    end

    def add_child(child)
        child.parent = self
    end    

    def remove_child(child)
        if @children.include?(child)
            child.parent = nil
        else
            raise "No Child Here!"
        end
    end

    def dfs(target)
        return self if self.value == target
        return nil if self.value.nil?
        @children.each do |child|
            step_1 = child.dfs(target)
            return step_1 if step_1 != nil
        end
        return nil
    end

    def bfs(target)
        queue = [self]
        until queue == []
            curr = queue.shift
            return curr if curr.value == target
            queue += curr.children
        end
        return nil
    end
end



