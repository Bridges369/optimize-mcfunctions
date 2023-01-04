require_relative './../modules/commands'

class OptimizeEvalMethod < Test::Unit::TestCase
  
  def test_fill
    input = [0, 2, 50, 0, "concrete 15"]
    result = "fill 0 50 0 2 50 0 concrete 15"
    method = :to_command

    assert_equal(
      result,
      Command.method(method).call(input),
      ""
    )
  end

  def test_setblock
    input = [5, 5, 50, 0, "concrete 15"]
    result = "setblock 5 50 0 concrete 15"
    method = :to_command

    assert_equal(
      result,
      Command.method(method).call(input),
      ""
    )
  end 
end
