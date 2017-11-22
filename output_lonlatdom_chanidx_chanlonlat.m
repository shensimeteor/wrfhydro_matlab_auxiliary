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

file_nodeidx=['nodeidx_', out_dom_name,'.txt'];
file_nodelonlat=[out_dom_name, '_channode_lonlat.txt'];

fid=fopen(file_nodeidx,'wt'); %idx starting with 0
for i=1:length(idxx)
    fprintf(fid, '%d\n', idxx(i)-1);
end

%print nodes' lon,lat out
fid=fopen(file_nodelonlat,'wt');
for i=1:length(idxx)
    fprintf(fid, '%f,%f\n', lonx(i),latx(i));
end

