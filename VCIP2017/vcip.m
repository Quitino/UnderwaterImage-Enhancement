%copyright@wendy_zhang@pku.edu.cn
%cite as:
% @INPROCEEDINGS{8305027, 
% author={W. Zhang and G. Li and Z. Ying}, 
% booktitle={2017 IEEE Visual Communications and Image Processing (VCIP)}, 
% title={A new underwater image enhancing method via color correction and illumination adjustment}, 
% year={2017},  
% pages={1-4}, 
% doi={10.1109/VCIP.2017.8305027},
% }
function out = vcip(img)
    Require VCIP
    S = im2double(img);
    S= color(S,2);
    lambda = 0.5;
    sigma = 5; 
    gamma = 0.4; 
    lab = rgb2hsv(S);
    I0 = lab( :, :, 3 ); 

    I = imresize( ours_tsmooth( imresize( I0, 0.5 ), lambda, sigma ), size( I0 ) );

    I_enhanced = max( abs( I ), 0.0001 ) .^ gamma;
    lab( :, :, 3 ) = lab( :, :, 3)./I_enhanced;
    out = hsv2rgb(lab);
end 



