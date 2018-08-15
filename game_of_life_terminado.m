clear all;
clc;


tam_mun = 100;
num_celulas_vivas = 700;

mundo = zeros(tam_mun,tam_mun);
r = randi([1 tam_mun],2,num_celulas_vivas);
for i=2:1:num_celulas_vivas
    mundo(r(1,i),r(2,i)) = 255;
end

mascara = zeros(3,3);

figure(1);
imshow(mundo);

mundo_aux = mundo;
intera = 0;

while intera < tam_mun
    for i=2:1:tam_mun-1
        for j=2:1:tam_mun-1

            cont = 0;
            i1 = 1;
            k1 = 1;
            for r=i-1:1:i+1
                for c=j-1:1:j+1
                    mascara(i1,k1) = mundo(r,c);
                    k1 = k1 +1;
                    if mundo(r,c) == 255
                        cont =  cont+1;
                    end
                end
                k1=1;
                i1 = i1 + 1;
            end
            %disp(mascara);

            if mascara(2,2) == 255
                cont =  cont - 1;
            end

            switch cont
                case 1
                    mundo_aux(i,j) = 0;
                    mascara(2,2) = 0;
                case 2
                    mundo_aux(i,j) = mundo_aux(i,j);
                    mascara(2,2) = mascara(2,2);
                case 3
                    mundo_aux(i,j) = 255;
                    mascara(2,2) = 255;
                otherwise
                    mundo_aux(i,j) = 0;
                    mascara(2,2) = 0;
            end

            %disp(mascara);

        end
    end
    mundo = mundo_aux;
    figure(1);
    imshow(mundo);
    intera = intera + 1;
end