

figure

% for iii=1:90
in=simout.Data(:,:,64);

[r,c]=find(in(1:60,:)>0);
% r=r-120;
r=r*-1;
% c=c+80;

%calc ref x and ref y
refy=min(r);
id=find(r==refy);
centre_array=c(id);
refx=mean(centre_array);


ii=1;
a=1:10:length(r);
bet(1:length(a))=0;
for i=1:10:length(r)
    
    
    diffx(ii)=c(i)-refx;
    diffy(ii)=r(i)-refy;
    
    diff_mag(ii)=sqrt(diffx(ii)^2+diffy(ii)^2);
    
%     diff_mag(ii)=round(diff_mag(ii));
   
    if diffx(ii)>=0 && diffy(ii)>=0
        
        bet(ii)=atan2(diffx(ii),diffy(ii));
    elseif diffx(ii)>=0 && diffy(ii)<=0
        
        bet(ii)=atan2(-diffy(ii),diffx(ii))+pi/2;
        
    elseif diffx(ii)<=0 && diffy(ii)>=0
        
        bet(ii)=-atan2(-diffx(ii),diffy(ii));
        
    elseif diffx(ii)<=0 && diffy(ii)<=0
        
        bet(ii)=-atan2(-diffy(ii),-diffx(ii))-pi/2;
        
    end
    
    ii=ii+1;
end

beta_av=mean(bet);

%factored average
beta_av_fac=(sum(diff_mag.*bet))/(sum(diff_mag));

%     clear bet
    plot(c,r,'x')
    hold on
    plot(refx,refy,'r*');
    hold off
xlim([0 160]);
ylim([-120 0]);
pause(0.1)
