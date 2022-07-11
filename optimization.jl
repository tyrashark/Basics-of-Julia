function L(W, b)
    return sum(abs.(y - (X * W + b)))
end



function optim(k)
    W = rand(2)
    b = randn(3)
    temp = L(W, b)
    if length(x) <= 0
        push!(x, temp)
        W0 = W
        b0 = b
    elseif temp <= x[length(x)]
        push!(x, temp)
        W0 = W
        b0 = b
    else
        nothing
    end
    return x[length(x)] <= k ? x : optim(k)
end
