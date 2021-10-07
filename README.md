# fluorescent_image_analysis


**General Information**

You are accessing an image analysis script coded in MATLAB that is used to analyze fluorescent microscopy images with up to three channels. The script identifies shapes and cells of a certain area through edge detection and then quantifies the mean pixel intensity, area of shape, and max pixel intensity. These values are saved in a text file and uploaded to the folder designated in the pathway on line 4. 

**Use Instructions**

To use this script, insert the pathway to the folder with your images on line 4. Next, designate an identifier of the image names. This is important if you have multiple treatment images but only want to analyze one at a time. For example, the words “ZT20” are input on line 6 to tell the script to only analyze images in the designated folder with “ZT20” in the file name. Lastly, update the number of channels used in your fluorescent images. This script can run up to 3 channels, but is set on line 7 as an example to run only 2 channels. Finally, update the cell size area to accommodate your cell size. For our use with macrophages, our cell area was able to capture almost all cells in an image but cannot discriminate single cells due to the identification method of edge detection. This is something you can troubleshoot as you use this script and watch it choose your cells. A smaller area range will bias the script towards single cells not touching anything else in the image, whereas a larger area will allow the script to pick up single cells and groups of touching cells. 


**If you use this script, make sure to cite us!**


**Citation**: Circadian Control of Heparan Sulfate Levels Times Phagocytosis of Amyloid Beta Aggregates
Gretchen T Clark, Yanlei Yu, Cooper A Urban, Guo Fu, Chunyu Wang, Fuming Zhang, Robert J Linhardt, Jennifer Marie Hurley
bioRxiv 2021.05.04.442651; doi: https://doi.org/10.1101/2021.05.04.442651
