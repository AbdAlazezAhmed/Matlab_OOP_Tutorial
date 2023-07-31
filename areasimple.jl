mutable struct AreaSimple{T <: Number}
    A::T
    Iy::T
    Iz::T
    Iyz::T
end

AreaSimple(A::T, Iy::T = zero(T), Iz::T = zero(T), Iyz::T = zero(T)) where T <: Number = AreaSimple{T}(A, Iy, Iz, Iyz)
get_Iy_hat(as::AreaSimple{T}, z_bar::T) where T<:Number = as.Iy + as.A * z_bar^2
get_Iz_hat(as::AreaSimple{T}, y_bar::T) where T<:Number = as.Iz + as.A * y_bar^2
get_Iyz_hat(as::AreaSimple{T}, y_bar::T, z_bar::T) where T<:Number = as.Iyz + as.A * z_bar * y_bar
