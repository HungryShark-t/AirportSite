# frozen_string_literal: true

require 'date'
require_relative 'checker_input'
require_relative 'checker_inp'

# Class
class FlightList
  def initialize
    @flights = []
  end

  def add(new_flight)
    @flights.append(new_flight)
  end

  # def each
  #   @flights.each { |flight| yield flight }
  # end

  def each_with_index
    @flights.each_with_index { |flight, index| yield flight, index }
  end

  def del(index)
    @flights.delete_at(index)
  end

  def flights_where_from_to_date(where_from, where_to, date_from)
    @flights.select do |row|
      (row.where_from == where_from) && (row.where_to == where_to) && (row.date_from == date_from)
    end
  end

  def route(where_from, where_to)
    selection = []
    @flights.each do |row|
      next unless (row.where_from == where_from) && (row.where_to != where_to)

      @flights.each do |row2|
        if (row2.where_from == row.where_to) &&
           (row2.where_to == where_to) && CheckerInput.day?(row.date_to, row2.date_from)
          selection.append([row, row2])
        end
      end
    end
    selection
  end

  def abc(where_from, where_to, date)
    arr = []
    @flights.each do |row|
      arr.push(row) if (row.where_from == where_from) && (row.where_to == where_to) &&
                       CheckerInp.day_s?(row.date_from, date)
    end
    arr
  end

  def in_file
    File.open('data/flights.txt', 'w') do |file|
      @flights.each { |flight| file.write(flight) }
    end
  end
end
