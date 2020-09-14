class Train
  attr_accessor :speed

  attr_reader :number, :type, :van, :route, :start_point
  def initialize(number, type, van)
    @number = number
    @type = type
    @van = van

    @speed = 0
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
  def add_van
    @van = van + n if self.speed == 0
  end
# Отцепка вагона 
  def remove_van
    @van = van - n if self.speed == 0
  end
# Получение маршрута и назначение поезда в первый пунтк
  def get_route(route)
    @index = 0
    @route = route
  end

  def current_location
    route.station[@index]
  end

    def next_location
    route.station[@index + 1]
  end

  def previous_location
    if route.station.first == route.station[@index]
      puts "Тупиковая станция"
    else
      route.station[@index -1]
    end
  end

  def go_forward
    count_station = route.station.size
    puts count_station
    if @index == count_station
      puts "Тупиковая станция"
    else
      route.station[@index + 1]
      @index +=1
    end
  end

  def go_back
    if route.station.first == route.station[@index]
      puts "Тупиковая станция"
    else
      route.station[@index - 1]
      @index -=1      
    end
  end
end 