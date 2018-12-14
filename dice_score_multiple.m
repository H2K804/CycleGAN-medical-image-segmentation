% pick files from two folders
allScores = [];
for k = 1:124

	% Create an image filename, and read it in to a variable called imageData.
	%read real highlight image
    
    realHLfileName = strcat('./real_highlights/','B_', num2str(k+1),'_realB','.jpg');
	if exist(realHLfileName, 'file')
		realImage = imread(realHLfileName);
	else
		fprintf('File %s does not exist.\n', realHLfileName);
    end
	
    genHLfileName = strcat('./generated_highlights/','A_', num2str(k),'_A2B','.jpg');
	if exist(genHLfileName, 'file')
		genImage = imread(genHLfileName);
	else
		fprintf('File %s does not exist.\n', genHLfileName);
    end

    %imshowpair(I,BW,'montage');
    realIgray = rgb2gray(realImage);
    genIgray = rgb2gray(genImage);
    
    realBW = imbinarize(realIgray);
    genBW = imbinarize(genIgray);
    
%     figure(1);
%     
% 	imshowpair(realImage,realIgray,'montage');
%     figure(2);
%     %,genImage,genIgray,genBW,
%     imshowpair(realBW,genBW,'montage');
%     
%     figure(3);
%     imshowpair(I,BW,'montage');
%     
    andImage = realBW & genBW;
    orImage  = realBW | genBW;
    diceCoeff = sum(andImage) / sum(orImage);
    disp(diceCoeff);
    
    allScores = [allScores, diceCoeff];

end

disp(allScores);
meanScore = mean(allScores);
disp("-------");
disp(meanScore);