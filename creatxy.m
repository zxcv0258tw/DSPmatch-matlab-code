function [point1,point2] = creatxy(vx1,vy1,vx2,vy2,img)

    [h1,w1,~] = size(img);

    [x1 y1] = meshgrid(0:w1-1, 0:h1-1);
    %x2 = x1+ vx1;
    %y2 = y1+ vy1;
    
    x2 = x1+ vx2;
    y2 = y1+ vy2;    
    
    
    %tf1 = x2 >= 1 & x2 <= w1 & y2 >= 1 & y2 <= h1;
    
    %tf = tf1(223:372,693:883);
    %ptr_ind1 = sub2ind(size(vx1), y2(tf1), x2(tf1));
    
    %newvx2 = zeros(h1,w1);
    %newvy2 = zeros(h1,w1);
    %newvx2(ptr_ind1) = vx1(ptr_ind1);
    %newvy2(ptr_ind1) = vy1(ptr_ind1);
    
    %newx2 = x1 + newvx2;
    %newy2 = y1 + newvy2;
    
    
    
    %newx2 = zeros(h1,w1);
    %newy2 = zeros(h1,w1);
    
    %newx2(ptr_ind1) = x2(ptr_ind1);
    %newy2(ptr_ind1) = y2(ptr_ind1);
    
    %u = x1 + newvx2;
    %v = y1 + newvy2;
    
    %mask = sqrt(abs(x1-u).^2 + abs(y1-v).^2) <= 0;
    %b = find(mask==1);
    u = u(223:372,693:883);
    v = v(223:372,693:883);

    x1 = x1(170:265,760:879);
    y1 = y1(170:265,760:879);   
    
    %x1 = x1(80:243,900:1000);
    %y1 = y1(80:243,900:1000);   
    
    x2 = x2(170:265,760:879);
    y2 = y2(170:265,760:879);
    
    %x2 = x2(80:243,1000:1100);
    %y2 = y2(80:243,1000:1100);    
    
    point1 = [x1(:),y1(:)];
    point2 = [x2(:),y2(:)];
    
    %point1 = [x1(b),y1(b)];
    %point2 = [x2(b),y2(b)];
    
    %bx1 = x1(tf1)+vx1(tf1);
    %by1 = y1(tf1)+vy1(tf1);
    
    
    %tmpx = x1(by1, bx1)+vx2(by1, bx1);
    %tmpy = y1(by1, bx1)+vy2(by1, bx1);
    
    %bx2 = tmpx > 0 & tmpx <= w1 & tmpy > 0 & tmpy <= h1;
    %tf1(tf1) = tf1(tf1) & bx2;
    %bx2 = sqrt(abs(x1(tf1) - tmpx(bx2)).^2 + abs(y1(tf1) - tmpy(bx2)).^2)<=50;
    %tf1(tf1) = tf1(tf1) & bx2;
    
    %bx1 = x1(tf1)+vx1(tf1);
    %by1 = y1(tf1)+vy1(tf1);
    
    
end