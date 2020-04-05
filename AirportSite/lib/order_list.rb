# frozen_string_literal: true

# Class
class OrderList
  def initialize
    @orders = []
  end

  def check_num(num)
    @orders.each { |order| return false if order.num == num }
    true
  end

  def add(new_order)
    @orders.append(new_order)
  end

  def each
    @orders.each { |order| yield order }
  end

  def each_with_index
    @orders.each_with_index { |order, index| yield order, index }
  end

  def del(index)
    @orders.delete_at(index)
  end

  def get_information_where_from(index)
    @orders[index].where_from
  end

  def get_information_where_to(index)
    @orders[index].where_to
  end

  def get_information_date(index)
    @orders[index].date
  end

  def orders_date_time(date, time)
    @orders.select do |row|
      (row.date == date) && (row.time == time)
    end
  end

  def delete_order(obj)
    @orders.delete(obj)
  end

  def in_file
    File.open('data/orders.txt', 'w') do |file|
      @orders.each { |order| file.write(order) }
    end
  end
end
