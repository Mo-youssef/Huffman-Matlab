function [message] = huffmanDecodeStr(table,code)
% if type = 1 then the message is string
word = '';
j=1;
for i=1:length(code)
    word = [word code(i)];
    index = find(strcmp(table(:,2), word));
    if ~isempty(index)
        message(j)=table(index,1);
        j=j+1;
        word='';
    end
end
message = char(cell2mat(message));
end