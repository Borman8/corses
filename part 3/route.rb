class Route

  attr_reader :station, :start_point

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point

    @station = [start_point, end_point]

#    @new_station = []

  end
#Добаление станции
  def add_station(station)
#    @new_station.push(station)
    @station.insert(-2, station)

  end
#Удаление станции
  def remove_station(station)
    @station.delete(station) if [stations.first, stations.last].none?(station)
  end
#список всех станций 
  def list_stations
    station.each { |station| puts "Станции: #{station}" }
  end
end 
