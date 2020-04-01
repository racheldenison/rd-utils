% rd_quickGabor.m

ppd = 100;
sz = 2;
sf = 3;
tilt = 0;
phase = 0;
contrast = 1;
sd = 0.3;

g = rd_grating(ppd,sz,sf,tilt,phase,contrast);
im = rd_aperture(g,'gaussian',sd*ppd);

figure
imshow(im)