%LD Nr.2
clear all
%x=0.1:1/22:1;
x = linspace(0.1,1,20);
d = ((1 + 0.6 * sin (2 * pi * x / 0.7)) + 0.3 * sin (2 * pi * x)) / 2;

%pirmas sluoksnis
w11=randn(1);
w12=randn(1);
w13=randn(1);
w14=randn(1);
w15=randn(1);
b11=randn(1);
b12=randn(1);
b13=randn(1);
b14=randn(1);
b15=randn(1);
% antras sluoksnis

w21=randn(1);
w22=randn(1);
w23=randn(1);
w24=randn(1);
w25=randn(1);
b21=randn(1);

%atsako skai2iavimas
for il=1:100000
for i=1:20;
    
    %pasvertoji suma
    v11=x(i)*w11+b11;
    v12=x(i)*w12+b12;
    v13=x(i)*w13+b13;
    v14=x(i)*w14+b14;
    v15=x(i)*w15+b15;
    
    %pirmojo sluoksnio išėjimai
     y11 = 1/(1+exp(-v11));
     y12 = 1/(1+exp(-v12));
     y13 = 1/(1+exp(-v13));
     y14 = 1/(1+exp(-v14));
     y15 = 1/(1+exp(-v15));
     
     
     v21=y11*w21 + y12*w22 + y13*w23 + y14*w24 + y15*w25+b21;
     
     y21=v21;
     e=d(i)-y21;
   
     %mokymo zingsnis
     n=0.1;
     %skaičiujame klaidos gradientą
     deltaout=e;
     
     delta1=y11*(1-y11)*deltaout*w21;
     delta2=y12*(1-y12)*deltaout*w22;
     delta3=y13*(1-y13)*deltaout*w23;
     delta4=y14*(1-y14)*deltaout*w24;
     delta5=y15*(1-y15)*deltaout*w25;
   
     %pirmo sluoksnio atnaujinti svoriai
     w11=w11+n*delta1*x(i);
     w12=w12+n*delta2*x(i);
     w13=w13+n*delta3*x(i);
     w14=w14+n*delta4*x(i);
     w15=w15+n*delta5*x(i);
     
     %antrojo sluoksnio atnaujinti svoriai
     w21=w21+n*deltaout*y11;
     w22=w22+n*deltaout*y12;
     w23=w23+n*deltaout*y13;
     w24=w24+n*deltaout*y14;
     w25=w25+n*deltaout*y15;
     
     b11=b11+n*delta1;
     b12=b12+n*delta2;
     b13=b13+n*delta3;
     b14=b14+n*delta4;
     b15=b15+n*delta5;
     
     b21=b21+n*deltaout;
end
end
for i=1:20;
    
    %pasvertoji suma
    v11=x(i)*w11+b11;
    v12=x(i)*w12+b12;
    v13=x(i)*w13+b13;
    v14=x(i)*w14+b14;
    v15=x(i)*w15+b15;
    
    %pirmojo sluoksnio išėjimai
     y11 = 1/(1+exp(-v11));
     y12 = 1/(1+exp(-v12));
     y13 = 1/(1+exp(-v13));
     y14 = 1/(1+exp(-v14));
     y15 = 1/(1+exp(-v15));
     
     
     v21=y11*w21 + y12*w22 + y13*w23 + y14*w24 + y15*w25+b21;
     
     y21(i)=v21;
    
end
%
figure, plot(x,d,'ro',x,y21,'gx')


