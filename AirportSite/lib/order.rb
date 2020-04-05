# frozen_string_literal: true

# Class
class Order
  attr_reader :num, :where_from, :where_to, :date, :time, :name, :surname

  def initialize(num, where_from, where_to, time, date, name, surname)
    @num = num
    @where_from = where_from
    @where_to = where_to
    @time = time
    @date = date
    @name = name
    @surname = surname
  end

  def to_s
    "Numb: #{@num}" \
    "\nWhere from: #{@where_from}" \
    "\nWhere to: #{@where_to}" \
    "\nTime: #{@time}" \
    "\nDate: #{@date}" \
    "\nName: #{@name}" \
    "\nSurname: #{@surname}\n\n"
  end
end
