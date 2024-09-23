struct s
    a::Int64
    name::String
end

v = [s(1, "a"), s(2, "b"), s(3, "c"), s(1, "d")]
sort!(v, by=x -> x.a)