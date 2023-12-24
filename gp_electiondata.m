load('x_gen.mat')
x=myTable; %% 카테고리별 설문조사 사전투표자 수
load('n_gen.mat')
n=myTable; %% 카테고리별 설문조사 총 응답자 수
load('largeN_gen.mat')
N=myTable; %% 카테고리별 총 유권자수

N_i=squeeze(sum(squeeze(sum(N,2)),2)); %% N의 marginal sum
w= N ./ N_i; %% w_ij

load('r.mat')
r = myTable/100;
weight = w ./ r; %% w_ij/r_i

weightmat=zeros(17,34);
weight1 = weight(1,:)';
weightmat(1,1:2) = weight1(:);
weight2 = weight(2,:)';
weightmat(2,3:4) = weight2(:);
weight3 = weight(3,:)';
weightmat(3,5:6) = weight3(:);
weight4 = weight(4,:)';
weightmat(4,7:8) = weight4(:);
weight5 = weight(5,:)';
weightmat(5,9:10) = weight5(:);
weight6 = weight(6,:)';
weightmat(6,11:12) = weight6(:);
weight7 = weight(7,:)';
weightmat(7,13:14) = weight7(:);
weight8 = weight(8,:)';
weightmat(8,15:16) = weight8(:);
weight9 = weight(9,:)';
weightmat(9,17:18) = weight9(:);
weight10 = weight(10,:)';
weightmat(10,19:20) = weight10(:);
weight11 = weight(11,:)';
weightmat(11,21:22) = weight11(:);
weight12 = weight(12,:)';
weightmat(12,23:24) = weight12(:);
weight13 = weight(13,:)';
weightmat(13,25:26) = weight13(:);
weight14 = weight(14,:)';
weightmat(14,27:28) = weight14(:);
weight15 = weight(15,:)';
weightmat(15,29:30) = weight15(:);
weight16 = weight(16,:)';
weightmat(16,31:32) = weight16(:);
weight17 = weight(17,:)';
weightmat(17,33:34) = weight17(:);

A=[eye(34) , eye(34) ; weightmat, zeros(17,34)];
y=x';
m=n';
xvec = [y(:);m(:)-y(:)]';

solution=gprelax(A,xvec);
A*solution
prevote_raking_gen = reshape(solution(1:34),[2,17])';

prevote_est = x ./ n;