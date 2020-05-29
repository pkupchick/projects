require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = Hash.new
        hash.each do |name, capacity|
            @rooms[name] = Room.new(capacity)
        end
    end

    def name
        new_name = @name.split.map { |ele| ele.capitalize }
        new_name.join(" ")
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        else
            return false
        end 
    end
    
    def check_in(person, room_name)
        if !room_exists?(room_name)
            p "sorry, room does not exist"
        elsif !@rooms[room_name].full?
            @rooms[room_name].add_occupant(person)
            p "check in successfull"
        else
            p "sorry, room is full"
        end
    end

    def has_vacancy?
        count = 0
        solved = Hash.new()
        @rooms.each do |room, capacity|
            if !capacity.full?
                count += 1
            end
        end
        if count == 0
            return false
        else count > 1
            return true
        end
    end

    def list_rooms
        @rooms.each do |room, capacity|
                puts room + ", " + capacity.available_space.to_s 
        end
    end
end