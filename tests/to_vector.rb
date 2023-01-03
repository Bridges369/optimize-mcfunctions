require_relative './../modules/vectors'

class VectorsToVectorMethod < Test::Unit::TestCase
  
  def test_setblock
    input = "setblock 0 50 0 concrete 15"
    result = [0, 50, 0, "concrete 15"]
    method = :to_vector

    assert_equal(
      result,
      Vector.method(method).call(input),
      ""
    )
  end

end
