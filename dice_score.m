imgs = load('./brainTumorDataPublic_1-766/500.mat');
binaryMask = imgs.cjdata.tumorMask;
iptsetpref('ImshowBorder','tight');
figure(2);
imshow(img2,[  ]);

I = imread('A_2_A2B.jpg');

%Convert the image into a binary image.

figure(3);
imshow(I,[  ]);

Igray = rgb2gray(I);
BW = imbinarize(Igray);

figure(4);
imshow(BW,[  ]);
%Display the original image next to the binary version.

figure(3);
imshowpair(I,BW,'montage');

andImage = binaryMask & BW;
orImage  = binaryMask | BW;
diceCoeff = sum(andImage) / sum(orImage);
disp(diceCoeff);

