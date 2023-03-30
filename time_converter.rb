#!/usr/bin/env ruby

# 1 create class two args duration and format desired (HH:MM:SS || HH:MM)
    # check duration is supplied D
    # verify duration is integer exlude all special chars && !negative D
# 2 return response
    # code stops when error discovered
    # only first error reports
    # Or the transformed duration
# 3 BOnus HOPEFULLY get there

class TimeConverter
	attr_reader :output

	def initialize(duration, format = "HH:MM:SS")
		@input = { duration: duration, format: format}
		@output = { time: nil, errors: ""}

		validate_input
		transform_duration if @output[:errors].to_s.empty?
	end

	private

	def validate_input
		@output[:errors] = "Duration is required" if @input[:duration].nil? || @input[:duration].to_s.empty?
		@output[:errors] = "Duration should only contain numbers" if !@input[:duration].is_a?(Numeric)
		@output[:errors] = "Duration should be an integer" if !@input[:duration].is_a?(Integer)
		@output[:errors] = "Duration should not be negative" if @input[:duration].to_i.negative?

		@output[:errors] unless @output[:errors].empty?
	end

	def transform_duration
		duration = @input[:duration]

		@input[:format]	== "HH:MM" ? @output[:time] = Time.at(duration).utc.strftime("%H:%M") : @output[:time] = Time.at(duration).utc.strftime("%H:%M:%S")
	end
end

# formatter = TimeConverter.new(3600, "HH:MM") # => {"1:00"=>nil}
# formatter = TimeConverter.new(3600, "HH:MM:SS") # => {"1:00"=>nil}
# formatter = TimeConverter.new(3600, "invalid") # => {"1:00"=>nil}
formatter = TimeConverter.new("abc", "HH:MM")  # => {"abc:HH:MM"=>"Duration should be an integer"}

if !formatter.output[:errors].empty?
	puts "Error: #{formatter.output[:errors]}"
else
	puts "Duration: #{formatter.output[:time]}"
end
