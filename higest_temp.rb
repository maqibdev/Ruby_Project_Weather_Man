# frozen_string_literal: true

require_relative 'file_handling'
require_relative 'printing_data'
require_relative 'reading_file_data'
module Higesttemperature
  include Filehandling
  include Printing
  include ReadingFileData
  def initialize
    @count = 0
    @max_temperature = 0
    @date_arr = []
    @date_min_arr = []
    @date_humid_arr = []
    @max_humid = 0
    @min_temperature = 100
    @temp_max_day = []
    @temp_min_day = []
    @temp_humidity = []
    @empty = 0
  end

  def max_temp_date
    return unless @max_temperature < @line_var[1].to_i

    @max_temperature = @line_var[1].to_i
    @date_arr = @line_var[0].split('-').map(&:to_i)
  end

  def max_humid_date
    return unless @max_humid < @line_var[7].to_i

    @max_humid = @line_var[7].to_i
    @date_humid_arr = @line_var[0].split('-').map(&:to_i)
  end

  def min_temp_date
    return unless @min_temperature > @line_var[3].to_i

    @min_temperature = @line_var[3].to_i
    @date_min_arr = @line_var[0].split('-').map(&:to_i)
  end

  def avg_calculator(temp_day)
    # return(temp_day.inject { |a, b| a + b } / @count) unless @empty == 1

    return if @empty == 1

    sum = 0
    temp_day.each do |data|
      next if data == 'a'

      sum += data
    end
    (sum / @count)
  end

  def yearlycalculation
    changedir
    lcount = 0
    @tester = 0
    12.times do
      fetchapp(lcount)
      lcount = lcount.next
      if @tester == 12
        puts 'Files missing!'
        exit
      end
      next if @tester >= 1

      lineby_line_mmh
    end
  end

  def linecheck
    @linechecker = @cityname == 'lahore_weather' ? 1 : 0
  end

  def month_day_data_bonus_task
    return if @empty == 1

    puts "#{@date_arr[3]} #{@date_arr[0]}"
    @localcount = 0
    @temp_max_day.each do |values|
      if @temp_max_day[@localcount] == 'a'
        @localcount = @localcount.next
        next
      end
      minvalues = @temp_min_day[@localcount]
      print_bouns_task_data(minvalues, values)
      @localcount = @localcount.next
    end
  end

  def month_day_data
    return if @empty == 1

    puts "#{@date_arr[3]} #{@date_arr[0]}"
    @localcount = 0
    @temp_max_day.each do |values|
      if @temp_max_day[@localcount] == 'a'
        @localcount = @localcount.next
        next
      end
      minvalues = @temp_min_day[@localcount]
      bonustaskcall(minvalues, values)
      @localcount = @localcount.next
    end
  end

  def date_calculate
    return if @empty == 1

    @date_arr[3] = MONARR[@date_arr[1] - 1]
    @date_min_arr[3] = MONARR[@date_min_arr[1] - 1]
    @date_humid_arr[3] = MONARR[@date_humid_arr[1] - 1]
  end
end
