# frozen_string_literal: true

module Filehandling
  def changedir
    unless Dir.exist?((@command_mode[2]).to_s)
      puts 'Wrong Directory!'
      exit
    end
    Dir.chdir (@command_mode[2]).to_s # use for changing directory
  end

  def fetch
    changedir
    unless File.exist?("#{@cityname}_#{@yearvalue}_#{@monthname}.txt")
      puts 'File missing!'
      exit
    end
    @file = File.open("#{@cityname}_#{@yearvalue}_#{@monthname}.txt", 'r')
    @readfile_var = @file.readlines
  end

  def fetchapp(lcount)
    unless File.exist?("#{@cityname}_#{@yearvalue}_#{MONSHORT[lcount]}.txt")
      @tester += 1
      return
    end
    @tester = 0
    @file = File.open("#{@cityname}_#{@yearvalue}_#{MONSHORT[lcount]}.txt", 'r')
    @readfile_var = @file.readlines
  end
end
