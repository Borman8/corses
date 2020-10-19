class Station

  extend InstanceCounter::ClassMethods
  include InstanceCounter::InstanceMethods
  
  attr_accessor :list_trains

  attr_reader   :name

  @all = []
  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
  end

  def self.all 
     @all 
  end
#добовляевм поез на станцию
  def add_train_to_list(train)
    @trains.push(train)
  end
#улаляем поезд со станции поезд на станцию
  def remove_train_from_list(train)
    @trains.delete(train)
  end
# показываем список всех поездов на станции
  def show_all_trains_on_station
    puts "#{trains.size} поезд(ов) на станции."
    trains.each { |train| puts "Поезд номер: #{train.number}, тип поезда: #{train.type}, количество вагонов: #{train.van}"  }
  end
end 
