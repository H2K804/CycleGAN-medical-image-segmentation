
DirectoryPathTA ='./datasets/train/med-image/A';
DirectoryPathTB ='./datasets/train/med-image/A';
DirectoryPathTC ='./datasets/train/med-image/A';
DirectoryPathTAhighlight ='./datasets/train/med-image/B';
DirectoryPathTBhighlight ='./datasets/train/med-image/B';
DirectoryPathTChighlight ='./datasets/train/med-image/B';
files = dir('./brainTumorDataPublic_1-766/*.mat');

i = 1;
for file = files'
    imgs = load(fullfile('./brainTumorDataPublic_1-766/',file.name));
    imgA = imgs.cjdata.image;
    imgA = double(imgA);
    label = imgs.cjdata.label;
    pid = imgs.cjdata.PID;
    iptsetpref('ImshowBorder','tight');
    figure(1);
    imshow(imgA,[0 2825]);
    imgB = imgs.cjdata.tumorMask;
    figure(2);
    imshow(imgB);
    imgBdoub = double(imgB)*3000;
    img3 = imgA + imgBdoub;
    iptsetpref('ImshowBorder','tight');
    figure(3);
    imshow(img3,[0 6000]);
    if label == 1
        % Save original image
        whereToStore=fullfile(DirectoryPathTA,['A_TA_',num2str(i),'_',pid, '.jpg']);
        saveas(figure(1), whereToStore);
        whereToStoreLabel=fullfile(DirectoryPathTAhighlight,['B_TB_',num2str(i),'_',pid, '.jpg']);
        saveas(figure(3), whereToStoreLabel);
    elseif label == 2
        whereToStore=fullfile(DirectoryPathTB,['A_TB_',num2str(i),'_',pid, '.jpg']);
        saveas(figure(1), whereToStore);
        whereToStoreLabel=fullfile(DirectoryPathTBhighlight,['B_TB_',num2str(i),'_',pid, '.jpg']);
        saveas(figure(3), whereToStoreLabel);
    elseif label == 3
        whereToStore=fullfile(DirectoryPathTC,['A_TC_',num2str(i),'_',pid, '.jpg']);
        saveas(figure(1), whereToStore);
        whereToStoreLabel=fullfile(DirectoryPathTChighlight,['B_TC_',num2str(i),'_',pid, '.jpg']);
        saveas(figure(3), whereToStoreLabel);
    end
    i = i + 1;

end

