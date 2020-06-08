
class Queue
    def initialize
        @window = []
    end

    def enqueue(item)
        @window.push(item)
    end

    def dequeue
        @window.shift
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

end