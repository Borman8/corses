class Train
  include CompanyName

  extend InstanceCounter::ClassMethods
  include InstanceCounter::InstanceMethods

  attr_accessor :speed

  VALID_NUMBER = /^.{3}\S.{2}/

  @@trains_list = {}
  attr_reader :number, :route, :start_point

  def initialize(number, vans)
    @number = number
    validation!    
    @speed = 0
    @@trains_list[number] = self
    register_instance
  end

  def self.trains_list
    @@trains_list
  end

  def self.find(number)
    @@trains_list[number]
  end
#Набор скорости 
  def up_speed(speed)
    @speed = speed 
  end
#Остановка поезда, сброс корстии до нуля
  def stop
    @speed = 0
  end
#Добавление вагона
  def add_van(van)
    @van = van
    #@n = 1
    #@van = van + @n if @speed.zero?
  end
# Отцепка вагона 
  def remove_van
    #@van = van - @n if @speed.zero?
  end
# Получение маршрута и назначение поезда в первый пунтк
  def get_route(route)
    @index = 0
    @route = route
  end

  def current_location
    route.stations[@index]
  end

    def next_location
    route.stations[@index + 1]
  end

  def previous_location
    if route.start_point == route.stations[@index]
      puts "Тупиковая станция"
    else
      route.stations[@index -1]
    end
  end

  def go_forward
    count_station = route.stations.size
    puts count_station
    if @index == count_station
      puts "Тупиковая станция"
    else
      route.stations[@index + 1]
      @index +=1
    end
  end

  def go_back
    if route.start_point == route.stations[@index]
      puts "Тупиковая станция"
    else
      route.stations[@index - 1]
      @index -=1      
    end
  end

  protected

  def validation!
    raise "Number can't be nil" if number.nil?
    raise "Number must be more then 5 symbols" if number.length < 5
    raise "Number has invalid format" if number !~ VALID_NUMBER
  end
end 
