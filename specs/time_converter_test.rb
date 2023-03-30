require 'test/unit'
require_relative '../time_converter.rb'

class TimeConverterTest < Test::Unit::TestCase
  def test_valid_input
    # Test that a valid input produces the correct output
    converter = TimeConverter.new(3600, "HH:MM")
    assert_equal({"01:00" => nil}, converter.output[:time])
    assert_empty(converter.output[:errors])
  end

  def test_missing_duration
    # Test that an error is raised when the duration is missing
    converter = TimeConverter.new(nil, "HH:MM:SS")
    assert_equal("Duration is required", converter.output[:errors])
    assert_nil(converter.output[:time])
  end

  def test_invalid_duration
    # Test that an error is raised when the duration is not an integer
    converter = TimeConverter.new("abc", "HH:MM")
    assert_equal("Duration should be an integer", converter.output[:errors])
    assert_nil(converter.output[:time])
  end

  def test_negative_duration
    # Test that an error is raised when the duration is negative
    converter = TimeConverter.new(-3600, "HH:MM")
    assert_equal("Duration should not be negative", converter.output[:errors])
    assert_nil(converter.output[:time])
  end

  def test_invalid_format
    # Test that an error is raised when the format is invalid
    converter = TimeConverter.new(3600, "invalid")
    assert_equal("Invalid format: invalid", converter.output[:errors])
    assert_nil(converter.output[:time])
  end

  def test_multiple_errors
    # Test that only the first error is reported when there are multiple errors
    converter = TimeConverter.new(nil, "invalid")
    assert_equal("Duration is required", converter.output[:errors])
    assert_nil(converter.output[:time])
  end

  def test_input_validation_order
    # Test that errors are reported in the correct order
    converter = TimeConverter.new("abc", "invalid")
    assert_equal("Duration should be an integer", converter.output[:errors])
    assert_nil(converter.output[:time])
  end
end

# Pairing Session
# class TimeConverterTest < Test::Unit::TestCase


# 	def verfiy_duration
# 		input = nil
# 		expected_output = "Duration must be present."
# 		assert_equal expected_output, TimeConverter.new(input).check_duration

# 		input1 = "1000"
# 		expected_output = "Duration must be an Integer"
# 		assert_equal expected_output, TimeConverter.new(input1).check_duration

# 		input2 = 1000
# 		expected_output = "00:16:40"
# 		assert_equal expected_output, TimeConverter.new(input2).check_duration
# 	end

# end
