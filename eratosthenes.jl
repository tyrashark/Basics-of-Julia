## Find prime numbers within n by the sieve of Eratosthenes

function find_primes(n)
    primes = []
    sieve = repeat([true], n)
    pre = []
    for i in 2:n
        if sieve[i]
            push!(primes, i)
            for j in collect(i:i:n)
                sieve[j] = false
            end
        end
    end
    return primes
end
