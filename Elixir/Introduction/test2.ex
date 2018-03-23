defmodule Test do    
    def double(n) do 
        2 * n
    end

    def ftoc(f) do
    (f-32)/1.8
    end

    def rectArea(a,b) do
    a * b
    end

    def squareArea(a) do
    rectArea(a,a)
    end

    def circleArea(r) do
    :math.pi * r* r
    end

    def product(m,n) do
        if m == 0 do
            0
        else
            n + product(m-1,n)
        end
    end

    def caseproduct(m,n) do
        case m do
        0 -> 0
        _ -> n + caseproduct(m-1,n)
        end
    end

    def clauseproduct(0, _) do 0 end
    def clauseproduct(m,n) do
        n + clauseproduct(m-1,n)
    end

    def exp(x,y) do
        case y do
        0 -> 1
        _ -> product(x, exp(x,y-1))
        end
    end

    def expfast(x,y) do
        case y do
        1 -> x
        y when rem(y,2) == 0 -> expfast(x, div(y,2)) * expfast(x, div(y,2))
        y when rem(y,2) == 1 -> x * expfast(x, y-1)
        end
    end 

    def nth(n,l) do
        case n do 
        n when n > 0 -> nth(n-1,tl(l))
        n when n == 0 -> hd(l)
        end
    end
end