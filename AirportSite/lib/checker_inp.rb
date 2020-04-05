# frozen_string_literal: true

require 'date'

# Module
module CheckerInp
  def self.day_s?(str, str2)
    fr = Date.parse(str)
    sc = Date.parse(str2)
    return true if fr == sc || (fr + 1 == sc) || (fr - 1 == sc) || (fr + 2 == sc) || (fr - 2 == sc)

    false
  end

  def self.check_new_flight(object)
    return false unless CheckerInput.integer?(object.number.to_s)
    return false unless CheckerInput.city?(object.where_from)
    return false unless CheckerInput.city?(object.where_to)
    return false unless CheckerInput.time?(object.time_from)
    return false unless CheckerInput.time?(object.time_to)
    return false unless CheckerInput.date?(object.date_from)
    return false unless CheckerInput.date?(object.date_to)
    return false unless CheckerInput.type?(object.type)
    return false unless CheckerInput.integer?(object.cost.to_s)

    true
  end

  def self.check_new_order(object)
    return false unless CheckerInput.integer?(object.num.to_s)
    return false unless CheckerInput.city?(object.where_from)
    return false unless CheckerInput.city?(object.where_to)
    return false unless CheckerInput.time?(object.time)
    return false unless CheckerInput.date?(object.date)
    return false unless CheckerInput.city?(object.name)
    return false unless CheckerInput.city?(object.surname)

    true
  end
end
