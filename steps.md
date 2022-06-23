[fMRIPrep home](https://fmriprep.org/en/stable/)
[fMRIPrep nature methods paper](https://www.nature.com/articles/s41592-018-0235-4)

## Stimuli
### Localizer *
- Faces, hands, string instruments to localize FFA

## Data acquisition
- in the document, umut_v1_size_methods.docx

## Preprocessing
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
    [Slow-drift explanation](https://www.brainvoyager.com/bv/doc/UsersGuide/Preprocessing/TemporalHighPassFiltering.html)

### Combination of Anatomical & Functional
    1) First few volumes (averaged together into a single volume) aligned to 
    the anatomical scan. Gives a rule of where a voxel in functional would go
    in the anatomical.
    2) Re-sample the functional data into native space (taking into account the
    motion estimates).

### Retinotopy

- 3 Runs:
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


    # Size of the wedge, width, etc..
*Pull the code from lab-github into this folder.

## PRF Model Fitting
    1) De-trending for fixing the slow-drift

In the repository called matlab/fmri library
*Pull the code from lab-github into this folder.

Output is the volume map
Looking at the best pRF model, tells how eccentric that voxel was, etc..

Using the map, we draw the borders of V1

## Measurement, V1 Size









