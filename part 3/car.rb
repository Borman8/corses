class Car
  attr_accessor :speed

  attr_reader :engine_volume
  def initialize(speed = 0, engine_volume= 2.5)
    @speed = speed
    @engine_volume = engine_volume
  end

  def start_engine
    puts "start"
  end

  def stop
    self.speed = 0
  end

  def go
    self.speed = 50
    start_engine
  end

  def speed
    @speed
  end

  def engine_volume
    @engine_volume
  end

  def speed=(speed)
    @speed = speed
  end 


end

