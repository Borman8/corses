class Train
  attr_accessor :speed

  attr_reader :number, :vans, :route, :start_point
  def initialize(number, vans)
    @number = number
    #@type = type
    @vans = vans

    
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
    @n = 1
    @van = van + @n if @speed.zero?
  end
# Отцепка вагона 
  def remove_van
    @van = van - @n if @speed.zero?
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

  def on_last_station?
    @current_location_index = 0
    @current_location_index == @route.size - 1
  end

    def on_first_station?
    @current_location_index == 0    
  end
end 
