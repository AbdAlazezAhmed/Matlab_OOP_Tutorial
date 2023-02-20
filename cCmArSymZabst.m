classdef (Abstract) cCmArSymZabst %The file-name must be the same as the class-name
    methods
        function Iz=Iz(oThisCompositeArea)
            Iz=oThisCompositeArea.Iz_hat; %#ok<MCNPN>
        end
    end
    methods(Static)
        function [A_doubled_vec,Iy_doubled_vec,Iz_doubled_vec,Iyz_doubled_vec]=doubleAreas(A_half_vec,Iy_half_vec,Iz_half_vec,y_half_hat_vec,Iyz_half_vec)
            if nargin>=4
                A_doubled_vec=A_half_vec;
                Iy_doubled_vec=Iy_half_vec;
                Iz_doubled_vec=Iz_half_vec;
                ind_NonSymArea=find(y_half_hat_vec~=0);
                A_doubled_vec(ind_NonSymArea)=2*A_doubled_vec(ind_NonSymArea);
                Iy_doubled_vec(ind_NonSymArea)=2*Iy_doubled_vec(ind_NonSymArea);
                Iz_doubled_vec(ind_NonSymArea)=2*Iz_doubled_vec(ind_NonSymArea);
            else
                error('This class can be constructed using zero or 4 inputs.');
            end
            if nargin==5
                Iyz_doubled_vec=Iyz_half_vec;
                Iyz_doubled_vec(ind_NonSymArea)=2*Iyz_doubled_vec(ind_NonSymArea);
            else
                Iyz_doubled_vec=nan(size(A_half_vec));
            end
        end
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