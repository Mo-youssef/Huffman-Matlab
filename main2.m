%testing on speech
[inputi,Fs] = audioread('Hawk.mp3');
input = inputi(:,1);
inputt = inputi(:,2);
input2 = round(input*1000);
inputt2 = round(inputt*1000);
[finaltable,message,average,entropy,efficiency]=huffmanEncode(input2');
[finaltable2,message2,average2,entropy2,efficiency2]=huffmanEncode(inputt2');
decodedmessage = huffmanDecode(finaltable,message);
decodedmessage2 = huffmanDecode(finaltable2,message2);
audiowrite('Hawkde.wav',[decodedmessage' decodedmessage2'],Fs);
isequal(decodedmessage',input2)
isequal(decodedmessage2',inputt2)
save('huffmanencode.txt','finaltable','finaltable2','message','message2');