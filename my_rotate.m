function [resim] = my_rotate( img )
   [rowsi,colsi]= size(img); 
   angle = input('Enter Angle=');
   rads = pi*angle/180;
   rowsf = ceil(rowsi*abs(cos(rads))+colsi*abs(sin(rads)));                      
   colsf = ceil(rowsi*abs(sin(rads))+colsi*abs(cos(rads)));  
   % define an array with calculated dimensions and fill the array  with zeros ie.,black
   C = uint8(zeros([rowsf colsf]));
   %calculating center of original and final image
   xo = ceil(rowsi/2);                                                            
   yo = ceil(colsi/2);

   midx = ceil((size(C,1))/2);
   midy = ceil((size(C,2))/2);

   % in this loop we calculate corresponding coordinates of pixel of A 
   % for each pixel of C, and its intensity will be  assigned after checking
   % weather it lie in the bound of A (original image)
   for i = 1:size(C,1)
       for j = 1:size(C,2)                                                       

        x= (i-midx)*cos(rads)+(j-midy)*sin(rads);                                       
        y= -(i-midx)*sin(rads)+(j-midy)*cos(rads);                             
        x = round(x)+xo;
        y = round(y)+yo;

             if (x>=1 && y>=1 && x<=size(img,1) &&  y<=size(img,2) ) 
                 C(i,j,:)=img(x,y,:);  
             end

         end
    end
        resim = C;
end
