# K-kmer Analysis
# ===============


"""
Iterate through all k-mers of length K
"""
function allkmers{T}(K::Int)
    return AllKmerIterator{T, K}(convert(T{K}, UInt64(0)))
end

immutable AllKmerIterator{T, K}
    x::T{K}
end

start(it::AllKmerIterator) = UInt64(0)
done(it::AllKmerIterator, i) = i == 4 ^ length(it.x)
length(::AllKmerIterator) = 4 ^ length(it.x)

function next{T, K}(it::AllKmerIterator{T, K}, i::Int)
    nt = reverse(convert(T, (convert(UInt64, reverse(x)) + 1)))
    return (nt, i + 1)
end
