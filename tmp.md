Methods 

Subjects 

Eighteen healthy subjects (age 25.1 ± 3.28, 5 males) completed three scanning
sessions. Two subjects were excluded from data analysis: one due to
inattentiveness and motion in the scanner, the second due to wrong scanner
settings. Before scanning, we tested the acuity of the subjects with the
Freiburg Visual Acuity and Contrast Test (FrACT), which revealed all subjects
had normal or corrected-to-normal vision (LogMar mean = -0.01 ± 0.11, decVA =
1.08 ± 0.39). All subjects but one reported being right-handed as measured with
the Edinburgh handedness Questionnaire (82.9±17.3; Oldfield, 1971). 

Stimuli 

Each subject performed the main experiment as well as a functional localiser to
delineate the face-specialised voxels in the ventral pathway at the individual
level. For both the localiser and main experiment, the stimuli were presented
with PsychoPy v3.2.4 on an NNL LCD Monitor (32-inch, 1920 x 1080 pixels, 698.40
x 392.85 mm, refresh rate = 60 Hz) situated at the end of the scanner bore.
Subjects viewed the stimuli via a mirror attached to the head-coil, at a
viewing distance of 175cm. Across experiments, all images were attributed a
mean (i.e., the global luminance) and RMS contrast of 0.45±0.1. Both the main
experiment and the functional localiser had a block design. 

Main experiment 

We generated the main experimental stimuli based on 20 full-front greyscale
photographs of unfamiliar human faces (10 male). Models were young adult alumni
students (aged 18–25 years) of the Université Catholique de Louvain (Belgium),
who gave written consent for the usage of their image (Laguesse, Dormal,
Biervoye, Kuefner, & Rossion, 2012). All faces were 367 pixels in height and
267 pixels in width and subtended a visual angle of 4.37° x 3.18°. To avoid the
potential clipping of extreme intensity values in the image, we rescaled its
luminance so that pixel values were between 0.1 and 0.9. Image luminance was
then normalised (mean of zero and root mean square [RMS] contrast of 1). Next,
faces were centred on a uniform grey background of 550 x 550 pixels (6.54° x
6.54° of visual angle). 

Each face appeared in a natural, contrast negated, and a phase-scrambled
version. Contrast negation impedes the involvement of high-level face-selective
regions despite largely preserving image properties (i.e., edges, shapes,
luminance, contrast, orientation, and SF content; George et al., 1999; Yue,
Nasr, Devaney, Holt, & Tootell, 2013), it is therefore used here as a way to
modulate activity in high-level visual cortex. Negated faces were created by
subtracting face pixel values from 1.  

As a control, we also presented the faces in a phase-scrambled version. Phase
scrambling preserves the amplitude spectrum of the original image but disrupts
shape and edge information and thus minimises the recruitment of high-level
ventral regions in general (Grill-Spector et al., 1998). We scrambled images by
randomising their phase structure in the Fourier domain using a custom MATLAB
function. Since manipulations in the Fourier domain operate on the whole image
(face and background), the presence of a uniform background artificially
increases the LSF energy of scrambled images. In order to minimise
contamination of the phase-scrambled image by its originally uniform
background, we used iterative scrambling (as in Jacobs, Petras, Moors, &
Goffaux, 2020; Petras, Ten Oever, Dalal, & Goffaux, 2021; Petras, Ten Oever,
Jacobs, & Goffaux, 2019). Iterative scrambling consists of generating a first
scrambled version of the face image, superimposing the original face back onto
the scrambled image, scrambling this new image again, and repeating this
process multiple times (here n=500). The iterative scrambling procedure results
in an image in which the background and face shared similar spectral
properties. We used iterative phase scrambling not only to generate the
scrambled versions of the face stimuli (n=20) but also the masks (n=40) and the
stimulus backgrounds (n=10).  

