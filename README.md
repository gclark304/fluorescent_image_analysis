# fluorescent_image_analysis


**General Information**

You are accessing an image analysis script coded in MATLAB that is used to analyze fluorescent microscopy images with up to three channels. The script identifies shapes and cells of a certain area through edge detection and then quantifies the mean pixel intensity, area of shape, and max pixel intensity. These values are saved in a text file and uploaded to the folder designated in the pathway on line 4. 

**Use Instructions**

To use this script, insert the pathway to the folder with your images on line 4. Next, designate an identifier of the image names. This is important if you have multiple treatment images but only want to analyze one at a time. For example, the words “ZT20” are input on line 6 to tell the script to only analyze images in the designated folder with “ZT20” in the file name. Lastly, update the number of channels used in your fluorescent images. This script can run up to 3 channels, but is set on line 7 as an example to run only 2 channels. Finally, update the cell size area to accommodate your cell size. For our use with macrophages, our cell area was able to capture almost all cells in an image but cannot discriminate single cells due to the identification method of edge detection. This is something you can troubleshoot as you use this script and watch it choose your cells. A smaller area range will bias the script towards single cells not touching anything else in the image, whereas a larger area will allow the script to pick up single cells and groups of touching cells. The current setup of this script is for images from Zeiss confocal microscopes that have images saved as ".lsm" files. This designation can be changed for your own use, like for instance, changing the designation to ".tif" files. 


**If you use this script, make sure to cite us!**


**Citation**: Clark GT, Yu Y, Urban CA, Fu G, Wang C, Zhang F, et al. (2022) Circadian control of heparan sulfate levels times phagocytosis of amyloid beta aggregates. PLoS Genet 18(2): e1009994. https://doi.org/10.1371/journal.pgen.1009994
