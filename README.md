## Links
[Schwarzkopf 2011](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3012031/)
[Schwarzkopf 2011 supplemental](https://static-content.springer.com/esm/art%3A10.1038%2Fnn.2706/MediaObjects/41593_2011_BFnn2706_MOESM19_ESM.pdf)

## Stimuli
### Localizer
- Faces, hands, string instruments to localize FFA

## Data acquisition
- Details in [this word document.](https://github.com/dafrius/v1_size_measurement/blob/main/umut_v1_size_methods.docx)

## Preprocessing
We use fMRIPrep to do all the preprocessing: See [fMRIPrep
home](https://fmriprep.org/en/stable/) and [the paper in nature methods
](https://www.nature.com/articles/s41592-018-0235-4)

### Anatomical
We keep things in the native space, no warping.
1) Correcting for intensity/nonuniformity (where is too bright/dark, etc.)
2) Remove the skull 
3) Segmentation (labeling what part is grey, white matter or CSF)
  - we expect BOLD to be in the grey matter, not in the white or CSF
  - gives us the mesh(surface) that we would paste the functional data on. 

### Functional
1) Remove the skull
2) Motion Estimation/Correction
3) Slice-time correction (because we skip a slice when we go one by one, 
and we want to think of the whole volume as a single point in time)

[BrainVoyager SliceTime explanation](https://www.brainvoyager.com/bv/doc/UsersGuide/Preprocessing/SliceScanTimeCorrection.html)

### Combination of Anatomical & Functional
1) First few volumes (averaged together into a single volume) aligned to 
the anatomical scan. Gives a rule of where a voxel in functional would go
in the anatomical.
2) Re-sample the functional data into native space (taking into account the
motion estimates).

### Retinotopy
[Details can be found from the psychopy code in this retinotopy](https://github.com/Goffaux-Lab/psychopy-retinotopy)

3 Runs:
Contrast reversing checkerboards 4 Hz (standard V1 driving speed).
12 second baseline at the beginning & end of each run
Spider-web like fixation point.
Task is whenever the fixation point changed from red to blue, they had to 
press a button.
1) Combined Polar angle(wedges) + Eccentricity rings
    - Counter-clockwise starting at 3 o'clock, 6 times, 42.6667 seconds per
      revolution.
    - Eccentricity - 5 times, full expansion takes 51.333 seconds 
    - 6 * 42.6667 ~= 5 * 51.333
2) Bars
    - 20 seconds per sweep
    - 8 angles * 2 (two directions)
3) Bars (again)


Size of the wedge, width, etc..

## PRF Model Fitting
[Details can be found from the matlab code in this repository](https://github.com/Goffaux-Lab/matlab-fmri-libraries)

De-trending for fixing the slow-drift, details

[Slow-drift explanation](https://www.brainvoyager.com/bv/doc/UsersGuide/Preprocessing/TemporalHighPassFiltering.html)

Output is the volume map
Looking at the best pRF model, tells how eccentric that voxel was, etc..

Using the map, we draw the borders of V1

## Measurement, V1 Size

### Drawing an ROI
1) We first load an inflated brain in Suma (anatomical):

```
suma -i_fs lh.inflated (or rh)
```

2) In suma, we load a functional dataset onto the inflated brain.

- Ctrl+S -> load dataset

- e.g., analysis-eva/sub-*/pa_from_pRF_paecc_bars_bars_lh.gii
- or retmaps/pa_from_pRF_paecc_bars_bars_lh.gii

- Unselect "sym" (symmetrically modifying the threshold)

- Change threshold to something sensible (between 20-160)

- Press * to smooth (e.g. 2)

3) We start drawing after doing the above steps.

- Ctrl+D opens the drawing box

    - shift+arrow moves the brain

- Select the pen

- Draw around the blob

- Click "Join"

- Left mouse click on the blob

- Change niml to 1D

- Save ROI

Now we have a V1 drawn using the functional data.

File names look like this:

```
sub-**_lh_v1.1D.roi 

sub-**_rh_v1.1D.roi
```


### Measurement 

We need a few AFNI commands for measurement.

Main ones will be:

- ROI2dataset

- SurfInfo

- SurfMeasures

*These are bash commands that need to be run directly from terminal*

#### Conversion to dset

We first convert the ROI to a dataset that covers the whole brain surface with
ROI2dataset command.

We will need certain files that are output from the scans for this operation:

```
sub-**_lh.spec (or rh)

lh.inflated.gii (or rh)

sub-**_lh_v1.1D.roi (or rh)
```

In order to do the conversion, we need to obtain the total number of nodes on
the full hemisphere surface 

We do so with this command:

```
SurfInfo -N_Node -spec sub-**_lh.spec -surf_A lh.inflated.gii
```

This gives us an N_Node. We take N_Node minus 1 (N_node-1) and put it in this
command:


```
ROI2dataset -prefix testroi(this name can be changed) -pad_to_node N_Node-1 -input sub-**_lh_v1.1D.roi
```

Now we have a converted dataset file which can be used by SurfMeasures command

#### Getting the measurement

SurfMeasures gives us the measurement.
This command requires following files in the same folder:

- sub-**_lh.spec (or rh.spec)

- lh.smoothwm.gii (or rh.smoothwm.gii)

- lh.aparc.a2009s.annot.niml.dset (or rh)

- the converted dset file from the previous step (e.g., testroi.niml.dset)

Finally, with these files, we can now run the following command:

```
SurfMeasures -info_area -func n_area_A sub-**_lh.spec -surf_A lh.smoothwm.gii -cmask '-a testroi.niml.dset -expr step(a)' -out testsm.niml.dset | grep total | sed 's/-- total area 0 = /sub-**: lh: /' >> out_file.txt
```

the name of the output file can be changed (-out filename.niml.dset)
and the output of the surface area is shown in the command line when you run
this command

This operation can also be looped through all your participants for hassle-free
processing. For that, see [this bash script.](https://github.com/dafrius/v1_size_measurement/blob/main/measure_loop.sh)

The output file would include the left and right hemisphere V1 sizes for each
subject, in mm^2.
