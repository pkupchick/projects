
class Stack
    def initialize
        @window = []
    end

    def peek
        @window.last
    end

    def empty?
        @window.empty?
    end

    def size
        @window.length
    end

    def push(item)
        @window.push(item)
    end

    def pop
        @window.pop
    end
    
end