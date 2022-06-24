# for sub in '01' '02' '03' '04' '09' '11' '12' '17' '18'
for sub in 19 20 21 22
do
    for hemi in 'lh' 'rh'
    do
        n_nodes=$(SurfInfo -N_Node -spec sub-${sub}/sub-${sub}_${hemi}.spec -surf_A ${hemi}.inflated.gii)
        printf "Sub-%s %s %s\n" "$sub $hemi $n_nodes"
        n_nodes=${n_nodes##*=}
        n_nodes=$((n_nodes-1))
        ROI2dataset -prefix sub-${sub}_${hemi}_v1 -pad_to_node ${n_nodes} -input sub-${sub}/sub-${sub}_${hemi}_v1.1D.roi
        SurfMeasures -info_area -func n_area_A -spec sub-${sub}/sub-${sub}_${hemi}.spec -surf_A ${hemi}.smoothwm.gii -cmask "-a sub-${sub}_${hemi}_v1.niml.dset -expr step(a)" -out sub-${sub}_${hemi}sm.niml.dset | grep total | sed "s/-- total area 0 = /sub-${sub}: ${hemi}: /" >> out_file.txt
    done
done

SurfInfo -N_Node -spec sub-01/sub-01_lh.spec -surf_A lh.inflated.gii
ROI2dataset -prefix sub-01_lh_v1 -pad_to_node 136214 -input sub-01/sub-01_lh_v1.1D.roi
SurfMeasures -info_area -func n_area_A -spec sub-01/sub-01_lh.spec -surf_A lh.smoothwm.gii -cmask "-a sub-01_lh_v1.niml.dset -expr step(a)" -out sub-01_lh_sm.niml.dset

# SurfMeasures -info_area -func n_area_A -spec sub-01/sub-01_lh.spec -surf_A lh.smoothwm.gii -cmask "-a sub-01_lh_v1.niml.dset -expr step(a)" -out sub-01_lh_sm.niml.dset | grep total | sed "s/-- total area 0 = /sub-01: lh: /" >> out_file.txt

# SurfInfo -N_Node -spec sub-01/sub-01_lh.spec -surf_A lh.inflated.gii
# ROI2dataset -prefix sub-01_whole_lh -pad_to_node 136214 -input sub-01/sub-01_whole_lh.1D.roi
# SurfMeasures -info_area -func n_area_A -spec sub-01/sub-01_lh.spec -surf_A lh.smoothwm.gii -cmask "-a sub-01_whole_lh.niml.dset -expr step(a)" -out sub-01_whole_lh_measured.niml.dset
