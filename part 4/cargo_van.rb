class CargoVan < Van

  attr_accessor :type_van

  def initialize
    @type_van = 'грузовой'
  end

end