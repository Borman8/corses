require_relative 'route'

require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'

require_relative 'van'
require_relative 'passenger_van'
require_relative 'cargo_van'

require_relative 'station'

#route = Route.new('Moscow', 'Питер')
#puts "Мршрут #{route.list_stations}"

class RailRoad

  def initialize
    @trains = []
    @stations = []
    @routes = []   
  end

  def get_route(route)
    @index = 0
    @route = route
  end

  def show_stations_list
    puts "Станции #{@stations}"
  end

  def show_trains_list
    puts "#{@trains.size} поезд(ов) на станции."
    @trains.each { |train| puts "Поезд номер: #{train.number}, тип поезда: #{train.type_train}, количество вагонов: #{train.vans}"  }
  end

  def show_trains_list_number
    @trains.each { |train| puts "Поезд номер: #{train.number}, тип #{train.type_train}, в составе которого #{train.vans} вагонов(а)" }
  end

  def show_stations_list_route
    @stations.each { |station| puts "#{station}" }
  end

  def show_routes_list
    @routes.each_with_index { |route, index| puts "#{index.next}. #{route}" }
    # @routes.each { |route| puts "#{route.list_stations}" }
  end

  def start
    system 'clear'
    loop do
      
      start_menu

      case gets.chomp.to_i
      when 0
        break
      when 1 
        create_element
      when 2 
        change_element
      when 3 
        info_object
      else
        puts 'Неизвестная команда!'
      end
    end
  end

  def start_menu
    
    puts "**************************************************************************************************"
    puts "Добро пожаловать в меню управления железной дорогой. Выберети одно из следующих действий"
    puts "**************************************************************************************************"

    puts '0 - выйти из меню'
    puts '1 - для создания поезда, станции, маршрута'
    puts '2 - для изменение маршрута, состава поездов и их перемещения'
    puts '3 - для получения информации о поездах, маршрутах и станциях'
  

  end

  def sub_menu
    puts 'Выберите желаемое действие.'
    puts 'Введите 1 => для создания поезда;'
    puts 'Введите 2 => для создания станции;'
    puts 'Введите 3 => для создания маршрута;'
    puts 'Для возврата в предыдущее меню нажмите 0 ...'
  end

  def sub_menu_level2

    puts 'Выберите желаемое действие.'
    puts 'Введите 1 => изменить маршрут'
    puts 'Введите 2 => прицепить вагон к поезду или отцепить вагон от поезда;'
    puts 'Введите 3 => назначить маршрут для поезда;'
    puts 'Введите 4 => перемещения поезда по маршруту'
    puts 'Для возврата в предыдущее меню нажмите 0 ...'
    
  end

  def sub_menu_level3
    puts 'Выберите желаемое действие. Некоторые функции станут доступны после создания обьектов!'
    puts 'Введите 1 => для вывода информации о поездах, станциях и маршрутах;'
    puts 'Введите 2 => для вывода информации о поездах на станции;'
    puts
    puts 'Для возврата в предыдущее меню нажмите Enter или 0 ...'
  end

  def create_element

    sub_menu

    case gets.chomp.to_i
      when 0
        puts "Спасибо за визит"
      when 1
        print "Введите номер нового поезда: "
        number = gets.chomp.to_i

        print "Введите тип поезда, 1 - грузовой; 2 - пассажирский"
        type = gets.chomp.to_i

        print "Введите количество вагонов: "
        vans_count = gets.chomp.to_i
        vans = 0
        if type == 1 
          vans = vans + vans_count
        elsif type == 2
          vans = vans + vans_count
        else
          puts "Неверный тип поезда"
        end

        if type == 1 
          @trains << CargoTrain.new(number, vans) 
        else
          @trains << PassengerTrain.new(number, vans)
        end

        puts 'Создан(ы):'
        show_trains_list
        puts "*********************************"
      when 2 
        system 'clear'
        puts "Введите назваине станции"
        @stations << gets.chomp.to_s
        puts "Станция #{@stations.last} создана"
        puts 'Список всех станций:'
        show_stations_list 
      when 3
        show_stations_list
        puts  'Ввберите номер начальной станции...'
        start_station = @stations[gets.chomp.to_i - 1]
        puts  'Выберите номер конечной станции...'
        end_station = @stations[gets.chomp.to_i - 1]
        @routes << [start_station, end_station]
        puts "Маршрут #{@routes.last} создан."
        puts 'Создан(ы):'
        show_routes_list  
        puts "\n"
        sleep(0.3)
      else
        puts 'Команды нет в списке'
    end
  end

  def change_element

    sub_menu_level2

    case gets.chomp.to_i
      when 0
        puts "Спасибо за визит"
      when 1
        puts "Изменения маршрута, выберите маршрут"
        show_routes_list
        @route_to_change = @routes[gets.chomp.to_i - 1]   
        puts "Выбран маршрут: #{@route_to_change}"

        puts "Выберите одно из следующих действи, 1 => добавить станцию в маршрут; 2 => удалить станцию из маршрута; 0 => выйти"
        select_action = gets.chomp.to_i
        if select_action == 0
           return
        elsif select_action == 1
          puts "Введите название станции"
          new_station = gets.chomp.to_s
          puts "#{new_station} - создана"

          update_route = @route_to_change.insert(-2, new_station)  #@routes[0].insert(-2, new_station) 
          puts "новый маршрет: #{update_route}"

        elsif select_action == 2
          puts "Введите название станции которую хотите удалить"
          remove_station = gets.chomp.to_s

         if remove_station == @route_to_change[0] || remove_station == @route_to_change[-1] 
          puts "Начальную и конечную станцию удалять нельзя"     
         else
          @route_to_change.delete(remove_station)
          puts "Станция: #{remove_station}, удалена из маршрута, новый маршрут: #{@route_to_change} "
         end2
        end 
      end
      when 2
        system 'clear'
        puts  '-*-' * 15
        show_trains_list_number
        puts  '-*-' * 15
        puts 'Выберите поезд для управления его составом...'  
        puts "@trains: #{@trains}"
        @select_train = @trains[gets.chomp.to_i - 1]
        puts "Выбран - #{@select_train}"

        puts "Введите:\n 1 => для добавления вагона в состав\n 2 => для удаления вагона из состава\n 0 => для выхода из меню"
        sel = gets.chomp.to_i
        return if sel == 0
        if sel == 1
          puts ' Введеите 1 для добавления товарного (cargo) и 2 - для добавления пассажирского (passenger) вагонов'
          van_type = gets.chomp.to_i
          if van_type == 1 
            @select_train.vans += 1
            # train.attache_wagon(:cargo) 
          elsif van_type == 2 
            @select_train.vans += 1
          else
            puts "Вагон другого типа и не добавлен в состав."
          end
        end
        if sel == 2
          @select_train.vans -= 1
        end
        sleep(0.3)
      when 3
        system 'clear'
        puts 'Назначаем маршрут поезду...'
        if @trains.empty? || @routes.empty?
          puts "Нужно сначала создать поезд/маршрут"
        else
          puts  '-*-' * 15
          show_trains_list_number
          puts  '-*-' * 15
          puts 'Выберите поезд для назначения маршрута...'  
          train = @trains[gets.chomp.to_i - 1]
          puts "Выбран - #{train}"
          puts  
          show_routes_list
          puts 'Введите номер маршрута для его назначения.'
          route = @routes[gets.chomp.to_i - 1]
          train.get_route(route)
          puts 'Маршрут успешно назначен'
      end
      when 4
        system 'clear'
        puts 'Перемещение поезда по маршруту...'
        puts 'Доступны следующие поезда:'
        show_trains_list_number
        puts 'Введите номер поезда для отправления: '

        train = @trains[gets.chomp.to_i - 1]

        puts "train: #{train}"
        puts "route: #{train.route}"
        @index_location = 0
        @current_station = train.route[@index_location]
        puts "current_station: #{@current_station}"

        if train
          loop do
            puts "Поезд находится на станции: #{@current_station}"
            puts 'Введите 1 для отправления поезда вперед'
            puts 'Введите 2 для отправления поезда назад'
            puts
            puts 'Для возврата в предыдущее меню нажмите Enter или 0 ...'
            opt = gets.chomp.to_i
            case opt
            when 0
              break
            when 1
              if @index_location == train.route.size - 1
                puts 'Ошибка, поезд на последней станции маршрута.'
              else
                @index_location += 1
                @current_station = train.route[@index_location]
                puts "Поезд прибыл на станцию #{@current_station}"
              end
            when 2
              if train.route[0] == @current_station
                puts 'Ошибка, поезд на первой станции маршрута.'
              else
                @index_location -= 1
                @current_station = train.route[@index_location]
                puts "Поезд прибыл на станцию #{@current_station}"
              end
            else
              puts 'Неизвестная команда!'
            end
          end 
        end     
      end
  end
  def info_object
      system 'clear'
      loop do

        sub_menu_level3

        case gets.chomp.to_i
        when 0
          break
        when 1 
          puts "Информация о поездах"
          show_trains_list
          puts '-*-' * 20
          puts "Информация о станциях"
          show_stations_list
          puts '-*-' * 20
          puts "Информация о маршрутах"
          show_routes_list
          puts '-*-' * 20
        when 2
          puts  'Информация о поездах на станциях '
          show_station_info
          puts '-*-' * 20
        else
          puts 'Неизвестная команда!'
        end
        sleep(0.3)
      end
    end
end

menu = RailRoad.new
menu.start

