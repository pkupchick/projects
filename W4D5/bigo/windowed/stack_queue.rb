require_relative "stack.rb"

class StackQueue
    
    def initialize
        @goes_in = Stack.new
        @goes_out = Stack.new
    end

    def size
        @goes_in.size + @goes_out.size
    end

    def empty?
        @goes_out.empty? && @goes_in.empty?
    end

    def enqueue(item)
        @goes_in.push(item)
    end

    def dequeue
        self.fill_stack_up if @goes_out.empty?
        @goes_out.pop
    end

    def fill_stack_up
        @goes_out.push(@goes_in.pop) until @goes_in.empty?
    end

end