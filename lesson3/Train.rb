class Train
  attr_accessor :car_count      #количество вагонов
  attr_accessor :speed          #скорость
  attr_reader :current_station  #текущая станция
  attr_reader :next_station     #следующая станция
  attr_reader :prev_station     #предыдущая станция
  attr_reader :train_number     #номер поезда
  attr_reader :train_type       #тип поезда

  def initialize(train_number, train_type)
  	@train_number = train_number
  	@train_type = train_type
  	@speed = 0
  	@car_count = 20
  	
  end

  #метод торможения
  def stop
    @speed = 0  	
  end

  #метод, прицепляющий/отцепляющий вагоны, на вход получает тип операции: прицепить = 1, отцепить = -1
  def change_car(type)
    unless @speed != 0  
      if type.abs == 1
        @car_count += type
      else puts "Некорректное значение типа операции"
      end 
    else  puts "Поезд движется"
    end 
  end

  #метод получения маршрута следования
  #предполагается что поезд получает маршрут при завершении предыдущего, поэтому обнуляются
  #значения переменных @current_station (текущая станция) @prev_station (предыдущая станция) 
  def receive_route(route)
    @route = route.route #текущий маршрут поезда, будет использоваться в методе move_next
    @current_station = '' #текущая станция, будет использоваться в методе move_next
    @prev_station = '' #предыдущая станция, будет использоваться в методе move_next
    @next_station = @route[0] #устанавливаем первую станцию предстоящего маршрута в переменную @next_station будет использоваться в методе move_next
    @index_next_station = 0 #вспомогательная переменная для перемещения по массиву маршрута, будет использоваться в методе move_next 
  end

  #метод для перемещения между станциями маршрута
  def move_next
    @current_station = @route[@index_next_station]
    
    if @index_next_station == 0 
      @prev_station = 'Не определена'
    else @prev_station = @route[@index_next_station-1]
    end
    
    @index_next_station += 1
    @next_station = @route[@index_next_station]
  end
end 