# Methods
The MRI data used for nine of the subjects in this project comes from a
different project which involved a total of 20 experimental runs divided over 3
scanning sessions. The first session included a T1-weighted anatomical scan and
the second session a functional face localising run. Thereafter identical
retinotopy and localiser scans were collected in a single session on further
four subjects. Below we omit the details of the unused runs collected in the
original project. 

## Subjects
13 healthy subjects (age 26.4 ± 3.4, four males) completed three
scanning sessions. **X** subjects were excluded from data analysis. Before
scanning, we tested the acuity of the subjects with the Freiburg Visual Acuity
and Contrast Test (FrACT), which revealed all subjects had normal or
corrected-to-normal vision (LogMar mean = -.04 ± .14 decVA = 1.21 ± .34). All
subjects reported being right-handed as measured with the Edinburgh handedness
Questionnaire (**X** ± **X**; Oldfield, 1971).

## Stimulus presentation
Each subject performed the main experiment as well as a functional localiser to
delineate the face-specialised voxels in the ventral pathway at the individual
level. For both the localiser and main experiment, the stimuli were presented
with PsychoPy v3.2.4 on an NNL LCD Monitor (32-inch, 1920 x 1080 pixels, 698.40
x 392.85 mm, refresh rate = 60 Hz) situated at the end of the scanner bore.
Subjects viewed the stimuli via a mirror attached to the head-coil, at a
viewing distance of 175cm.

## Retinotopic stimuli and procedure
All functional runs included a 12 second baseline at the beginning and end.
The retinotopic mapping stimuli were high contrast checkerboard patterns on a
gray background presented on a screen at the back of the bore and viewed by
means of a mirror on the headcoil. Stimuli subtended a radius of 6.4° of visual
angle from fixation and reversed contrast polarity at a temporal frequency of
~4Hz. In all functional runs, subjects were instructed to fixate at a small red
central cross at all times. The subjects' task was to indicate with a button
press when the cross rotated by 45°). To further aid in fixation, the grey
background included a 'spider-web' pattern.

In the first run (lasting 280 secs) there was a simultaneous presentation of a
smoothly counter-clockwise rotating wedge (45° width, 6 rotation cycles at a
frequency of 42.67 secs) and a ring that expanded outward (the outer radius was
1.5 times the inner radius, 5 expansion cycles at a frequency of 51.333 secs).
The size of checkerboards for this run logarithmically increased with
eccentricity.


![pa_ecc](https://github.com/Goffaux-Lab/psychopy-retinotopy/blob/master/images/pa_ecc_ex.png
)

In the next two runs, (each lasting 344 secs) we presented 16 smoothly sweeping
bar stimuli (1.6° wide, sweep frequency of 20 secs) which swept from one side
of the screen to the other along eight equally spaced radial axes (once in one
direction, once in the other). The size of the checkerboards in these runs was
uniform (~0.53°).

