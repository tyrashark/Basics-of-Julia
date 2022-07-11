struct Klein
    explicit::Char
end

import Base.+


function +(x::String, y::String)
    return x * y
end


isidentity(x::Klein) = x.explicit ∈ ['e']

e = Klein('e'); 가 = Klein('e')
a = Klein('a'); 나 = Klein('a')
b = Klein('b'); 다 = Klein('b')
c = Klein('c'); 라 = Klein('c')

import Base.inv

function inv(x::Klein)
    return x
end

import Base.*
function *(x::Klein, y::Klein)
    if isidentity(y)
        return x
    elseif isidentity(x)
        return y
    elseif x == y
        return e
    else
        return setdiff(Set([a,b,c]), Set([x,y]))
    end
end
