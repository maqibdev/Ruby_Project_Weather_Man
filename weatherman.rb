# frozen_string_literal: true

MONARR = %w[January February March April May June July August September October Novemeber December].freeze
MONSHORT = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec].freeze

require_relative 'higest_temp'

class Call
  include Higesttemperature

  def assigning_months
    @month_arr_value = @command_mode[1].split('/')
    @yearvalue = @month_arr_value[0]
    @month_arr_value[2] = @month_arr_value[1].to_i
    @monthname = MONSHORT[@month_arr_value[2] - 1]
    @cityname = @temp_name[-1]
  end

  def task1
    @yearvalue = @command_mode[1]
    @cityname = @temp_name[-1]
    yearlycalculation
    date_calculate
    printyearlydata
  end

  def task2
    assigning_months
    fetch
    lineby_line_avg
    avg_method
  end

  def task_third_four
    assigning_months
    fetch
    lineby_line_avg
    @date_arr[3] = MONARR[@date_arr[1] - 1]
  end

  def value_from_user
    @command_mode = []
    @temp_name = []
    @month_arr_value = []
    value_roll = 0
    ARGV.each do |user_value|
      @command_mode[value_roll] = user_value
      value_roll = value_roll.next
    end
    @temp_name = @command_mode[2].split('/')
    case @command_mode[0]
    when '-e'
      task1
    when '-a'
      task2
    when '-c1'
      task_third_four
      month_day_data
    when '-c2'
      task_third_four
      month_day_data_bonus_task
    else
      puts 'Invalid command try again!'
    end
  end
end
obj2 = Call.new
obj2.value_from_user
