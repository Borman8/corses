class Station
  attr_accessor :list_trains

  attr_reader   :name_station

  def initialize(name_station)
    @name_station = name_station
    @list_trains = []
  end
#добовляевм поез на станцию
  def add_train_to_list(train)
    @list_trains.push(train)
  end
#улаляем поезд со станции поез на станцию
  def remove_train_from_list(train)
    @list_trains.delete(train)
  end
# показываем список всех поездов на станци
  def show_all_trains_on_station
    puts "#{list_trains.size} поезд(ов) на станции."
    list_trains.each { |train| puts "Поезд ноер: #{train.number}, тип поезда: #{train.type}, количество вагонов: #{train.van}"  }
  end
end 