We multiplied all stimuli and masks with a face-shaped aperture. Borders of
this aperture gradually transitioned from 1 to 0 to avoid edge artefacts. A
complementary aperture was multiplied with the scrambled background (see below)
to avoid an increase of contrast in the transition region.  

In a block, all stimuli were alpha-blended with a stable phase-scrambled
background in order to avoid abrupt stimulus on- and offset and ascertain a
smooth transition between trial events within a block. There were 20 blocks per
condition, the 10 phase-scrambled backgrounds were repeated twice in each
condition. Alpha blending creates a weighted sum of the luminance values of the
stimuli and the scrambled backgrounds (a weight of .45 for stimulus and .55 for
background) while maintaining mean luminance and contrast at .45 and -.1,
respectively. The moderate RMS contrast of the stimuli and their reduced weight
in the final alpha-blended stimulus hindered visibility, which was done on
purpose to stimulate recurrent processing (Hupe et al., 1998). Thus, the
resulting stimulus contained a face embedded in the phase-scrambled background
(see Ales, Farzin, Rossion, & Norcia, 2012 see Figure 2).  

 

￼ 

Figure 2. Alpha blending 

 

In contrast to the stimuli, the masks were superimposed on the background
without alpha blending to ensure strong masking of the SF range it contains.
Each stimulus (natural, negated, or scrambled face) appeared for either 50, 83,
100, or 150ms on a scrambled background, then masked by a scrambled mask for
166ms, and finally the screen went back to only the scrambled background. Event
durations were multiples of the frame rate. The scrambled masks were filtered
to selectively contain either LSF or HSF, in order to selectively interfere
with LSF or HSF processing, respectively. In order to restrict mask image
content to either LSFs or HSFs, we used 2nd order Butterworth filters with
filter cut-offs so that four octaves were preserved for both SFs, without any
gap between the two SF cut-offs (LSF: 0.7168 - 11.4688cpi, HSF: 11.4688 -
183.5cpi).  

Functional localiser 

Stimuli for the localiser experiment consisted of three image categories
(faces, hands, instruments) each containing 20 greyscale images (See
Supplementary material 1; Stigliani, Weiner, & Grill-Spector, 2015) and their
phase-scrambled counterparts. The photographs of unfamiliar faces (10 males)
included hair and were of various viewpoints, the isolated hands had various
poses, and the instruments were photographs of stringed instruments (e.g.
guitar, cello, lute, etc), positioned in different orientations on the Fourier
phase-scrambled backgrounds (procedure as described above). 

Page Break
 

Procedure 

All subjects participated in 20 experimental runs divided over 3 scanning
sessions. The first session included a T1-weighted anatomical scan and the
second session a functional face localising run. All functional runs had a
block design, of 10-second blocks, alternated by 10 seconds of fixation with a
12-second fixation period at the beginning and end of the run.  

To ensure subjects paid attention during functional runs, we instructed them to
detect a rare and brief colour change of the stimulus by pressing a button with
the right index finger. In each block, there were two targets (red during the
main experimental runs: HSV profile = 0.8, 1.0, 1.0, blue during the localiser
run: HSV profile 1.0, 1.0, 0.8). One colour change occurred per block half, but
never during the first stimulus of a block. A fixation cross, made of two thin
black lines that connected opposite corners of the square stimuli, was visible
throughout all runs. Subjects had to fixate on its centre at all times. 

Main experiment 

In each 8.7-minute run (see Figure 3), there were 24 experimental conditions
and two retinotopic mapping conditions. The order of experimental blocks was
randomised with the constraint that a condition did not follow any particular
condition more than three times during the course of the experiment. The
retinotopic mapping conditions at the end of every run consisted of 4Hz
contrast-reversing checkerboard stimuli confined to the region where the face
appeared in the other conditions, followed by a block of flashing checkerboards
covering the peripheral area around the central face patch. This was to
localise the region of EVC responding to the stimulus region containing the
face rather than the background. 

