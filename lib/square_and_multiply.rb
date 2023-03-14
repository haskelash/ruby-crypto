module SquareAndMultiply
  def self.square_and_multiply(a, e, n, mask_multiplications = false)
    e = e.to_s(2).reverse.split('')
    res = 1

    while b = e.pop()
      res = res ** 2 % n
      if mask_multiplications
        mult = res * a % n
        res = b == '1' ? mult : res
      else
        res = res * a % n if b == '1'
      end
    end
    res
  end
end
