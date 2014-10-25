require_relative "../lib/main.rb"

describe "Mars rover" do
  before :each do
    @x = 0
    @y = 0
    @orientation = "N"
    @marsrover = MarsRover.new(@x,@y,@orientation)
  end
  it "starts at x and y position" do
    expect(@marsrover.position.x).to eq(@x)
    expect(@marsrover.position.y).to eq(@y)
  end

  it "receives an empty command" do
    @marsrover.startCommand("")

    expect(@marsrover.getCommand).to eq("")
  end

  it "receives a command" do
    @marsrover.startCommand("")

    expect(@marsrover.getCommand).to eq("")
  end

  it "returns correct Orientation" do
    expect(@marsrover.orientation.get).to eq("N")

    @marsrover = MarsRover.new(@x,@y,"E")
    expect(@marsrover.orientation.get).to eq("E")
  end

  it "Lands on the correct position when given a single f/b command" do
    @marsrover.startCommand("f")

    expect(@marsrover.position.x).to eq(0)
    expect(@marsrover.position.y).to eq(1)
  end

  it "Lands on the correct position when given multiple f/b commands" do
    @marsrover.startCommand("ffbfffbbb")

    expect(@marsrover.position.x).to eq(0)
    expect(@marsrover.position.y).to eq(1)
  end

  it "ends up with the correct orientation when given a single r/l command" do
    @marsrover.startCommand("r")

    expect(@marsrover.orientation.get).to eq("E")
  end

  it "ends up with the correct orientation when given multiple r/l commands" do
    @marsrover.startCommand("rrlrrrlll")

    expect(@marsrover.orientation.get).to eq("E")
  end

  it "ends up with the correct orientation when given complex commands" do
    @marsrover.startCommand("flblblbfrrblrblllbfr")

    expect(@marsrover.position.x).to eq(3)
    expect(@marsrover.position.y).to eq(2)
    expect(@marsrover.orientation.get).to eq("E")
  end

  it "" do
    @marsrover.startCommand("b")

    expect(@marsrover.position.x).to eq(0)
    expect(@marsrover.position.y).to eq(9)
    expect(@marsrover.orientation.get).to eq("N")
  end

  
end
