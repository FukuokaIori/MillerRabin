bigInt = require "big-integer"

millerRabinTest = (n, b) ->
  nMinusOne = n.minus(1)
  q = nMinusOne
  j = 0

  while q.mod(2).equals(0)
    q = q.divide(2)
    j += 1

  r = b.modPow(q, n)
  return true if r.equals(1) or r.equals(nMinusOne)

  for i in [0...j-1]
    r = r.multiply(r).mod(n)
    return true if r.equals(nMinusOne)

  false

n = bigInt("2305843009213693951")
primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109]

for prime in primes
  b = bigInt(prime)
  isPrime = millerRabinTest(n, b)
  if isPrime
    console.log "M61は素数の可能性があります(b=#{b})."
  else
    console.log "M61は合成数です(b=#{b})."