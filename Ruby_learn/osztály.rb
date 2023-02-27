class Greeter #basic_object az ősosztálya
  #csomó metódust örököl alapból, de le lehet őket tiltani : Greeter.instance_methods(false)
  # Greeter.respond_to?("say_hi") -> true ha van olyan függvényhívása
  def initialize(name = "World") #inicializálás, konstruktor gyakorlatilag
    @name = name #itt hozod létre az adatagot, ez full privát így, se getter, se setter
  end
  def say_hi
    puts"Hi #{@name}"
  end
end

greeter = Greeter.new("Geri") #példányosítás
greeter.say_hi

class Greeter #utólag buherálod a class-t, így már elérhető az adattag
  attr_accessor :name
end

greeter.name = "NemGeri"
greeter.say_hi