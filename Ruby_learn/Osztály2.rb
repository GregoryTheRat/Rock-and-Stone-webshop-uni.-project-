class MegaGreeter
  attr_accessor :names
  def initialize(names = "world")
    @names = names
  end

  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each") #foreach-et lehet e használni rá, azaz kollekció?
      @names.each do |name|  #foreach
        puts "hello #{name}"
      end
    end
    #folytatni weboldalról ....
  end
end

