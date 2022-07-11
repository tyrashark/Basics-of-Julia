f(x) = x^2 + 2*x + 1

function D(f, x)
    n = 1
    ep = 0.001
    Devf(f, x, n) = n*(f(x + 1/n) - f(x))
    while true
        if abs(Devf(f, x, n) - Devf(f, x, n-1)) < ep
            break
        else
            n += 1
        end
    end
    return (Devf(f, x, n), n)
end

function I(f, a, b)
    n = 10
    error = 1.0
    ep = 0.001
    local integ
    while true
        if error < ep
            break
        else
            n +=1
            part = (b-a) / n
            maxf = []
            minf = []
            integ = 0.0
            for j in 1:n
                fjx1 = f(a + part * j)
                fjx2 = f(a + part * (j-1))
                integ += part / 6 * (fjx2 + 4*f(a + part * (j-0.5)) + fjx1)
                push!(maxf, max(fjx1, fjx2))
                push!(minf, min(fjx1, fjx2))
            end
            error = abs(sum(maxf.*part) - sum(minf.*part)) 
        end
    end
    return ["Value", integ, "type", "simpson", "n.iter", n]
end 
