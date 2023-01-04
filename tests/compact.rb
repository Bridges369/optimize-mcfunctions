class VectorCompactMethod < Test::Unit::TestCase

  def test_compact
    input = [
      [0,50,0,"concrete 15"],
      [1,50,0,"concrete 15"],
      [2,50,0,"concrete 15"],
      [3,50,0,"concrete 0"],
      [4,50,0,"concrete 0"],
      [5,50,0,"concrete 15"],
    ]
    
    output = [
      [0,2,50,0,"concrete 15"],
      [3,4,50,0,"concrete 0"],
      [5,5,50,0,"concrete 15"]
    ]
    method = :compact

    assert_equal(
      output,
      Vector.method(method).call(input),
      ""
    )
  end

end
