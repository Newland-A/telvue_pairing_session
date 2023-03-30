# Time Converter
This is a simple Ruby class that allows you to convert a duration in seconds to a formatted time string.

## Usage
The TimeConverter class takes two arguments:

* duration: the duration in seconds to convert to a time string (required)
* format: the desired time string format, either "HH:MM:SS" or "HH:MM" (optional, defaults to "HH:MM:SS")

## Example

```ruby
 require_relative 'time_converter.rb '
```

* Create a TimeConverter object with a duration of 3600 seconds and a format of "HH:MM"
converter = TimeConverter.new(3600, "HH:MM")

### Output the time in the desired format
puts "Duration: #{converter.output[:time]}"

This will output:
```ruby
 Duration: 01:00
```

## Error Handling

The TimeConverter class has basic error handling in place to ensure that valid input is provided. The following errors will be raised:

Duration is required: when the duration argument is not provided or is empty.
Duration should only contain numbers: when the duration argument contains non-numeric characters.
Duration should be an integer: when the duration argument is not an integer.
Duration should not be negative: when the duration argument is negative.
Invalid format: <format>: when an invalid format is provided.
If multiple errors occur, only the first error will be reported. If no errors occur, the transformed duration will be returned.

## Testing
This code comes with a set of unit tests written using the Test::Unit framework. These tests can be run by executing the following command from the root directory of the project:

```bash
ruby test/time_converter_test.rb
```

## Contributing
If you'd like to contribute to this project, feel free to fork the repository and submit a pull request.
