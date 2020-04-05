# frozen_string_literal: true

require 'sinatra'
require_relative 'lib/flight'
require_relative 'lib/flight_list'
require_relative 'lib/order'
require_relative 'lib/order_list'
require_relative 'lib/checker_input'
require_relative 'lib/dao'

set :bind, '0.0.0.0'

configure do
  set :flights, Dao.read_flight
  set :orders, Dao.read_order
end

configure :test do
end

get '/' do
  erb :info
end

get '/index' do
  @flights = settings.flights
  settings.flights.in_file
  erb :index
end

get '/index_or' do
  @orders = settings.orders
  settings.orders.in_file
  erb :index_or
end

get '/flights/new' do
  @flight = Flight.new('', '', '', '', '', '', '', '', '')
  erb :new_flight
end

post '/flights/new' do
  @errors = CheckerInput.check_flight_input(params)
  unless @errors.empty?
    @number = params['number']
    @where_from = params['where_from']
    @where_to = params['where_to']
    @time_from = params['time_from']
    @date_from = params['date_from']
    @time_to = params['time_to']
    @date_to = params['date_to']
    @type = params['type']
    @cost = params['cost']
    return erb :new_flight
  end
  flight = Flight.new(params['number'].to_i, params['where_from'],
                      params['where_to'], params['time_from'], params['time_to'], params['date_from'],
                      params['date_to'], params['type'], params['cost'].to_i)
  settings.flights.add(flight)
  redirect to('/index')
end

get '/flights/del/:index' do
  settings.flights.del(params[:index].to_i)
  redirect to('/index')
end

get '/orders/new' do
  @order = Order.new('', '', '', '', '', '', '')
  erb :new_order
end

post '/orders/new' do
  @errors = CheckerInput.check_order_input(params)
  unless @errors.empty?
    @num = params['num']
    @where_from = params['where_from']
    @where_to = params['where_to']
    @time = params['time']
    @date = params['date']
    @name = params['name']
    @surname = params['surname']
    return erb :new_order
  end
  return erb :new_order unless settings.orders.check_num(params['num'].to_i)

  order = Order.new(params['num'].to_i, params['where_from'],
                    params['where_to'], params['time'], params['date'], params['name'], params['surname'])
  settings.orders.add(order)
  redirect to('/index_or')
end

get '/orders/del/:index' do
  settings.orders.del(params['index'].to_i)
  redirect to('/index_or')
end

get '/orders/search/:index' do
  a = settings.orders.get_information_where_from(params[:index].to_i)
  b = settings.orders.get_information_where_to(params[:index].to_i)
  c = settings.orders.get_information_date(params[:index].to_i)

  @arr = settings.flights.abc(a, b, c)
  erb :search
end

get '/select/scan_where_date' do
  @errors = []
  @where_from = @where_to = @date_from = ''
  erb :scan_where_date
end

post '/select/scan_where_date' do
  @errors = CheckerInput.check_cities_and_date_input(params)
  unless @errors.empty?
    @where_from = params['where_from']
    @where_to = params['where_to']
    @date_from = params['date_from']
    return erb :scan_where_date
  end
  @flights = settings.flights.flights_where_from_to_date(params['where_from'], params['where_to'], params['date_from'])
  erb :result_scan_where_date
end

get '/select/scan_date_time' do
  @errors = []
  @date = @time = ''
  erb :scan_date_time
end

post '/select/scan_date_time' do
  @errors = CheckerInput.check_date_and_time_input(params)
  unless @errors.empty?
    @date = params['date']
    @time = params['time']
    return erb :scan_date_time
  end
  @orders = settings.orders.orders_date_time(params['date'], params['time'])
  erb :result_scan_date_time
end

get '/route' do
  @errors = []
  @where_to = @where_from = @flights = ''
  erb :scan_where
end

post '/route' do
  @errors = CheckerInput.check_cities_input(params)
  unless @errors.empty?
    @where_from = params['where_from']
    @where_to = params['where_to']
    return erb :scan_where
  end
  @flights = settings.flights.route(params['where_from'], params['where_to'])
  erb :result_route
end

get '/order/delete_f' do
  @order_lists = settings.orders
  erb :delete_order_f
end

post '/order/delete_f' do
  @where_f = params['where_f']
  settings.orders.each do |order|
    next unless order.where_from == @where_f

    settings.orders.delete_order(order)
  end
  redirect to('/index_or')
end

get '/order/delete_t' do
  @order_lists = settings.orders
  erb :delete_order_t
end

post '/order/delete_t' do
  @where_t = params['where_t']
  settings.orders.each do |order|
    next unless order.where_to == @where_t

    settings.orders.delete_order(order)
  end
  redirect to('/index_or')
end
