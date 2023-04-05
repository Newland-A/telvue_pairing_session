require 'test/unit'

require_relative '../time_converter.rb'

class TimeConverterTest < Test::Unit::TestCase
  def test_valid_duration_with_default_format
    converter = TimeConverter.new({ duration: 3600 })
    assert_equal([], converter.errors)
    assert_equal("01:00:00", converter.results[:time])
  end

  def test_valid_duration_with_custom_format
    converter = TimeConverter.new({ duration: 3661, format: "HH:MM" })
    assert_equal([], converter.errors)
    assert_equal("01:01", converter.results[:time])
  end

  def test_valid_duration_with_custom_format_seconds
    converter = TimeConverter.new({ duration: 3661, format: "HH:MM:SS" })
    assert_equal([], converter.errors)
    assert_equal("01:01:01", converter.results[:time])
  end

  def test_missing_duration
    converter = TimeConverter.new({ format: "HH:MM" })
    assert_include("Duration is required", converter.errors.first)
    assert_nil(converter.results[:time])
  end

  def test_invalid_duration_type
    converter = TimeConverter.new({ duration: "abc", format: "HH:MM" })
    assert_include(["Duration should be a number"], converter.errors.first)
    assert_nil(converter.results[:time])
  end

  def test_negative_duration
    converter = TimeConverter.new({ duration: -3600, format: "HH:MM" })
    assert_equal(["Duration should not be negative"], converter.errors)
    assert_nil(converter.results[:time])
  end

  def test_non_integer_duration
    converter = TimeConverter.new({ duration: 3600.5, format: "HH:MM" })
    assert_equal(["Duration should be an integer"], converter.errors)
    assert_nil(converter.results[:time])
  end

  def test_invalid_format
    converter = TimeConverter.new({ duration: 3600, format: "invalid" })
    assert_equal([], converter.errors)
    assert_equal("01:00:00", converter.results[:time])
  end

  def test_multiple_errors
    converter = TimeConverter.new({ format: "invalid", duration: nil })
    assert_equal("Duration is required", converter.errors.first)
    assert_nil(converter.results[:time])
  end
end
