require 'test/unit'
require_relative './../modules/optimize'

class OptimizeEvalMethod < Test::Unit::TestCase
  
  def test_fill
    assert_equal(
      "fill 0 50 0 2 50 0 concrete 15",
      Optimize.eval(0, 0, 2, "concrete 15")
    )
  end

  def test_setblock
    assert_equal(
      "setblock 5 50 1 concrete 0",
      Optimize.eval(1, 5, 5, "concrete 0")
    )
  end

end
