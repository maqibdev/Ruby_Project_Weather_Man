# frozen_string_literal: true

module ReadingFileData
  def lineby_line_mmh
    linecheck
    @count = 0
    @readfile_var.each do |n| # Loop for reading line by line
      unless @count <= @linechecker
        @line_var = n.to_s.split(',')
        break if @line_var[0].include? '<'

        next if @line_var[@linechecker] == ''

        max_temp_date
        min_temp_date
        max_humid_date
      end
      @count = @count.next
    end

    empty_count_check
  end

  def push_value
    @temp_max_day.push(@line_var[1].to_i)
    @temp_min_day.push(@line_var[3].to_i)
    @temp_humidity.push(@line_var[8].to_i)
  end

  def empty_count_check
    @count -= 2
    @empty = @empty.next if @count.zero?
    @file.close
  end

  def push_value_call
    push_value
    @date_arr = @line_var[0].split('-').map(&:to_i)
  end

  def push_zero
    @temp_max_day.push('a')
    @temp_min_day.push('a')
    @date_arr = @line_var[0].split('-').map(&:to_i)
  end

  def lineby_line_avg
    linecheck
    @count = 0
    @readfile_var.each do |n|
      unless @count <= @linechecker
        @line_var = n.to_s.split(',')
        break if @line_var[0].include? '<'

        if @line_var[@linechecker] == ''
          push_zero
          next
        end

        push_value_call
      end
      @count = @count.next
    end
    empty_count_check
    return unless @empty == 1

    emptyrecord
  end
end
