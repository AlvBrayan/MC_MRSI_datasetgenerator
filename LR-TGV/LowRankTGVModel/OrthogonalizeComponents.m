function [ nV_tc] = OrthogonalizeComponents(V_tc)

%CovV=V_tc'*V_tc
%CovV=diag(1./sqrt(diag(abs(CovV))))*CovV*diag(1./sqrt(abs(diag(CovV))));

NbComp=size(V_tc,2);
nV_tc=V_tc;

for a=2:NbComp
    %for b=1:(a-1)
     %    nV_tc(:,a)=nV_tc(:,a)-nV_tc(:,b)*nV_tc(:,b)'*V_tc(:,a)/norm(nV_tc(:,b))^2;
    %end
    nV_tc(:,a)=nV_tc(:,a)-nV_tc(:,1:(a-1))*diag(1.0./diag(nV_tc(:,1:(a-1))'*nV_tc(:,1:(a-1))))*nV_tc(:,1:(a-1))'*V_tc(:,a);
end

%{
CovV=nV_tc'*nV_tc;
for a=1:NbComp
    nV_tc(:,a)=nV_tc(:,a)/CovV(a,a);
end
%}
end
