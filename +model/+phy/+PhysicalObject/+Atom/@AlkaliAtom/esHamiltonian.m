function uHe = esHamiltonian( obj, J, magB )
%ESHAMILTONIAN Summary of this function goes here
%   Detailed explanation goes here
<<<<<<< HEAD
    I=obj.parameters.spin_I;
    nuc=obj.nSpin; 
    gammaN=nuc.gamma; 
    gI=nuc.dim;
    if J==1.5
    %        Ae=hP*84.852e6;%P3/2 dipole coefficient in erg
    %        Be=hP*12.611e6;%P3/2 quadrupole coupling coefficient in erg
        Ae=obj.parameters.hf_es2A*2.0*pi; %in unit 2pi* MHz
        Be=obj.parameters.hf_es2B*2.0*pi; %in unit 2pi* MHz
        ge=obj.dimE2;
        ele=obj.e2Spin;

    elseif J==0.5
    %        Ae=hP*409e6;%P1/2 dipole coupling coefficient in erg
        Ae=obj.parameters.hf_es1*2.0*pi; %in unit 2pi* MHz
=======
I=obj.parameters.spin_I;
  nuc=obj.nSpin; 
  gammaN=nuc.gamma; 
  gI=nuc.dim;
    if J==1.5
%        Ae=hP*84.852e6;%P3/2 dipole coefficient in erg
%        Be=hP*12.611e6;%P3/2 quadrupole coupling coefficient in erg
        Ae=obj.parameters.hf_es2A;
        Be=obj.parameters.hf_es2B;
        ge=obj.dimE2;
        ele=obj.e2Spin;
        
    elseif J==0.5
%        Ae=hP*409e6;%P1/2 dipole coupling coefficient in erg
        Ae=obj.parameters.hf_es1;
>>>>>>> master
        ge=obj.dimE1;
        ele=obj.e1Spin;
    else
        disp('Error J');
    end
    gammaE=ele.gamma;
    gJ=ele.dim;
<<<<<<< HEAD

    sIj(:,:,1)=nuc.sx;
    sIj(:,:,2)=nuc.sy;
    sIj(:,:,3)=nuc.sz;

    sJj(:,:,1)=ele.sx;
    sJj(:,:,2)=ele.sy;
    sJj(:,:,3)=ele.sz; 

=======
    
    sIj(:,:,1)=nuc.sx;
    sIj(:,:,2)=nuc.sy;
    sIj(:,:,3)=nuc.sz;

    sJj(:,:,1)=ele.sx;
    sJj(:,:,2)=ele.sy;
    sJj(:,:,3)=ele.sz; 
    
>>>>>>> master
    aIje=zeros(ge,ge);
    gJj=zeros(ge,ge);
    umue=zeros(ge,ge);
    for k=1:3
        aIje(:,:,k)=kron(sIj(:,:,k),eye(gJ));
        gJj(:,:,k)=kron(eye(gI),sJj(:,:,k));
    end

    for k=1:3;% uncoupled magnetic moment operators
<<<<<<< HEAD
        umue(:,:,k)=-gammaE*gJj(:,:,k)-gammaN*aIje(:,:,k);
    end
    uIJ=matdot(aIje,gJj);%uncoupled I.J
    uHe=Ae*uIJ + umue(:,:,3)*magB*1e-6;%Hamiltonian without quadrupole interaction, in [MHz]
=======
        umue(:,:,k)=gammaE*gJj(:,:,k)+gammaN*aIje(:,:,k);
    end
    uIJ=matdot(aIje,gJj);%uncoupled I.J
    uHe=Ae*uIJ - umue(:,:,3)*magB*1e-6;%Hamiltonian without quadrupole interaction, in [MHz]
>>>>>>> master
    if J>1/2 && I>1/2
        uHe = uHe+Be*(3*uIJ^2+1.5*uIJ-I*(I+1)*J*(J+1)*eye(ge))...
            /(2*I*(2*I-1)*J*(2*J-1));%add quadrupole interaction
    end

end

