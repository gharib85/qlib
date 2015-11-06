function uHe = esHamiltonian( obj, J, magB )
%ESHAMILTONIAN Summary of this function goes here
%   Detailed explanation goes here
    I=obj.parameters.spin_I;
    gI=2*I+1; gJ=2*J+1;ge=gI*gJ;
    LgJ=gJ/3;%approximate Lande g-value of PJ state
    muI=obj.parameters.mu_I*muN;%nuclear moment in erg/G
    if J==1.5
%        Ae=hP*84.852e6;%P3/2 dipole coefficient in erg
%        Be=hP*12.611e6;%P3/2 quadrupole coupling coefficient in erg
        Ae=obj.parameters.hf_es2A*2.0*pi;
        Be=obj.parameters.hf_es2B*2.0*pi;
    elseif J==0.5
%        Ae=hP*409e6;%P1/2 dipole coupling coefficient in erg
        Ae=obj.parameters.hf_es1*2.0*pi;
    else
        disp('Error J');
    end

    sIp=diag(sqrt((1:2*I).*(2*I:-1:1)),1);
    sIj(:,:,1)=(sIp+sIp')/2;
    sIj(:,:,2)=(sIp-sIp')/(2*1j);
    sIj(:,:,3)=diag(I:-1:-I);
    sJp=diag(sqrt((1:2*J).*(2*J:-1:1)),1);
    sJj(:,:,1)=(sJp+sJp')/2;
    sJj(:,:,2)=(sJp-sJp')/(2*1j);
    sJj(:,:,3)=diag(J:-1:-J);
    %operators in uncoupled space
    aIje=zeros(ge,ge);
    gJj=zeros(ge,ge);
    umue=zeros(ge,ge);
    for k=1:3
        aIje(:,:,k)=kron(sIj(:,:,k),eye(gJ));
        gJj(:,:,k)=kron(eye(gI),sJj(:,:,k));
    end

    for k=1:3;% uncoupled magnetic moment operators
        umue(:,:,k)=-LgJ*muB*gJj(:,:,k)+(muI/(I+eps))*aIje(:,:,k);
    end
    uIJ=matdot(aIje,gJj);%uncoupled I.J
    uHe=Ae*uIJ - umue(:,:,3)*magB*1e-6/hbar;%Hamiltonian without quadrupole interaction, in [2pi*MHz]
    if J>1/2 && I>1/2
        uHe = uHe+Be*(3*uIJ^2+1.5*uIJ-I*(I+1)*J*(J+1)*eye(ge))...
            /(2*I*(2*I-1)*J*(2*J-1));%add quadrupole interaction
    end

end

