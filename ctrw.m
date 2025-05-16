
t = 100;
x0 = 0;
N=0;
waiting_time=zeros;
x=zeros;
dt=0;

while 1==1
    tau=exprnd(1);
    %tau=PowerDensity(1,alpha,1);
    
    dt=dt+tau;
    if dt<=t
        l=randn;
        N=N+1;
        waiting_time(1,N)=tau;
        x(1,N)=l;
    else
        tau=t-dt+tau;
        N=N+1;
        waiting_time(1,N)=tau;
        x(1,N)=0;
        break
    end
end

tnode=zeros(1,2*N);
tnode(1,1)=0;
tnode(1,2)=waiting_time(1,1);

for i=3:2*N
    if (i-1)/2==fix((i-1)/2)
        tnode(1,i)=tnode(1,i-1);
    else
        tnode(1,i)=tnode(1,i-1)+waiting_time(1,i/2);
    end
end

xnode=zeros(1,2*N);
xnode(1,1)=x0;
xnode(1,2)=x0;

for i=3:2*N
    if (i-1)/2==fix((i-1)/2)
        xnode(1,i)=xnode(1,i-1)+x(1,(i-1)/2);
    else
        xnode(1,i)=xnode(1,i-1);
    end
end


MM=zeros(2,2*N);

for i=1:2*N    
          MM(1,i)=tnode(1,i);
          MM(2,i)=xnode(1,i);     
end


k=N+1;

for i=1:2*N-1
    m1=zeros(1,2);
    m2=zeros(1,2);
    m1(1,1)=MM(1,i);m1(1,2)=MM(1,i+1);
    m2(1,1)=MM(2,i);m2(1,2)=MM(2,i+1);
    plot(m1,m2,'red');
hold on
end
