# frozen_string_literal: true

module Printing
  def print_data(avalue, bcolour)
    require 'colorize'
    @printer = avalue
    print @localcount + 1
    print ' '
    @printer.times do
      if bcolour == 'red'
        print '+'.red
      else
        print '+'.blue
      end
    end
    puts format(' %02d', avalue)
  end

  def print_bouns_task_data(cvalue, dvalue)
    require 'colorize'
    print @localcount + 1
    print ' '
    cvalue.times do
      print '+'.blue
    end
    dvalue.times do
      print '+'.red
    end
    print format(' %02d -', cvalue)
    puts format(' %02d', dvalue)
  end

  def avg_method
    if @empty == 1
      puts 'Record is empty'
      exit
    else
      puts "Higest Average: #{avg_calculator(@temp_max_day)}C"
      puts "Lowest Average: #{avg_calculator(@temp_min_day)}C"
      puts "Average Humidity: #{avg_calculator(@temp_humidity)}%"
    end
  end

  def printyearlydata
    puts "Highest: #{@max_temperature}C on #{@date_arr[3]} #{@date_arr[2]}"
    puts "Lowest: #{@min_temperature}C on #{@date_min_arr[3]} #{@date_min_arr[2]}"
    puts "Humid: #{@max_humid}% on #{@date_humid_arr[3]} #{@date_humid_arr[2]}"
  end

  def bonustaskcall(minvalues, values)
    print_data(values, 'red')
    print_data(minvalues, 'blue')
  end

  def emptyrecord
    puts 'Record is empty'
    exit
  end
end
