class PassengerTrain < Train

  attr_accessor :vans, :kind

  def initialize(number, vans)
    @kind = 'пассажирский'
    super
  end

  def push_van(van)
    if self.type_train == van.type_van
      @vans = van.type_van
    else 
      puts "Тип вагона и поезда разные"
    end
  end
end
