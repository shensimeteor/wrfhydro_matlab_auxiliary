%read subdom_definitions.txt,
ncfile='201802062200.CHRTOUT_DOMAIN1'
domfile='subdom_definitions.txt';
fid=fopen(domfile, 'r');
xcell=textscan(fid, '%s%s%f%f%f%f', 'Delimiter',',','EmptyValue',-Inf);
domID=xcell{2};
lon_limit1=xcell{3};
lon_limit2=xcell{4};
lat_limit1=xcell{5};
lat_limit2=xcell{6};
ndom=length(domID)
domID
lon_limit1
output_dir='./output/';

for i=1:ndom
    domID{i}
    [lon_limit1(i), lon_limit2(i)]
    [lat_limit1(i), lat_limit2(i)]
    func_output_chanidx_chanlonlat(ncfile, [lon_limit1(i), lon_limit2(i)], [lat_limit1(i), lat_limit2(i)], domID{i}, output_dir);
end
