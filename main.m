

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

for i = 1:pano_num_images
   
    tic;
    
    panoimg = imread([pano_path '/' pano_file(i).name]);
    %panoimg = imresize(panoimg);
    [sift1, bbox1] = ExtractSIFT(panoimg, pca_basis, sift_size);
    panoimg = panoimg(bbox1(3):bbox1(4), bbox1(1):bbox1(2), :);
    %imwrite(panoimg,[pano_dsp_path,image_file '/' pano_file(i).name]);
    
    %toc;
    for j = 1:video_num_images
     
        
        videoimg = imread([video_path '/' video_file(j).name]);
        %videoimg = imresize(videoimg);
        [sift2, bbox2] = ExtractSIFT(videoimg, pca_basis, sift_size);
        
        videoimg = videoimg(bbox2(3):bbox2(4), bbox2(1):bbox2(2), :);
        %imwrite(videoimg,[video_dsp_path,image_file '/' video_file(j).name]);

        [vx1,vy1] = DSPMatch(sift1, sift2); 
        [vx2,vy2] = DSPMatch(sift2, sift1); 
        
        [point1,point2] = creatxy(vx1,vy1,vx2,vy2,panoimg);
        %[point3,point4] = creatxy(vx2,vy2,videoimg);

        save([feature_path '/' pano_file(i).name '>' video_file(j).name '.dsp_match.mat'],'point1','point2','point3','point4');
        
        
        toc;

    end
end
