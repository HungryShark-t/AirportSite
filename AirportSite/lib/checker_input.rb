# frozen_string_literal: true

require 'date'

# Module
module CheckerInput
  def self.integer?(string)
    string != '' && string =~ /\p{Digit}/
  end

  def self.city?(string)
    string != '' && string =~ /\p{Lower}/
  end

  def self.time?(string)
    string != '' && string =~ /^([0-1]\d|2[0-3])(:[0-5]\d)$/
  end

  def self.date?(string)
    string != '' && string =~ /^(19|20)\d\d-((0[1-9]|1[012])-(0[1-9]|[12]\d)|(0[13-9]|1[012])-30|(0[13578]|1[02])-31)$/
  end

  def self.days?(str, str2)
    if !str.empty? && !str2.empty?
      fr = Date.parse(str)
      sc = Date.parse(str2)
      return true if fr < sc || fr == sc
    end

    false
  end

  def self.day?(str, str2)
    fr = Date.parse(str)
    sc = Date.parse(str2)
    return true if fr == sc || (fr + 1 == sc)

    false
  end

  def self.type?(string)
    string != '' && string =~ /\p{Alnum}/
  end

  def self.check_flight_input(params)
    errors = []
    errors.append('Введите в поле НОМЕР только цифры') unless integer?(params['number'])
    unless city?(params['where_from'])
      errors.append('В поле ГОРОД ОТПРАВЛЕНИЯ используются только символы алфавита и-.')
    end
    errors.append('В поле ГОРОД ПРИБЫТИЯ используются только символы алфавита и-.') unless city?(params['where_to'])
    errors.append('ВРЕМЯ ОТПРАВЛЕНИЯ должно быть в формате HH:MM') unless time?(params['time_from'])
    errors.append('ДАТА ОТПРАВЛЕНИЯ должна быть в формате DD-MM-YYYY') unless date?(params['date_from'])
    errors.append('ВРЕМЯ ПРИБЫТИЯ должно быть в формате HH:MM') unless time?(params['time_to'])
    errors.append('ДАТА ПРИБЫТИЯ должна быть в формате DD-MM-YYYY') unless date?(params['date_to'])
    errors.append('ДАТА ПРИБЫТИЯ меньше ДАТЫ ОТПРАВЛЕНИЯ') unless days?(params['date_from'], params['date_to'])
    errors.append('ТИП САМОЛЕТА дожен быть выбран') unless type?(params['type'])
    errors.append('Введите в поле ЦЕНА только цифры') unless integer?(params['cost'])
    errors
  end

  def self.check_order_input(params)
    errors = []
    errors.append('Введите в поле ИДЕНТИФИКАТОР только цифры') unless integer?(params['num'])
    unless city?(params['where_from'])
      errors.append('В поле ГОРОД ОТПРАВЛЕНИЯ используются только символы алфавита и-.')
    end
    errors.append('В поле ГОРОД ПРИБЫТИЯ используются только символы алфавита и-.') unless city?(params['where_to'])
    errors.append('ВРЕМЯ  должно быть в формате HH:MM') unless time?(params['time'])
    errors.append('ДАТА  должна быть в формате DD-MM-YYYY') unless date?(params['date'])
    errors.append('В ИМЯ используются символы алфавита,пишется с большой буквы') unless city?(params['name'])
    errors.append('В ФАМИЛИЯ используются символы алфавита,пишется с большой буквы') unless city?(params['surname'])
    errors
  end

  def self.check_cities_and_date_input(params)
    errors = []
    unless city?(params['where_from'])
      errors.append('В поле ГОРОД ОТПРАВЛЕНИЯ используются только символы алфавита и-.')
    end
    errors.append('В поле ГОРОД ПРИБЫТИЯ используются только символы алфавита и-.') unless city?(params['where_to'])
    errors.append('ДАТА  должна быть в формате DD-MM-YYYY') unless date?(params['date_from'])
    errors
  end

  def self.check_date_and_time_input(params)
    errors = []
    errors.append('ДАТА  должна быть в формате DD-MM-YYYY') unless date?(params['date'])
    errors.append('ВРЕМЯ  должно быть в формате HH:MM') unless time?(params['time'])
    errors
  end

  def self.check_cities_input(params)
    errors = []
    unless city?(params['where_from'])
      errors.append('В поле ГОРОД ОТПРАВЛЕНИЯ используются только символы алфавита и-.')
    end
    errors.append('В поле ГОРОД ПРИБЫТИЯ используются только символы алфавита и-.') unless city?(params['where_to'])

    errors
  end
end
