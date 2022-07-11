function F(n)
    if n <= 0
        return 1
    elseif n <= 1
        return 1
    else
        return F(n-1) + F(n-2)
    end
end

## ternary if

function F1(n)
    return n <= 0 ? 1 : (n <= 1 ? 1 : F1(n-1) + F(n-2))
end
