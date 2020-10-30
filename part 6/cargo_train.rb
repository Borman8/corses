class CargoTrain < Train

  attr_accessor :vans, :kind

  def initialize(number, vans)
    @kind = 'грузовой'
    super
  end

  def push_van(van)
    if self.train == van.kind
      @vans = van.kind
    else 
      puts "Тип вагона и поезда разные"
    end
  end
end
