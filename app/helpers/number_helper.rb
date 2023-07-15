module NumberHelper

  def try_integer(num)
    num.to_s.scan(/[.]\d+/)[0].to_f.positive? ? num : num.to_i
  end

end
