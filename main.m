generating the signal 
%this is because i don't have the communication tool box to use randsrc
sig(1:350)=1;
sig(351:650)=2;
sig(651:850)=3;
sig(851:950)=4;
sig(951:990)=5;
sig(991:995)=6;
sig(996:1000)=7;
sig=sig(randperm(length(sig)));

% built-in
symbols = 1:7;
p = [0.35 0.3 0.2 0.1 0.04 0.005 0.005];
dict = huffmandict(symbols,p);
comp = huffmanenco(sig,dict);
binaryComp = de2bi(comp);
builtinlength = length(binaryComp);

% my function 
[finaltable,message,average,entropy,efficiency]=huffmanEncode(sig);
myfunct = length(message);

difference = myfunct-builtinlength;

