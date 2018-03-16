#!/usr/bin/ruby

require 'optparse'

class CommonMemoryAddress
  module ClassMethods
    @@options = {}

    def calculate
      parse_options

      mask = addresses.reduce do |memo, address|
        address & memo
      end

      puts case @@options[:base]
           when '2'
             "0b#{mask.to_s(2)}"
           when '16'
             "0x#{mask.to_s(16)}"
           else
             "0x#{mask.to_s(16)}"
           end
    end


    private

    def parse_options
      OptionParser.new do |opt|
        opt.banner = "Usage: average_memory_address.rb [options] filename"

        opt.on('-b [2|16]', '--base [2|16]', 'Print address in base 2 or 16') do |o|
          @@options[:base] = o
        end

        opt.on('-f FILENAME', '--filename FILENAME', 'Filename to read input addresses from') do |o|
          @@options[:filename] = o
        end
      end.parse!
    end

    def validate_base(format)
      unless ['2', '16'].include?(format)
        raise '--base option should be 2 or 16'
      end
      format
    end

    def addresses
      file = File.open(@@options[:filename], 'r')
      addresses = file.map { |line| line.to_i(16) }
      file.close
      addresses
    end
  end

  extend ClassMethods
end

CommonMemoryAddress.calculate
