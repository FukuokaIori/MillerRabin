(ns miller-rabin.core
  (:require [clojure.math.numeric-tower :as math]))

(defn miller-rabin-test [n b]
  (let [n-minus-one (- n 1)
        [q j] (loop [q n-minus-one, j 0]
                (if (even? q)
                  (recur (/ q 2) (inc j))
                  [q j]))
        r (mod (math/expt b q) n)]
    (cond
      (or (= r 1) (= r n-minus-one)) true
      :else (loop [r r, i 0]
              (if (and (< i (- j 1)) (not= r n-minus-one))
                (let [r (mod (* r r) n)]
                  (recur r (inc i)))
                (= r n-minus-one))))))

(defn main []
  (let [n (BigInteger. "2305843009213693951")
        primes [2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109]]
    (doseq [prime primes]
      (let [b (BigInteger/valueOf prime)
            is-prime (miller-rabin-test n b)]
        (if is-prime
          (println (str "M61は素数の可能性があります(b=" b ")."))
          (println (str "M61は合成数です(b=" b ").")))))))