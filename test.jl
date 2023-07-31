include("compositearea_antisym.jl")

oArea = AreaSimple %#ok<*NOPTS,*NASGU> 
oArea = AreaSimple(1)
oArea = AreaSimple(1,2)
oArea = AreaSimple(1,2,3)
oArea = AreaSimple(1,2,3,4)

oArea.A
oArea.A=8
get_Iz_hat(oArea,5)
# oArea.Iz_hat(5)
# oArea.Iy_hat(6)
# oArea.Iyz_hat(5,6)

oArea=AreaSimple(1,2,3,4)
# oArea.Iz_hat(5)
# oArea.Iy_hat(6)
# oArea.Iyz_hat(5,6)
oDistantArea=DistantAreaSimple(1,2,3,4,5,6)
# oDistantArea.Iz_hat
# oDistantArea.Iy_hat
# oDistantArea.Iyz_hat


isa(oDistantArea, AreaSimple)
isa(oDistantArea, DistantAreaSimple)
