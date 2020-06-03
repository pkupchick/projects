# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue StandardError
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class Coffee < StandardError; end
# We need a custom error for coffee input
# We need a custom error for anything else

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise Coffee.new "I love coffee but I need fruit"
  else 
    raise StandardError
  end 
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 

  rescue Coffee => e
    puts e.message
    retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if name.length <= 0
      raise "Need to know your name to be friends!"
    else
      @name = name
    end
    if yrs_known < 5
      raise "We haven't been friends long enough buddy"
    else
      @yrs_known = yrs_known
    end
    if fav_pastime.length <= 0
      raise "How we gon be boys if I don't know how you like to party"
    else
      @fav_pastime = fav_pastime
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


