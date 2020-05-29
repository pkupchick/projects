require "byebug"
class Array

    def my_each(&prc)
        self.map{|ele| prc.call(ele)}
    end

    def my_select(&prc)
        result = []
        self.my_each{|ele| result << ele if prc.call(ele)}
        result
    end

    def my_reject(&prc)
         result = []
        self.my_each{|ele| result << ele if !prc.call(ele)}
        result
    end

    def my_any?(&prc)
        self.any? { |ele| prc.call(ele) }
    end

    def my_all?(&prc)
        self.all? { |ele| prc.call(ele) }
    end

    def my_flatten
        middle = []
        self.each do |sub|
            if sub.is_a?(Array)
                middle += sub.my_flatten
            else
                middle << sub
            end
        end
        middle
    end

    def my_zip(*arr)
        # result = Array.new(longest.max) { [] }
        # longest = arr.map { |sub| sub.length }

        # (0...longest.max).each do |idx_1|
        #     args.each do |ele|
        #         result[idx_1] << args[idx_1]
        #     end
        # end

        # result
    lengths = arr.map { |sub| sub.length }
    solved = Array.new(lengths.max) { [] }
        (0...lengths.max).each do |i|
            arr.each do |ele|
                solved[i] << ele[i]
            end
        end
    solved
    end

    def my_rotate(num)
        result = self
        if num > 0
            num.times do 
                first = result.shift
                result.push(first)
            end
        else 
            num = num * -1
            num.times do
                last = result.pop
                result.unshift(last)
            end
        end
        result
    end

    def my_join(str)
        solved = ""
            self.each_with_index do |char, i|
                if i != self.length - 1  
                    solved += char + str
                else
                    solved += char
                end
            end
        solved
    end

    def my_reverse
        i = self.length - 1
        result = []

        while i >= 0 
            result << self[i]
            i -= 1
        end
        result
    end




        

end