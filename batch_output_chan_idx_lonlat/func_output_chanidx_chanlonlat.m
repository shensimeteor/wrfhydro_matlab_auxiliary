function func_output_chanidx_chanlonlat(ncfile, lon_limit, lat_limit, out_dom_name, output_dir)
    %ncfile='201706192300.CHRTOUT_DOMAIN1.nc';
    lon=(ncread(ncfile,'longitude'));
    lat=ncread(ncfile,'latitude');
    idx=[1:length(lon)]';

    %lon_limit=[113.753, 113.896];
    %lat_limit=[22.666,22.795];
    %out_dom_name='BAB';

    iidx=find(lon > lon_limit(1) & lon < lon_limit(2) & ...
          lat > lat_limit(1) & lat < lat_limit(2));
    lonx=lon(iidx);
    latx=lat(iidx);
    idxx=idx(iidx);

    file_nodeidx=[output_dir, '/nodeidx_', out_dom_name,'.txt'];
    file_nodelonlat=[output_dir, '/', out_dom_name, '_channode_lonlat.txt'];

    fid=fopen(file_nodeidx,'wt'); %idx starting with 0
    for i=1:length(idxx)
        fprintf(fid, '%d\n', idxx(i)-1);
    end

    %print nodes' lon,lat out
    fid=fopen(file_nodelonlat,'wt');
    for i=1:length(idxx)
        fprintf(fid, '%f,%f\n', lonx(i),latx(i));
    end
end

