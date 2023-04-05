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
  attr_reader :results, :errors

  def initialize(args = {})
    @duration = args.fetch(:duration, nil)
    @format = args.fetch(:format, 'HH:MM:SS')
    @errors = []
    @results = {}

    validate_input
    transform_duration unless @errors.any?
  end

  def errors
    @errors
  end

  def results
    @results
  end

  private

  def validate_input
    validate_duration_present
    validate_duration_number
    validate_duration_integer
    validate_duration_not_negative
    stop_on_first_error
  end

  def validate_duration_present
    if @duration.nil?
      @errors << "Duration is required"
    end
  end

  def validate_duration_number
    unless @duration.is_a?(Numeric) && !@duration.is_a?(String)
      @errors << "Duration should be a number"
    end
  end

  def validate_duration_integer
    unless @duration.is_a?(Integer)
      @errors << "Duration should be an integer"
    end
  end

  def validate_duration_not_negative
    if if @duration.respond_to?(:negative?) && @duration.negative?
      @errors << "Duration should not be negative"
		end
  end

  def stop_on_first_error
   	return @errors.first.to_s if @errors.any?
  end

  def transform_duration
    return unless @errors.empty?

    hours = @duration / 3600
    minutes = (@duration % 3600) / 60
    seconds = @duration % 60

    case @format
			when 'HH:MM'
				@results[:time] = format('%02d:%02d', hours, minutes)
			else
				@results[:time] = format('%02d:%02d:%02d', hours, minutes, seconds)
			end
		end
  end
end

# formatter = TimeConverter.new({duration: 3601, format: 'HH:MM:SS'}) # => {"1:00"=>nil}
# formatter = TimeConverter.new({duration: 3600, format: "HH:MM"}) # => {"1:00"=>nil}
formatter = TimeConverter.new({ duration: 3600, format: "invalid" }) # => {"1:00"=>nil}
# formatter = TimeConverter.new("abc", "HH:MM")  # => {"abc:HH:MM"=>"Duration should be an integer"}
puts formatter.errors
puts formatter.results[:time]
