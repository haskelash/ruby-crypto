module ExtendedEuclidean
    def self.extended_euclidean(a, b)
    raise "Input must be non-negative." if a < 0 || b < 0
    return a, 1, 0 if a == b
    if b > a
      gcd, s, t = *extended_euclidean(b, a)
      return [gcd, t, s]
    end

    s0 = 1
    s1 = 0

    t0 = 0
    t1 = 1

    while b != 0
      r = a % b
      q = (a - r) / b

      s2 = s0 - (q * s1)
      s0 = s1
      s1 = s2

      t2 = t0 - (q * t1)
      t0 = t1
      t1 = t2

      a = b
      b = r
    end
    return a, s0, t0
  end
end
