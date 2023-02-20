classdef cCmArSymYZ < cCmArSymY & cCmArSymZabst
    %cCmArSymYZ Summary of this class goes here
    %   Detailed explanation goes here
    methods
        function oThisCompositeAreaSymYZ = cCmArSymYZ(A_quarter_vec,...
                Iy_quarter_vec,Iz_quarter_vec,y_quarter_hat_vec,z_quarter_hat_vec)
            %cCmArSymYZ Construct an instance of this class
            %   Detailed explanation goes here
            if nargin==0
                superClassArgs={};
            elseif nargin==5
                [A_ddoubled_vec,Iy_ddoubled_vec,Iz_ddoubled_vec]=cCmArSymZabst.doubleAreas(A_quarter_vec,Iy_quarter_vec,Iz_quarter_vec,y_quarter_hat_vec);
                superClassArgs={A_ddoubled_vec,Iy_ddoubled_vec,Iz_ddoubled_vec,y_quarter_hat_vec,z_quarter_hat_vec};
            else
                error('This class can be constructed using zero or 5 inputs.');
            end
            oThisCompositeAreaSymYZ@cCmArSymY(superClassArgs{:});
        end
        
        function Iz=Iz(oThisCompositeAreaSymYZ)
            Iz=oThisCompositeAreaSymYZ.Iz_hat;
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

