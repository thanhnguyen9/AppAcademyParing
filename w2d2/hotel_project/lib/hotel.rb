require_relative "room"

class Hotel
    attr_reader :rooms

#   def initialize(name, rooms )
#       @name = name 
#       @rooms = {}
#       rooms.each {|name, capacity| @rooms[name] = Room.new(capacity)     }
#   end

#   def name
#       @name.split(" ").map {|word| word.capitalize }.join(" ")
#   end

#   def room_exists?(name)
#       @rooms.has_key?(name)
#   end

#   def check_in(person, name)
#       if self.room_exists?(name)
#         if @rooms[name].add_occupant(person) 
#             p "check in successful"
#         else
#             p "sorry, room is full"
#         end

#       else
#         p "sorry, room does not exist"
#       end
#   end


#   def has_vacancy?
#       @rooms.values.any? {|room| !room.full?}
#   end  


#   def list_rooms
#       @rooms.each { |name, room| puts "#{name}. #{room.available_space}"}
#   end
end

# Hotel.new("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1)