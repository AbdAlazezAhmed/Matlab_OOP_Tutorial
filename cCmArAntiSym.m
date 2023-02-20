classdef cCmArAntiSym < cCmAr & cCmArSymZabst
    %CCMARANTISYM Summary of this class goes here
    %   Detailed explanation goes here
    methods
        function oThisCompositeAreaAntiSym = cCmArAntiSym(A_half_vec,Iy_half_vec,Iz_half_vec,Iyz_half_vec,y_half_hat_vec,z_half_hat_vec)
            if nargin==0 %This is needed to create array of this class
                superClassArgs={};
            elseif nargin==6
                [A_half_vec,Iy_half_vec,Iz_half_vec,Iyz_half_vec]=...
                    cCmArSymZabst.doubleAreas(A_half_vec,Iy_half_vec,...
                    Iz_half_vec,y_half_hat_vec,Iyz_half_vec);
                superClassArgs={A_half_vec,Iy_half_vec,Iz_half_vec,...
                    Iyz_half_vec,y_half_hat_vec,z_half_hat_vec};
            else
                error('This class can be constructed using zero or 6 inputs.');
            end
            oThisCompositeAreaAntiSym@cCmAr(superClassArgs{:});
        end
        
        function Iz1=Iz(oThisCompositeArea)
            Iz1=Iz@cCmArSymZabst(oThisCompositeArea);
        end
        function Iy=Iy(oThisCompositeArea)
            Iy=oThisCompositeArea.Iy_hat;
        end
        function Iyz_hat1=Iyz_hat(oThisCompositeArea)
            Iyz_hat1=Iyz_hat@cCmAr(oThisCompositeArea);
        end
        function Iyz=Iyz(oThisCompositeArea)
            Iyz=oThisCompositeArea.Iyz_hat;
        end
    end
    methods(Static)
        function Qz=Qz()
            Qz=cCmAr_Sym_z_Abst.Qz;
        end
        function y_bar=y_bar()
            y_bar=cCmArSymZabst.y_bar;
        end
        function Qy=Qy()
            Qy=0;
        end
        function z_bar=z_bar()
            z_bar=0;
        end
    end
end

