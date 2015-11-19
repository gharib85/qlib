%% incibeampq
figure;
plot(1:length(a0),real(a0),'r-')
data1=dlmread('D:\mywork\zhoulm\OpticalTrap\FScat\SphereScat\SphereScat\05incibeampq.txt');
hold on;
aindx=find(data1(:,4));
tmp1=[data1(:,1),data1(:,4)];
tmp2=tmp1(aindx,:);
plot(1:length(aindx),tmp2(:,2),'b--')

%% incibeamab
figure;
data1=tmp;
plot(1:length(data1(:,3)),real(data1(:,3)),'r-')
data1=dlmread('D:\mywork\zhoulm\OpticalTrap\FScat\SphereScat\SphereScat\05scatbeamab.txt');
hold on;
aindx=find(data1(:,4));
tmp1=[data1(:,1),data1(:,4)];
tmp2=tmp1(aindx,:);
plot(1:length(aindx),tmp2(:,2),'b--')

%% test the D matrix
n=1;m=1;Nmax=1;
krL=0.5; thetaL=pi/3;phiL=pi/6;
krP=0.5; thetaP=0;phiP=0;
[ML1,NL1] = vswfcart(n,m,krL,thetaL,phiL);ML1
% [rt,theta,phi]=ott13.xyz2rtp(scat1.x,scat1.y,scat1.z);
% R = ott13.z_rotation_matrix(-theta,-phi); %calculates an appropriate axis rotation off z.
R = ott13.z_rotation_matrix(pi/3,pi/6);
D = ott13.wigner_rotation_matrix(Nmax,R);D=full(D)
[MP1,NP1] = vswfcart(n,1,krP,thetaP,phiP);
[MP0,NP0] = vswfcart(n,0,krP,thetaP,phiP);
[MP_1,NP_1] = vswfcart(n,-1,krP,thetaP,phiP);
[MP_1;MP0;MP1]
Mnew=D(1,1)*MP_1+D(1,2)*MP0+D(1,3)*MP1;Mnew
Mnew=D(1,1)*MP_1+D(2,1)*MP0+D(3,1)*MP1;Mnew

%% test the D
Nmax=1;
R = ott13.z_rotation_matrix(pi/3,0);%R = rotation_matrix([0,1,0],pi/3); %The same as zeng, rotate sate.
D = ott13.wigner_rotation_matrix(Nmax,R);D=full(D);
D1=D'% This is the D of zeng
% add m'*alpha to get D2
alpha=pi/6;
D2=[D1(1,:)*exp(-1i*(-1)*alpha);D1(2,:)*exp(-1i*0*alpha);D1(3,:)*exp(-1i*1*alpha)];D2
R = ott13.z_rotation_matrix(pi/3,pi/6);
D = ott13.wigner_rotation_matrix(Nmax,R);D=full(D)

n=1;m=1;Nmax=1;
krL=0.5; thetaL=pi/3;phiL=pi/6;
krP=0.5; thetaP=0;phiP=0;
[MP1,NP1] = vswfcart(n,m,krP,thetaP,phiP);MP1
% [rt,theta,phi]=ott13.xyz2rtp(scat1.x,scat1.y,scat1.z);
% R = ott13.z_rotation_matrix(-theta,-phi); %calculates an appropriate axis rotation off z.
R = ott13.z_rotation_matrix(pi/3,pi/6);
D = ott13.wigner_rotation_matrix(Nmax,R);
D=D';D=full(D)
[ML1,NL1] = vswfcart(n,1,krL,thetaL,phiL);
[ML0,NL0] = vswfcart(n,0,krL,thetaL,phiL);
[ML_1,NL_1] = vswfcart(n,-1,krL,thetaL,phiL);
[ML_1;ML0;ML1]
Mnew=D(1,1)*ML_1+D(1,2)*ML0+D(1,3)*ML1;[MP1;Mnew]
% Mnew=D(1,1)*ML_1+D(2,1)*ML0+D(3,1)*ML1;[MP1;Mnew]
%%single y axis rotation theta
n=1;m=1;Nmax=1;
krL=0.5; thetaL=pi/3;phiL=0;
krP=0.5; thetaP=0;phiP=0;
[MP1,NP1] = vswfcart(n,m,krP,thetaP,phiP);MP1
% [rt,theta,phi]=ott13.xyz2rtp(scat1.x,scat1.y,scat1.z);
% R = ott13.z_rotation_matrix(-theta,-phi); %calculates an appropriate axis rotation off z.
R = ott13.z_rotation_matrix(pi/3,pi/6);
D = ott13.wigner_rotation_matrix(Nmax,R);
D=D';D=full(D)
[ML1,NL1] = vswfcart(n,1,krL,thetaL,phiL);
[ML0,NL0] = vswfcart(n,0,krL,thetaL,phiL);
[ML_1,NL_1] = vswfcart(n,-1,krL,thetaL,phiL);
[ML_1;ML0;ML1]
Mnew=D(1,1)*ML_1+D(1,2)*ML0+D(1,3)*ML1;[MP1;Mnew]
% Mnew=D(1,1)*ML_1+D(2,1)*ML0+D(3,1)*ML1;[MP1;Mnew]

