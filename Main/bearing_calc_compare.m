refx=80;
refy=-80;
figure
%implemented function
refxalt=80;
refyalt=-80;
for iii=1:90
in=simout2.Data(:,:,iii);

[r,c]=find(in>0);
% r=r-120;
r=r*-1;



ii=1;
a=1:10:length(r);
bet(1:length(a))=0;

[ralt,calt]=find(in>0);
ralt=-ralt;
jj=1;
alt=1:10:length(ralt);
betalt(1:length(a))=0;
for i=1:10:length(r)
    
    diffx=c(i)-refx;
    diffy=r(i)-refy;
    
    if diffx>=0 && diffy>=0
        
        bet(ii)=atan2(diffx,diffy);
        
    elseif diffx>=0 && diffy<=0
        
        bet(ii)=atan2(-diffy,diffx)+pi/2;
        
    elseif diffx<=0 && diffy>=0
        
        bet(ii)=-atan2(-diffx,diffy);
        
    elseif diffx<=0 && diffy<=0
        
        bet(ii)=-atan2(diffy,diffx)-pi/2;
        
    end
    
    ii=ii+1;
end

for i=1:10:length(ralt)
    
    diffx=c(i)-refx;
    diffy=r(i)-refy;
    
    if diffx>=0 && diffy>=0
        
        betalt(jj)=atan2(diffx,diffy);
        
    elseif diffx>=0 && diffy<=0
        
        betalt(jj)=atan2(-diffy,diffx)+pi/2;
        
    elseif diffx<=0 && diffy>=0
        
        betalt(jj)=-atan2(-diffx,diffy);
        
    elseif diffx<=0 && diffy<=0
        
        betalt(jj)=-atan2(diffy,diffx)-pi/2;
    else
        betalt(jj)=0;
    end
    
    jj=jj+1;
end


beta_av(iii)=mean(bet);
    clear bet
  
beta_av_alt(iii)=mean(betalt);

beta_out(iii)=beta_av_alt(iii)-2*pi*(round(beta_av_alt(iii)/(2*pi)));
clear betalt
    
    plot(c,r)
xlim([0 160]);
ylim([-120 0]);
pause(0.1)
end



