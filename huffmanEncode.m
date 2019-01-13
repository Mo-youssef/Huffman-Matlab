function [finaltable,message,average,entropy,efficiency]=huffmanEncode(input)
input = double(input);
inputt=input;
input = sort(input);
mlength = size(input);
mlength = mlength(2);
check = input(1);
number = 0;
j=1;
for i=1:mlength
    if check == input(i)
        number= number+1;
    else
        final(j,1)=check;
        final(j,2)=number/mlength;
        final(j,3)=0;
        final(j,4)=j;
        number =1;
        check = input(i);
        j=j+1;
    end
end
final(j,1)=check;
final(j,2)=number/mlength;
final(j,4)=j;
j=j+1;

finalM = final;
finalM = sortrows(finalM,2);
finalM = sortrows(finalM,3);
prob = 0;
while prob~=1
    finalM(j,1)=finalM(1,1)+finalM(2,1);
    finalM(j,2)=finalM(1,2)+finalM(2,2);
    finalM(j,4)=j;
    finalM(j,5)=finalM(1,4);
    finalM(j,6)=finalM(2,4);
    prob = finalM(j,2);
    finalM(j,3)=0;
    finalM(1,3)=1;
    finalM(2,3)=1;
    j=j+1;
    finalM = sortrows(finalM,2);
    finalM = sortrows(finalM,3);
end

finalM = sortrows(finalM,2);
finall = finalM;
for i=1:length(finalM(:,1))
    finalM(i,:)=finall(length(finalM(:,1))-i+1,:);
end
clear finall;


codetable={};
codetable{1}='1';
codetable{2}='0';
finalM(find(finalM(:,4)==finalM(1,5),1),7)=1;
finalM(find(finalM(:,4)==finalM(1,6),1),7)=2;
z=3;
finalM = finalM(2:length(finalM(:,1)),:);

for i=1:length(finalM(:,1))
    if finalM(i,5)~=0
        codetable{z}=[codetable{finalM(i,7)},'1'];
        codetable{z+1}=[codetable{finalM(i,7)},'0'];
        finalM(find(finalM(:,4)==finalM(i,5),1),7)=z;
        finalM(find(finalM(:,4)==finalM(i,6),1),7)=z+1;
        z=z+2;
    end
end
finalM=sortrows(finalM,4);

finaltable={};
average =0;
entropy=0;
for i=1:length(final(:,1))
    finaltable{i,1}=finalM(i,1);
    finaltable{i,2}=codetable{finalM(i,7)};
    average = average+finalM(i,2)*length(finaltable{i,2});
    entropy = entropy+ (finalM(i,2)*log2(1/finalM(i,2)));
end
efficiency = entropy/average;
message='';
for i=1:length(input)
    index = find([finaltable{:,1}] == inputt(i));
    message=[message finaltable{index,2}];
end
end
