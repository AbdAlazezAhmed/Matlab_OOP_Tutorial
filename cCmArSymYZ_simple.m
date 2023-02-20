classdef cCmArSymYZ_simple < cCmAr
    %CCMARSYMYZ_SIMPLE Summary of this class goes here
    %   Detailed explanation goes here
    methods
        function oThisCompositeAreaSymYZ_simple = cCmArSymYZ_simple(A_quart_vec,Iy_quart_vec,...
                Iz_quart_vec,y_quart_hat_vec,z_quart_hat_vec)
            %CCMARSYMYZ_SIMPLE Construct an instance of this class
            %   Detailed explanation goes here
            if nargin==0
                superClassArgs={};
            elseif nargin==5
                A_quad_vec=A_quart_vec;
                Iy_quad_vec=Iy_quart_vec;
                Iz_quad_vec=Iz_quart_vec;
                Iyz_quad_vec=zeros(size(A_quart_vec));
                ind_NonSymArea=find(y_quart_hat_vec~=0);
                A_quad_vec(ind_NonSymArea)=2*A_quad_vec(ind_NonSymArea);
                Iy_quad_vec(ind_NonSymArea)=2*Iy_quad_vec(ind_NonSymArea);
                Iz_quad_vec(ind_NonSymArea)=2*Iz_quad_vec(ind_NonSymArea);
                ind_NonSymArea=find(z_quart_hat_vec~=0);
                A_quad_vec(ind_NonSymArea)=2*A_quad_vec(ind_NonSymArea);
                Iy_quad_vec(ind_NonSymArea)=2*Iy_quad_vec(ind_NonSymArea);
                Iz_quad_vec(ind_NonSymArea)=2*Iz_quad_vec(ind_NonSymArea);
                superClassArgs={A_quad_vec,Iy_quad_vec,Iz_quad_vec,...
                Iyz_quad_vec,y_quart_hat_vec,z_quart_hat_vec};
            else
                error('This class can be constructed using zero or 5 inputs.');
            end
            oThisCompositeAreaSymYZ_simple@cCmAr(superClassArgs{:});
        end
        
        function Iz=Iz(oThisCompositeAreaSymYZ_simple)
            Iz=oThisCompositeAreaSymYZ_simple.Iz_hat;
        end
        function Iy=Iy(oThisCompositeAreaSymYZ_simple)
            Iy=oThisCompositeAreaSymYZ_simple.Iy_hat;
        end
    end
    methods(Static)
        function Qy=Qy()
            Qy=0;
        end
        function Qz=Qz()
            Qz=0;
        end
        function y_bar=y_bar()
            y_bar=0;
        end
        function z_bar=z_bar()
            z_bar=0;
        end
        function Iyz_hat=Iyz_hat()
            Iyz_hat=0;
        end
        function Iyz=Iyz()
            Iyz=0;
        end
    end
end

