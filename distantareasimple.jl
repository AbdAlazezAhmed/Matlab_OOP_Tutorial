include("areasimple.jl")
mutable struct DistantAreaSimple{T <: Number}
    area_simple::AreaSimple{T}
    y_bar::T
    z_bar::T
end
DistantAreaSimple(A::T, Iy::T = zero(T), Iz::T = zero(T), Iyz::T = zero(T), y_bar::T = zero(T), z_bar::T = zero(T)) where T <: Number = DistantAreaSimple{T}(AreaSimple(A, Iy, Iz, Iyz), y_bar, z_bar)
# @forward (DistantAreaSimple{T}, :area_simple) AreaSimple{T}
get_Iy_hat(das::DistantAreaSimple) = get_Iy_hat(das.area_simple, das.z_bar)
get_Iz_hat(das::DistantAreaSimple) = get_Iz_hat(das.area_simple, das.y_bar)
get_Iyz_hat(das::DistantAreaSimple) = get_Iyz_hat(das.area_simple, das.y_bar, das.z_bar)
