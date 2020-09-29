class PassengerTrain < Train

  attr_accessor :vans, :type_train

  def initialize(number, vans)
    @type_train = 'пассажирский'
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