Each block contained 20 stimulus trials and four pseudo trials (in which the
background persisted, but no face or mask was presented), each with a duration
of 417ms (25 frames at 16.67ms per frame). Two pseudo trials appeared randomly
during the first half of a block, and another two during the second half. These
were included to make the appearance of the stimuli less predictable for the
visual system. The other 20 trials contained stimuli from the same experimental
condition. The order of the 20 stimulus trials in a block was randomised with
the constraint that each trial was equally likely to appear at the beginning,
middle and end of the block. 

A stimulus trial consisted of a face stimulus presented for either 50, 83, 100
or 150ms, followed by a 166ms mask, after which only the background remained
until the end of the trial (see Figure 4). 

￼ 

Figure 3. Design of experimental runs 

￼ 

Figure 4. Trial procedure 

Functional localiser 

To localise brain regions responding more to faces than non-face objects, we
used a functional face-localiser. Subjects viewed grayscale images of either
intact or scrambled faces, hands or instruments. Images from all categories
were presented in 36 blocks in total, with 6 blocks per condition. A condition
was never repeated twice in a row and the order of conditions was
counterbalanced across subjects. A block consisted of 10 images in a random
order, all images were repeated three times during the whole localiser run.
Each image appeared for 500ms, followed by a 500ms interstimulus interval. 

Page Break
 

MRI acquisition 

Subjects were scanned in a 3Tesla GE Signa Premier MRI scanner with a 48ch head
coil, based at Cliniques Universitaires UCL Saint-Luc in Brussels. As
anatomical references, whole-brain T1-weighted images were obtained during both
sessions (3D MP-RAGE, 1 x 1 x 1 mm, FOV = 256 mm, TI = 900ms, FA = 8°).
Functional T2*-weighted GE echo-planar imaging was used to obtain the blood
oxygen level-dependent (BOLD) signal as an indirect measurement of neural
activity. Thirty-two 2.4-mm axial slices were acquired (2.4mm isotropic, FOV =
240mm, TR = 2000ms, TE = 30ms, FA = 90°). 

Preprocessing 

Functional and anatomical data were organised into the Brain Imaging Data
Structure (K. J. Gorgolewski et al., 2016). Pre-processing of the data was
carried out with fMRIPrep 20.1.1 (Esteban et al., 2018; Esteban et al., 2019),
which is based on Nipype 1.5.0 (K. Gorgolewski et al., 2011; K. J. Gorgolewski,
Nichols, Kennedy, Poline, & Poldrack, 2018). To ensure reproducibility using
the specific software versions for fMRIPrep and all its dependencies it was
executed via its Docker container (Merkel, 2014). 

Anatomical data pre-processing.  

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

Functional data pre-processing.  

For each of the 24 functional runs per subject (across all tasks and sessions),
the following pre-processing was performed. First, to generate a functional
reference, volumes with substantial T1w contrast derived from nonsteady states
of the scanner (volumes at the beginning of EPI sequence) were identified,
realigned, and averaged. After skull-stripping of the functional reference
volume, head motion parameters with respect to the functional reference
(transformation matrices, and six corresponding rotation and translation
parameters) were estimated (Jenkinson, Bannister, Brady, & Smith, 2002; mcflirt
- FSL 5.0.9). On average, the maximum movement was 1.7±0.32mm. 

After correcting for slice timing (Cox & Hyde, 1997; 3dTshift from AFNI
20160207), the functional reference was co-registered to the T1w reference
using boundary-based registration (bbregister, FreeSurfer; Greve & Fischl,
2009). Since the volumes are within the same subject, co-registration was
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

Regions of interest 

￼￼￼￼The regions of interest (ROIs) in EVC were delineated based on anatomical
landmarks and functional data. We first localised V1 anatomically based on
Freesurfer atlas. Next, we selected the voxels showing a significantly stronger
response to the central stimulus than to its background. To do so, we
contrasted the responses to the flickering checkerboard block at the end of
every run: [stimulus- background] (see Figure 5a). The voxels from this
contrast that fell within the V1 border (Figure 5b), were defined as the V1 ROI
in the current study (Figure 5c). On average, more voxels were selected in the
left (155±53) hemisphere, compared to the right (144±65). 

 The FFA, responding preferentially to faces, was identified independently for
