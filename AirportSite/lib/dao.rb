# frozen_string_literal: true

require 'yaml'
require_relative 'flight'
require_relative 'flight_list'
require_relative 'order'
require_relative 'order_list'
require_relative 'checker_input'

# Module
module Dao
  def self.read_flight
    abort('File not found in catalog!') unless File.exist?(File.expand_path('../data/data.yaml', __dir__))
    flights = FlightList.new
    data = Psych.load_file(File.expand_path('../data/data.yaml', __dir__))
    data_flight = data['flight']
    data_flight.each do |line|
      keys = %w[number where_from where_to time_from time_to date_from date_to type cost]
      values = line.values_at(*keys)
      flight = Flight.new(*values)
      flights.add(flight) if CheckerInp.check_new_flight(flight)
    end
    flights
  end

  def self.read_order
    abort('File not found in catalog!') unless File.exist?(File.expand_path('../data/data.yaml', __dir__))
    orders = OrderList.new
    data = Psych.load_file(File.expand_path('../data/data.yaml', __dir__))
    data_order = data['order']
    data_order.each do |line|
      keys = %w[num where_from where_to time date name surname]
      values = line.values_at(*keys)
      order = Order.new(*values)
      orders.add(order) if CheckerInp.check_new_order(order)
    end
    orders
  end
end
