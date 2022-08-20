


Threads.nthreads()


function solve1(n)
    function expo(n)
        if n > 0
            return 3*expo(n-1)
        else
            return BigInt(1)
        end
    end
    function permut(n, r)
        if n < r
            return println("n must be equal and larger than r")
        elseif r > 0
            return n*permut(n-1, r-1)
        else
            return BigInt(1)
        end
    end    
    temp = fill(BigInt(0), n-1)
    if n ≥ 2
       Threads.@threads for i in 0:(n-2)
            temp[i+1] = (2 * permut(n-1, i) * expo(i))
        end
    else
        temp = 0
    end
    answer = (expo(n) + sum(temp)) % 1000_000_007
    return n,  answer
end

function permut(n, r)
    if n < r
        return println("n must be equal and larger than r")
    elseif r > 0
        return n*permut(n-1, r-1)
    else
        return BigInt(1)
    end
end    

