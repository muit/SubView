class MarsRover
  attr_accessor :x, :y, :position, :orientation

  def initialize(x, y, o)
    @position = Vector2.new(x, y)
    @command = []
    @orientation = Orientation.new(o)
  end

  class Vector2
    attr_accessor :x, :y
    def initialize(x, y)
      @x = x
      @y = y
    end
  end

  class Orientation
    def initialize(o)
      @o = ["N", "E", "S", "W"]
      if o != "N" && o != "E" && o != "S" && o != "W"
        @o[0] = "ERROR"
        return "ERROR. Orientation must be N, E, S or W."
      end

      while o != @o[0]
        turn(true)
      end
    end

    def get
      return @o[0]
    end

    def turn(direction)#true=rigth/false=left
      if @o[0]!="ERROR"
        if direction
          @o.push(@o.shift)
        else
          reject = ""
          @o.delete_if {|v| reject << v if v == @o[@o.length-1]}
          @o.unshift(reject)
        end
      end
    end
  end

  def startCommand(string)
    @command = string.split("")
    @commandString = string

    @command.each do |cm|
      execute(cm)
    end
  end

  def getCommand
    @commandString
  end

  def execute(command)
    case command
    when "l"
      @orientation.turn(false)
    when "r"
      @orientation.turn(true)
    when "f"
      move(true)
    when "b"
      move(false)
    else
      puts "ERROR. '"+command+"' is not a correct command."
    end
  end

  def move(value)#true=foward/false=backward
    case @orientation.get
    when "N"
      @position.y += (value ? 1 : -1)
    when "E"
      @position.x += (value ? 1 : -1)
    when "S"
      @position.y -= (value ? 1 : -1)
    when "W"
      @position.x -= (value ? 1 : -1)
    end

    @position.x %= Map.getWidth
    @position.y %= Map.getHeigth

  end
end

class Map 
  extend << self
  def setWidth
    @width = width
  end
  def setHeight
    @height = height
  end
  def reset(height=10, width=10)
    @height = height
    @width = width
  end

  def getWidth
    @width
  end
  def getHeigth
    @height
  end
end