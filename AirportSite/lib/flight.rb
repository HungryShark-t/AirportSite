# frozen_string_literal: true

# Class
class Flight
  attr_reader :number, :where_from, :where_to, :time_from, :time_to, :date_from, :date_to, :type, :cost
  def initialize(number, where_from, where_to, time_from, time_to, date_from, date_to, type, cost)
    @number = number
    @where_from = where_from
    @where_to = where_to
    @time_from = time_from
    @time_to = time_to
    @date_from = date_from
    @date_to = date_to
    @type = type
    @cost = cost
  end

  def to_s
    "Number: #{@number}" \
    "\nWhere from: #{@where_from}" \
    "\nWhere to: #{@where_to}" \
    "\nTime from: #{@time_from}" \
    "\nTime to: #{@time_to}" \
    "\nDate from: #{@date_from}" \
    "\nDate to: #{@date_to}" \
    "\nType: #{@type}" \
    "\nCost: #{@cost}\n\n"
  end
end