![bar_ex](https://github.com/Goffaux-Lab/psychopy-retinotopy/blob/master/images/bar_ex.png)

## MRI acquisition
Subjects were scanned in a 3Tesla GE Signa Premier MRI scanner with a 48ch head
coil, based at Cliniques Universitaires UCL Saint-Luc in Brussels. As
anatomical references, whole-brain T1-weighted images were obtained during the
first sessions (3D MP-RAGE, 1 x 1 x 1 mm, FOV = 256 mm, TI = 900ms, FA = 8°).
Functional T2\*-weighted GE echo-planar imaging was used to obtain the blood
oxygen level-dependent (BOLD) signal as an indirect measurement of neural
activity. Thirty-two 2.4-mm axial slices were acquired (2.4mm isotropic, FOV =
240mm, TR = 2000ms, TE = 30ms, FA = 90°).

## Preprocessing
Functional and anatomical data were organised into the Brain Imaging Data
Structure (K. J. Gorgolewski et al., 2016). Pre-processing of the data was
carried out with fMRIPrep 20.1.1 (Esteban et al., 2018; Esteban et al., 2019),
which is based on Nipype 1.5.0 (K. Gorgolewski et al., 2011; K. J. Gorgolewski,
Nichols, Kennedy, Poline, & Poldrack, 2018). To ensure reproducibility using
the specific software versions for fMRIPrep and all its dependencies, it was
executed via its Docker container (Merkel, 2014). 

### Anatomical data pre-processing 
Each T1-weighted (T1w) volume was corrected for intensity non-uniformity
(Tustison et al., 2010; N4BiasFieldCorrection), and skull-stripping was
executed (antsBrainExtraction.shv, OASIS30ANTs template). Next, brain tissue
segmentation of cerebrospinal fluid (CSF), white-matter (WM) and grey-matter
(GM) was performed on the brain-extracted T1w (using fast from FSL 5.0.9;
Zhang, Brady, & Smith, 2001). Finally, brain surfaces were reconstructed (using
recon-all from FreeSurfer 6.0.1; Dale, Fischl, & Sereno, 1999), and the brain
mask estimated previously was refined with a custom variation of the method to
reconcile ANTs-derived and FreeSurfer-derived segmentations of the cortical
grey-matter of Mindboggle (Klein et al., 2017).

### Functional data pre-processing 
For each of the functional runs per subject (across all tasks and sessions),
the following pre-processing was performed. First, to generate a functional
reference, volumes with substantial T1w contrast derived from nonsteady states
of the scanner (volumes at the beginning of EPI sequence) were identified,
realigned, and averaged. After skull-stripping of the functional reference
volume, head motion parameters with respect to the functional reference
(transformation matrices, and six corresponding rotation and translation
parameters) were estimated (Jenkinson, Bannister, Brady, & Smith, 2002; mcflirt
- FSL 5.0.9). On average, the maximum movement was **X** ± **X** mm.

After correcting for slice timing (Cox & Hyde, 1997; 3dTshift from AFNI
20160207), the functional reference was co-registered to the T1w reference
using boundary-based registration (bbregister, FreeSurfer; Greve & Fischl,
2009). Since the volumes were within the same subject, co-registration was
configured with six degrees of freedom (i.e. 3 rotations and 3 translations).

Next, all functional data were resampled onto their original, native space by
applying the transforms to correct for head-motion. Several confounding time
series were calculated based on the functional data: framewise displacement
(FD), DVARS and three region-wise global signals. FD was computed with the
absolute sum of relative motions (Power, Power et al., 2014) and the relative
root mean square displacement between affines (Jenkinson, Jenkinson et al.,
2002). FD and DVARS were calculated for each functional run, both using their
implementations in Nipype (Power et al., 2014). Frames that exceeded a
threshold of 0.5 mm FD or 1.5 standardised DVARS were annotated as motion
outliers. The three global signals were extracted within the CSF, the WM, and
the whole-brain masks.

Using FEAT (FMRI Expert Analysis Tool; Version 6.0; FMRIB's Software Library,
www.fmrib.ox.ac.uk/fsl) the functional data were smoothed in the space domain
using a Gaussian kernel of FWHM 5mm. And high-pass temporal filtering was
carried out using a Gaussian-weighted least-squares straight-line fitting
(sigma=50.0s).

## Regions of interest 

Similar to Schwarzkopf et al. (2011) the V1 region of interest was delineated
manually: The border between V1 and V2 was defined by mirror reversals in the
phase map, which correspond to the representation of the vertical and
horizontal meridians. The portion of V1 representing up to 10 visual degrees
(i.e. the full extent of the retinotopic stimulation) was defined by the band
of maximal eccentricity values, which was confirmed to follow the drop off of
model $r^2$ (indicating poor model fits where cortex was too eccentric to be
stimulated by the retinotopy sequence). The surface area of the defined region
was then determined by the SurfMeasures command provided by AFNI (Analysis of
Functional NeuroImages; Cox, 1996).

## Measurement of pRFs
We created predicted timecourse's of **X** 2D Gaussian pRF models, each model
was centered at a grid location (with a spacing of 0.2 degrees of visual angle)
and excluding those locations falling outside the circular stimulation area. At
each grid location, we included 4 models with sigmas of either 0.05, 0.3, 0.65
and 0.95 visual degrees in line with the range of V1 sigma values found by
Dumoulin and Wandell (2008). Predicted timecourses were formed by convolving a
neural timeseries with a (double gamma) haemodynamic response function. The
neural timeseries was in an identical way to Dumoulin and Wandell (2008).

Before fitting, the data were spatially smoothed using matlab's `smooth3`
function with a gaussian kernal size of 3x3x3 voxels. For each voxel, the mean
of each run was removed and the data concatenated in the time dimension before
being detrended using matlab's `detrend` function with an 8th degree
polynomial. For every voxel in the posterior lobe, we computed the correlation
between the observed timecourse and each of the predicted timecourse. The
winning model was simply the one with the highest correlation. While more
sophisticated parameter selection methods exist, we are confident that any
overfitting would not impact on the large-scale organisation of the retinotopic
maps produced from these model fits. Indeed, we observed a high level of
agreement between the borders of V1/V2 as suggested by the functional maps and
the V1/V2 border of the *Freesurfer* atlas labels fitted based on surface
curvature.

## References
Dumoulin, S. O., & Wandell, B. A. (2008). Population receptive field estimates
in human visual cortex. Neuroimage, 39(2), 647-660.

Cox, R.W. (1996). AFNI: software for analysis and visualization of functional
magnetic resonance neuroimages. Comput Biomed Res 29(3):162-173.
doi:10.1006/cbmr.1996.0014

Schwarzkopf, D.S., Song, C., Rees, G. (2011). The surface area of human V1
predicts the subjective experience of object size. Nature Neuroscience
14(1):28-30. doi: 10.1038/nn.2706. Epub 2010 Dec 5.

