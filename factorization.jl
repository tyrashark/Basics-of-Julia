## Find the factorization of numbers within n and a series of prime numbers by the sieve of Eratosthenes

function eratosthenes(n)
    primes = []
    sieve = repeat([true], n)
    factorlist = []
    for i in 2:n
        factor = []
        if sieve[i]
            push!(primes, i)
            push!(factor, i)
            for j in collect(i:i:n)
                sieve[j] = false
            end
        else
            num = i
            for k in primes
                while num % k == 0
                    num ÷= k
                    push!(factor, k)
                end
                if num == 1
                    break
                end
            end
        end
        push!(factorlist, factor)
    end
    return factorlist, primes
end

## an optimized funtion by reducing the number of iteration

function eratosthenes2(n)
    primes = [2]
    sieve = repeat([true], n)
    factorlist = [[2]]
    for i in collect(3:2:n)
        factor = []
        if sieve[i]
            push!(primes, i)
            push!(factor, i)
            for j in collect(i:i:n)
                sieve[j] = false
            end
        else
            num = i
            for k in primes
                while num % k == 0
                    num = num ÷ k
                    push!(factor, k)
                end
                if num == 1
                    break
                end
            end
        end
        push!(factorlist, factor)
        factor = [2]
        num = (i+1) ÷ 2
        for k in primes
            while num % k == 0
                num ÷= k
                push!(factor, k)
            end
            if num == 1
                break
            end
        end
        push!(factorlist, factor)
    end
    return factorlist, primes
end

## the more optimized funtion by reducing the number of iteration

function eratosthenes3(n)
    primes = [2]
    sieve = repeat([true], n)
    factorlist = [[2]]
    for i in collect(3:2:n)
        if sieve[i]
            push!(primes, i)
            factor = [i]
            for j in collect(i:i:n)
                sieve[j] = false
            end
        else
            num = i
            factor = []
            for k in primes
                while num % k == 0
                    num ÷= k
                    push!(factor, k)
                end
                num == 1 ? break : nothing
            end
        end
        push!(factorlist, factor)
        factor = [2]
        num = (i+1) ÷ 2
        for k in primes
            while num % k == 0
                num ÷= k
                push!(factor, k)
            end
            num == 1 ? break : nothing
        end
        push!(factorlist, factor)
    end
    return factorlist, primes
end
