classdef cCmArSymZ < cCmAr
    %CCMARSYMZ Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Property1
    end
    
    methods
        function oThisCompositeAreaSymZ = cCmArSymZ(A_half_vec,Iy_half_vec,...
                Iz_half_vec,y_half_hat_vec,z_half_hat_vec)
            %CCMARSYMZ Construct an instance of this class
            %   Detailed explanation goes here
            if nargin==0
                superClassArgs={};
            elseif nargin==5
                A_doubled_vec=A_half_vec;
                Iy_doubled_vec=Iy_half_vec;
                Iz_doubled_vec=Iz_half_vec;
                Iyz_doubled_vec=zeros(size(A_half_vec));
                ind_NonSymArea=find(y_half_hat_vec~=0);
                A_doubled_vec(ind_NonSymArea)=2*A_doubled_vec(ind_NonSymArea);
                Iy_doubled_vec(ind_NonSymArea)=2*Iy_doubled_vec(ind_NonSymArea);
                Iz_doubled_vec(ind_NonSymArea)=2*Iz_doubled_vec(ind_NonSymArea);
                superClassArgs={A_doubled_vec,Iy_doubled_vec,Iz_doubled_vec,...
                Iyz_doubled_vec,y_half_hat_vec,z_half_hat_vec};
            else
                error('This class can be constructed using zero or 5 inputs.');
            end
            oThisCompositeAreaSymZ@cCmAr(superClassArgs{:});
        end
        
        function Iz=Iz(oThisCompositeAreaSymZ)
            Iz=oThisCompositeAreaSymZ.Iz_hat;
        end

    end
    methods(Static)
        function Qz=Qz()
            Qz=0;
        end
        function y_bar=y_bar()
            y_bar=0;
        end
        function Iyz_hat=Iyz_hat()
            Iyz_hat=0;
        end
        function Iyz=Iyz()
            Iyz=0;
        end
    end
end

