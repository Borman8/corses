class Route

  attr_reader :stations, :start_point

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point

    @stations = [start_point, end_point]

#    @new_station = []

  end
#Добаление станции
  def add_station(station)
#    @new_station.push(station)
    @stations.insert(-2, station)

  end
#Удаление станции
  def remove_station(station)
    @stations.delete(station) if [stations.first, stations.last].none?(station)
  end
#список всех станций 
  def list_stations
    stations.each { |station| puts "Станции: #{station}" }
  end
end 
