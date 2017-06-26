class Station

  def initialize(name)
  	@name = name   #название станции
    @trains = {}   #хеш, для хранения списка поездов, находящихся на станции (используется во всех методах класса)
  end

  #метод прибытия поезда на станцию #incoming_train - инстанс класса Train
  def take_train(incoming_train)
	  @trains[incoming_train.train_number] = incoming_train
  end

  # метод отправления поезда
  def dispatch_train(train)
		@trains.delete(train.train_number)
  end

  # метод вывода списка поездов на станции
  def trains
    puts "Поезда, находящиеся на станции в текущий момент:"
    @trains.each_key{|k| puts "#{k}"}
  end

  # метод вывода списка поездов по типу поезда
  def trains_by_type(train_type)
    trains = {} #хеш для выборки поездов заданного типа
    trains = @trains.select{|k,v| v.train_type == train_type}
    puts "Поезда, типа #{train_type}, находящиеся на станции в текущий момент:"
    trains.each_key{|k| puts "#{k}"}
    puts "Количество: #{trains.size}"   
  end 

end 