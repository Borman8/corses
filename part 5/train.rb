class Train
  include CompanyName

  extend InstanceCounter::ClassMethods
  include InstanceCounter::InstanceMethods

  attr_accessor :speed


  @trains_list = []
  attr_reader :number, :route, :start_point

  def initialize(number)
    @number = number
    #@type = type
    #@vans = vans    
    @speed = 0
    self.class.train_list<< self
    register_instance
  end

  def self.train_list
    @trains_list
  end

  def self.find(item)
    @trains_list.each do |single|
      if single.number == item
        puts single
      end
    end
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
end 
