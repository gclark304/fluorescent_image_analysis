%% for folder contains multiple images
clc
clear
folder_name= ' ';
cd(folder_name)
key_word='zt20';
d3=dir('*.lsm');
cell_length=[];
cell_width=[];
area_sum=[];
int_sum1=[];
int_sum2=[];
% pixel_size=318.20/512; %% um
for i=1:1:length(d3)
d3(i).name;
if ~isempty(strfind(d3(i).name,key_word)) && ~isempty(strfind(d3(i).name,'lsm'))
img=double(imread([folder_name '/' d3(i).name]));
img1=img(:,:,1); %%
img2=img(:,:,2);
bw=edge(img2,'prewitt');
se = strel('disk',5);
bw2=imdilate(bw,se);
% se2= strel('disk',3);
bw3=imerode(bw2,se);
bw4=1-bw3;
[m1,n1]=size(bw3);
% bw = imopen(bw,se);
%% for check the regions selected
% subplot(1,2,1)
% imshow(img2,'DisplayRange',[min(min(img2)),max(max(img2))],'InitialMagnification','fit')
% set(gcf,'position',get(0,'screensize'));
% subplot(1,2,2)
% imshow(bw3)
% pause(1)
% close
%% get the regions
b=bwboundaries(bw3,'noholes');
close
imshow(img2,'DisplayRange',[min(min(img2)),max(max(img2))],'InitialMagnification','fit')
set(gcf,'position',get(0,'screensize'));
title(d3(i).name)
%% analyze data
for j=1:1:length(b)
b2=b{j};
bx=b2(:,2);
by=b2(:,1);
bw5=poly2mask(bx,by,m1,n1);
r_length=regionprops(bw5,'MajorAxisLength');
r_width=regionprops(bw5,'MinorAxisLength');
r_area=regionprops(bw5,'Area');
if isempty(r_length)==0 && length(r_length)<2
r_ratio=r_length.MajorAxisLength/r_width.MinorAxisLength;
if r_length.MajorAxisLength>15 && r_length.MajorAxisLength<60 ...
    && r_ratio<1.0 && r_area.Area>500 &&r_area.Area<1000 %% lenth range and repeat number
hold on
plot(bx,by)
pause(1)
%% calculate the fluorescence intensity
% % imshow(bw5)
% % pause(1)
img1m=bw5.*img1;
img1bg=bw4.*img1;
% imshow(img1m,'DisplayRange',[min(min(img1m)),max(max(img1m))],'InitialMagnification','fit')
% pause(1)
int_bg=sum(sum(img1bg))/length(find(img1m==0))
int_max=max(max(img1m));
int_min=min(min(img1m));
int_ave=sum(sum(img1m))/r_area.Area;
area_sum=[area_sum,r_area.Area]
int_sum1=[int_sum1,int_ave-int_bg]
int_sum2=[int_sum2,int_max-int_bg]
end
end %% 
end  %% 
end
end  %% all images
area_sum=area_sum';
int_sum1=int_sum1';
int_sum2=int_sum2';
save([folder_name '/' key_word '_area.txt'],'-ASCII','-TABS','area_sum')
save([folder_name '/' key_word '_int_ave.txt'],'-ASCII','-TABS','int_sum1')
save([folder_name '/' key_word '_int_max.txt'],'-ASCII','-TABS','int_sum2')

