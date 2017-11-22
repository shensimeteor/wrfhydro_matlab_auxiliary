ncfile='201706192300.CHRTOUT_DOMAIN1.nc';
lon=(ncread(ncfile,'longitude'));
lat=ncread(ncfile,'latitude');
alt=ncread(ncfile,'altitude');
order=single(ncread(ncfile, 'order'));
idx=[1:length(lon)]';

%reservoir of Tiegang + Xili 
%lon_limit=[113.7, 114.0];
%lat_limit=[22.34, 22.74];
%out_dom_name='TGXL';
%river of GuanLan
%lon_limit=[113.95,114.15];
%lat_limit=[22.6, 22.8];
%out_dom_name='GLriver';
%lon_limit=[113.75, 114.7];
%lat_limit=[22.4, 22.95];
%out_dom_name='SZarea';
lon_limit=[113.753, 113.896];
lat_limit=[22.666,22.795];
out_dom_name='BAB';

iidx=find(lon > lon_limit(1) & lon < lon_limit(2) & ...
          lat > lat_limit(1) & lat < lat_limit(2));
lonx=lon(iidx);
latx=lat(iidx);
idxx=idx(iidx);
ordx=order(iidx);
altx=alt(iidx);
length(iidx);
%output in a file
fid=fopen([out_dom_name, '_ptall.csv'],'wt+');
fprintf(fid, 'lon,lat,info\n');
for i=1:length(lonx)
    strx=sprintf('i%d-o%d-h%d',idxx(i), ordx(i), altx(i));
    fprintf(fid, '%10.6f,%9.6f,%s\n', lonx(i),latx(i),strx);
end
fclose(fid);
