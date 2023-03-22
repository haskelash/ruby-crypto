require 'securerandom'

require_relative 'square_and_multiply'

module PrimalityTest
  include SquareAndMultiply

  def self.random_prime
    while true do
      p = SecureRandom.hex(64).to_i(16)
      isPrime, _ = miller_rabin(p, 5)
      return p if isPrime
    end
  end

  def self.miller_rabin(p, s)
    return true if p == 2
    return false if p % 2 == 0

    p1 = p - 1
    r = p1
    u = 0
    while r % 2 == 0 do
      u += 1
      r /= 2
    end

    s.times do
      a = rand(2..[p-2, 2].max)
      z = SquareAndMultiply.square_and_multiply(a, r, p)
      if z != 1 && z != p1
        (u).times do
          z2 = SquareAndMultiply.square_and_multiply(z, 2, p)
          return false, a if z2 == 1 && z != 1 && z != p1
          z = z2
        end
        return false, a if z != 1
      end
    end
    true
  end
end
