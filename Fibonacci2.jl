function F1(n)
    return n <= 0 ? 1 : (n <= 1 ? 1 : F1(n-1) + F(n-2))
end

function FA(n)  
    push!(x, F1(n))
    return n <= 0 ? x : FA(n-1)
end

function FA2(n)
    j = length(x)
    j <= 0 ? push!(x, 1) : (j <= 1 ? push!(x, 1) : push!(x, x[length(x)] + x[length(x)-1]))
    return n <= j ? reverse(x) : FA2(n)
end
