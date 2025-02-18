module MicroFloatsForAI

# abstract types

abstract type AbstractMicroFloat <: AbstractFloat end
abstract type AbstractAIFloat{Bits, SigBits} <: AbstractMicroFloat end

abstract type SignedAIFloat{Bits, SigBits}   <: AbstractAIFloat{Bits, SigBits} end
abstract type UnsignedAIFloat{Bits, SigBits} <: AbstractAIFloat{Bits, SigBits} end

# abstract families

abstract type SignedFiniteAIFloat{Bits, SigBits}   <: SignedAIFloat{Bits, SigBits} end
abstract type SignedExtendedAIFloat{Bits, SigBits} <: SignedAIFloat{Bits, SigBits} end

abstract type UnsignedFiniteAIFloat{Bits, SigBits}   <: UnsignedAIFloat{Bits, SigBits} end
abstract type UnsignedExtendedAIFloat{Bits, SigBits} <: UnsignedAIFloat{Bits, SigBits} end

const FiniteAIFloat = Union{SignedFiniteAIFloat, UnsignedFiniteAIFloat}
const ExtendedAIFloat = Union{SignedExtendedAIFloat, UnsignedExtendedAIFloat}

# concrete collective types

const CODE  = Union{UInt8, UInt16}
const VALUE = Union{Float32, Float64}

codes(x::T) where {T<:AbstractAIFloat{Bits, SigBits}} = x.codes
values(x::T) where {T<:AbstractAIFloat{Bits, SigBits}} = x.values

struct SFiniteAIFloats{Bits, SigBits}   <: SignedFiniteAIFloat{Bits, SigBits}
    values::DenseVector{VALUE}
    codes::DenseVector{CODE}
end

struct SExtendedAIFloats{Bits, SigBits} <: SignedExtendedAIFloat{Bits, SigBits}
    values::DenseVector{VALUE}
    codes::DenseVector{CODE}
end

struct UFiniteAIFloats{Bits, SigBits}   <: UnsignedFiniteAIFloat{Bits, SigBits}
    values::DenseVector{VALUE}
    codes::DenseVector{CODE}
end

struct UExtendedAIFloats{Bits, SigBits} <: UnsignedExtendedAIFloat{Bits, SigBits}
    values::DenseVector{VALUE}
    codes::DenseVector{CODE}            
end

# predicates on concrete type families

is_signed(::T) where {T<:SignedFiniteAIFloats}    = true
is_signed(::T) where {T<:SignedExtendedAIFloats}   = true
is_signed(::T) where {T<:UnsignedFiniteAIFloats}   = false
is_signed(::T) where {T<:UnsignedExtendedAIFloats} = false
is_signed(x::T) where {T<:AbstractAIFloat} = is_signed(T)

is_unsigned(::T) where {T<:SignedExtendedAIFloats}   = false
is_unsigned(::T) where {T<:UnsignedExtendedAIFloats} = true
is_unsigned(::T) where {T<:SignedFiniteAIFloats}     = false
is_unsigned(::T) where {T<:UnsignedFiniteAIFloats}   = true
is_unsigned(x::T) where {T<:AbstractAIFloat} = is_unsigned(T)

is_finite(::T) where {T<:SignedFiniteAIFloats}     = true
is_finite(::T) where {T<:UnsignedFiniteAIFloats}   = true
is_finite(::T) where {T<:SignedExtendedAIFloats}   = false
is_finite(::T) where {T<:UnsignedExtendedAIFloats} = false
is_finite(x::T) where {T<:AbstractAIFloat} = is_finite(T)

is_extended(::T) where {T<:SignedExtendedAIFloats}   = true
is_extended(::T) where {T<:UnsignedExtendedAIFloats} = true
is_extended(::T) where {T<:SignedFiniteAIFloats}     = false
is_extended(::T) where {T<:UnsignedFiniteAIFloats}   = false
is_extended(x::T) where {T<:AbstractAIFloat} = is_extended(T)   

# concrete element types

struct SFiniteAIFloat{Bits, SigBits}   <: SignedFiniteAIFloat{Bits, SigBits}
    value::VALUE
    code::CODE
end

struct SExtendedAIFloat{Bits, SigBits} <: SignedExtendedAIFloat{Bits, SigBits}
    value::VALUE
    code::CODE
end

struct UFiniteAIFloat{Bits, SigBits}   <: UnsignedFiniteAIFloat{Bits, SigBits}
    value::VALUE
    code::CODE
end

struct UExtendedAIFloat{Bits, SigBits} <: UnsignedExtendedAIFloat{Bits, SigBits}
    value::VALUE
    code::CODE            
end

# predicates on concrete element types

is_signed(::T) where {T<:SignedFiniteAIFloat}     = true
is_signed(::T) where {T<:SignedExtendedAIFloat}   = true
is_signed(::T) where {T<:UnsignedFiniteAIFloat}   = false
is_signed(::T) where {T<:UnsignedExtendedAIFloat} = false
is_signed(x::T) where {T<:AbstractAIFloat} = is_signed(T)

is_unsigned(::T) where {T<:SignedExtendedAIFloat}   = false
is_unsigned(::T) where {T<:UnsignedExtendedAIFloat} = true
is_unsigned(::T) where {T<:SignedFiniteAIFloat}     = false
is_unsigned(::T) where {T<:UnsignedFiniteAIFloat}   = true
is_unsigned(x::T) where {T<:AbstractAIFloat} = is_unsigned(T)

is_finite(::T) where {T<:SignedFiniteAIFloat}     = true
is_finite(::T) where {T<:UnsignedFiniteAIFloat}   = true
is_finite(::T) where {T<:SignedExtendedAIFloat}   = false
is_finite(::T) where {T<:UnsignedExtendedAIFloat} = false
is_finite(x::T) where {T<:AbstractAIFloat} = is_finite(T)

is_extended(::T) where {T<:SignedExtendedAIFloat}   = true
is_extended(::T) where {T<:UnsignedExtendedAIFloat} = true
is_extended(::T) where {T<:SignedFiniteAIFloat}     = false
is_extended(::T) where {T<:UnsignedFiniteAIFloat}   = false
is_extended(x::T) where {T<:AbstractAIFloat} = is_extended(T)   

end