each subject, based on the localiser scan. First, to select the brain regions
more responsive to faces than non-face objects we computed the conjunction
between [intact faces - intact hands] and [intact faces - intact instruments]
contrasts. Next, to exclude activity to low-level image properties we selected
the voxels that showed a significantly larger response to intact than scrambled
faces [intact face - scrambled face]. Significant voxel clusters on t maps were
selected at a q[false discovery rate, FDR] < 0.01. After visual inspection, the
threshold for some subjects was set more restrictive to delineate between face
preferring clusters. Overall, there were more face-selective voxels in the
right FFA (143±104) compared to the left (108±93).  

 

Page Break
 

Statistical Analyses 

Univariate main analysis.  

Individual beta weights were estimated for each condition of the SF experiment
from each average ROI time-courses (left and right V1 and FFA). To target the
activity for face processing, and not visual processing in general, we
contrasted [intact – scrambled] for every condition. These contrasts were fed
into a second-level analysis. V1 was the most important ROI for our hypotheses.
The same analysis in FFA served as a comparison. 

In the second-level analysis, we used a Linear Mixed effects Model (LMM)
approach to fit the contrasted beta-values from the first-level GLM, with fixed
effects of stimulus type, duration, SF, hemisphere and their interactions.
Global variability between subjects was accounted for by modelling subject as a
random effect (allowing individuals to have their own intercept about the group
mean). For model fitting, we started with the most complex model, including all
interaction terms and we removed the non-significant four, three, and two-way
interactions one by one to find the simplest model possible and maximise power
in the analysis (for details, see Supplementary material 3). Hemisphere did not
show any significant effects in any of the models, so we collapsed the data
from the two hemispheres. The final model for V1 included a two-way interaction
term of SF and stimulus type, as well as of duration and SF (BIC = 118624.6).  

betavalue ~ 1 + sf * stimtype + duration * sf + (1 | subject) 

For the analysis in FFA the final model included two-way interaction term of
duration with stimulus type, and of duration with SF (BIC = 107475). 

betavalue ~ 1 + duration * stimtype + duration * sf + (1 | subject) 

To interpret the estimated means we used the “stats” library to run a Type III
ANOVA using Satterthwaite’s method for degrees of freedom. 

Page Break
 

Exploratory analyses. 

Whole-brain analysis. 

We ran a whole-brain univariate analysis to identify which regions behaved
similarly to V1 and FFA. 

For each subject we transformed the first-level estimate maps [intact -
scrambled] for each condition into standard MNI152NLin2990c space with a
resolution of 2mm3 using ANTs (antsApplyTransforms) employing the BSpline
interpolation method. After the transformation, we smoothed the data with a
gaussian kernel (FWHM = 8mm) using the fslmaths command.  

For every voxel, we fit the following LMM (using R): 

betavalue ~ 1 + duration * sf * stimtype + (1 | subject) 

We adjusted p-values for multiple comparisons using FDR correction (in R, using
the p.fdr function from the FDRestimation package with adjust.method=“BH”).  

 

Psychophysiological Interaction 

To explore whether the activity between V1 and FFA is coupled more strongly
during some conditions compared to others (psychological context), we conducted
a psychophysiological interaction (PPI) analysis. The average time-series of
the V1 ROI was used as the seed and was extracted using fslmeants to form a
physiological regressor. A psychological regressor was created for each
condition by convolving a double gamma HRF with the task regressor. The
multiplication of the physiological with the psychological regressors formed
the PPI regressors (one per condition). We also included 6 motion regressors in
the model. Functional connectivity for PPI contrasts of interest for each
condition [intact – scrambled] were calculated for each voxel. 
