
figure

for iii=1:332
in=simout.Data(:,:,iii);

[r,c]=find(in(1:60,:)>0);
% r=r-120;
r=r*-1;

%calc ref x and ref y

refy=min(r);
id=find(r==refy);
centre_array=c(id);
refx=mean(centre_array);

if isnan(refx) || isempty(refx)
    
    refx=80;
    refy=-60;
end


ii=1;
a=1:10:length(r);
bet(1:length(a))=0;
diff_mag(1:length(a))=0;
for i=1:10:length(r)
    
    diffx=c(i)-refx;
    diffy=r(i)-refy;

    diff_mag(ii)=sqrt(diffx^2+diffy^2);
    
    if diffx>=0 && diffy>=0
        
        bet(ii)=atan2(diffx,diffy);
        
    elseif diffx>=0 && diffy<=0
        
        bet(ii)=atan2(-diffy,diffx)+pi/2;
        
    elseif diffx<=0 && diffy>=0
        
        bet(ii)=-atan2(-diffx,diffy);
        
    elseif diffx<=0 && diffy<=0
        
        bet(ii)=-atan2(-diffy,-diffx)-pi/2;
        
    end
    
    ii=ii+1;
end

beta_av(iii)=mean(bet);
%factored average
beta_av_fac(iii)=(sum(diff_mag.*bet))/(sum(diff_mag));

clear bet
clear diff_mag

xin=0:0.1:160;

%vect1
const1=(refy)-(1/tan(beta_av(iii)))*refx;
yline1=(1/tan(beta_av(iii))).*xin+const1;

%vect2
const2=(refy)-(1/tan(beta_av_fac(iii)))*refx;
yline2=(1/tan(beta_av_fac(iii))).*xin+const2;

plot(c,r,'x')
hold on
plot(xin,yline1,'b');
plot(xin,yline2,'g');
plot(refx,refy,'r*');
hold off
xlim([0 160]);
ylim([-120 0]);
pause(0.1)
end