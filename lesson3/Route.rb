class Route
  attr_reader :route

  def initialize(start_station, finish_station)
    @route = [start_station, finish_station] #массив для хранения списка названий станций в маршруте		
  end	

  #метод добавления станции в маршрут
  def add_station(add_name)
    @route.insert(@route.size-1, add_name)
  end  

  #метод удаления станции из маршрута
  def del_station(del_name)
  	@route.delete(del_name)
  end   

end 