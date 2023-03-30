Using the ruby standard library only (no additional gems outside those included with ruby),
build a class that satisfies the following business requirements:

- googling for ruby docs and other details is allowed, this is not testing whether
  you have the math ability to divide seconds into minutes and hours, but rather how
  to organize code => Time.at(duration).utc.strftime("%H:%M:%S")
- do not focus only on completing the problem, also consider code quality, readability,
  extensibility, maintainability, an incomplete class is acceptable if time runs out

1) accepts two arguments:
  - duration (in seconds)
  - format desired (with seconds or without seconds) ie: HH:MM or HH:MM:SS,
    if no format is provided, default to "HH:MM:SS"

2) - class should stop processing further errors when an error is discovered
   - first verify that duration is supplied
   - second verify that the duration supplied is a number, not special chars or letters
   - third verify that the duration supplied is an integer, not a decimal/float
   - fourth verify that the duration supplied is not a negative number

3) return a response to callers that contains:
   - an accurate error message if verification fails
   - processing should stop as soon as an error is discovered, so only first error should
     be reported, do not return all errors
   - the transformed duration from seconds to HH:MM:SS or HH:MM per the format argumentz

4) - bonus point: write tests that verify the class's behavior (ok to use gems like test-unit, minitest, rspec)
   - bonus point: return something that has an interface which we can call the
     error() and result() public methods on
   - discussion point: how would you modify the code to return all errors instead of just the first error
