

run('/home/kevin/Desktop/CVhomework/homework4/vlfeat-0.9.20/toolbox/vl_setup')
data_path = '../../';
image_file = 'images';
dense_sift_file = 'dense_sift_feature/';

pano_path = fullfile(data_path, 'pano_dense_sift/00002',image_file);
pano_dsp_path = fullfile(data_path, 'pano_dsp/00002/');
pano_file = dir( fullfile( pano_path, '*.jpg') );
pano_num_images = length(pano_file);


video_path = fullfile(data_path, 'video_dense_sift/00002',image_file);
%video_sift_path = fullfile(data_path, 'video_dense_sift/00002',dense_sift_file);
video_dsp_path = fullfile(data_path, 'video_dsp/00002/');
video_file = dir( fullfile( video_path, '*.jpg') );
video_num_images = length(video_file);

feature_path = fullfile(data_path, 'dsp_match/00002');

pca_basis = [];
sift_size = 4;

%panoimg = imread([pano_path '/' pano_file(12).name]);
%videoimg = imread([video_path '/' video_file(6).name]);

panoimg = imread([pano_path '/' pano_file(5).name]);
videoimg = imread([video_path '/' video_file(23).name]);

tic;
[sift1, bbox1] = ExtractSIFT(panoimg, pca_basis, sift_size);
[sift2, bbox2] = ExtractSIFT(videoimg, pca_basis, sift_size);

panoimg = panoimg(bbox1(3):bbox1(4), bbox1(1):bbox1(2), :);
videoimg = videoimg(bbox2(3):bbox2(4), bbox2(1):bbox2(2), :);

[vx1,vy1] = DSPMatch(sift1, sift2); 
[vx2,vy2] = DSPMatch(sift2, sift1); 


warp21=warpImage(im2double(panoimg),vx2,vy2);
figure,
subplot(2,2,1);
imshow(panoimg);
title('image2');
subplot(2,2,3);
imshow(videoimg);
title('image1');
subplot(2,2,2);
imshow(warp21);
title('warp 2-->1');
[point1,point2] = creatxy(vx1,vy1,vx2,vy2,panoimg);
save([ '../' pano_file(5).name '>' video_file(23).name '9.dsp_match.mat'],'point1','point2');
toc;















