function directions = chcode(im) 
    directions = [];
    points = [findEdge(im)];
    oldPoint = points(1,:);
    oldDir = 4; %The direction we came from, needed to prevent back tracking
    dirs = [0,-1; -1,-1; -1,0;  -1,1;  0,1; 1,1; 1,0; 1,-1];
    while 0<1 %Messy do-while
        for Iter = 1:7
            newDir = mod(oldDir+4+Iter,8)+1;
            newPoint = oldPoint +dirs(newDir,:);
            if not(newPoint(1,1)==0 || newPoint(1,2)==0 || newPoint(1,1)>size(im,1) || newPoint(1,2)>size(im,2) || not(isEdge(im,newPoint) ))
                points = [points; newPoint];
                directions = [directions, newDir];
                oldPoint = newPoint;
                oldDir = newDir;
                break
            end
        end
        if oldPoint == points(1,:)
            break 
        end 
    end
end

function result = isEdge(im,point)
     dirs = [-1,0; -1,-1; 0,-1;  1,-1;  1,0; 1,1; 0,1; -1,1];
     result = false;
     if im(point(1),point(2)) == 0
       return
     end
     for iter = 1:8
         x1 = point(1)+ dirs(iter,1);
         y1 = point(2)+ dirs(iter,2);
         result = result || x1 == 0 || y1==0 || x1>size(im,1) || y1>size(im,2) || im(x1,y1) == 0;
     end
end

function point = findEdge(im)
    for ROWS = 1:size(im,1)
        for COLS = 1:size(im,2)
            if im(ROWS,COLS) == 1
                point = [ROWS, COLS];
                return
            end
        end
    end
end