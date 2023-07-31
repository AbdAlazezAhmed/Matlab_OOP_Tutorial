include("distantareasimple.jl")
abstract type AbstractCompositeArea end
struct CompositeArea{T <: Number} <: AbstractCompositeArea
    d_area_simple::VecOrMat{DistantAreaSimple{T}}
end
CompositeArea(A::VecOrMat{T}, Iy::VecOrMat{T} = zeros(T, size(A)), Iz::VecOrMat{T} = zeros(T, size(A)), Iyz::VecOrMat{T} = zeros(T, size(A)), y_bar::VecOrMat{T} = zeros(T, size(A)), z_bar::VecOrMat{T} = zeros(T, size(A))) where T <: Number = CompositeArea{T}(DistantAreaSimple{T}.(AreaSimple.(A, Iy, Iz, Iyz), y_bar, z_bar))
get_A(ca::AbstractCompositeArea) = sum(da.area_simple.A for da in ca.d_area_simple)
get_Qy(ca::AbstractCompositeArea) = sum(da.area_simple.A * da.z_bar for da in ca.d_area_simple)
get_Qz(ca::AbstractCompositeArea) = sum(da.area_simple.A * da.y_bar for da in ca.d_area_simple)
get_y_bar(ca::AbstractCompositeArea) = get_Qz(ca)/get_A(ca)
get_z_bar(ca::AbstractCompositeArea) = get_Qy(ca)/get_A(ca)
get_Iy_hat(ca::AbstractCompositeArea) = sum(da.area_simple.Iy + da.area_simple.A * da.z_bar^2 for da in ca.d_area_simple)
get_Iz_hat(ca::AbstractCompositeArea) = sum(da.area_simple.Iz + da.area_simple.A * da.y_bar^2 for da in ca.d_area_simple)
get_Iyz_hat(ca::AbstractCompositeArea) = sum(da.area_simple.Iyz + da.area_simple.A * da.y_bar * da.z_bar for da in ca.d_area_simple)
get_Iy(ca::AbstractCompositeArea) = sum(da.area_simple.Iy for da in ca.d_area_simple)
get_Iz(ca::AbstractCompositeArea) = sum(da.area_simple.Iz for da in ca.d_area_simple)
get_Iyz(ca::AbstractCompositeArea) = sum(da.area_simple.Iyz for da in ca.d_area_simple)

abstract type AbstractCompositeAreaSymZ{T} <: AbstractCompositeArea end
get_Iz(ca::AbstractCompositeAreaSymZ) = get_Iz_hat(ca) 
function double_areas!(A::VecOrMat{T}, Iy::VecOrMat{T} ,Iz::VecOrMat{T} ,y::VecOrMat{T} ,Iyz::Union{VecOrMat{T}, Nothing} = nothing) where T
    A[y .== zero(T)] .*= 2
    Iy[y .== zero(T)] .*= 2
    Iz[y .== zero(T)] .*= 2
    isnothing(Iyz) || Iyz[y .== zero(T)] .*= 2
    return nothing
end
get_Qz(::AbstractCompositeAreaSymZ{T}) where T = zero(T)
get_y_bar(::AbstractCompositeAreaSymZ{T}) where T = zero(T)
get_Iyz_bar(::AbstractCompositeAreaSymZ{T}) where T = zero(T)
get_Iyz(::AbstractCompositeAreaSymZ{T}) where T = zero(T)