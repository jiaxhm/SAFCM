# Super-Aware Fuzzy C-Means Clustering for Hyperspectral Image Segmentation


Abstract—The unsupervised fuzzy c-means clustering algorithm has been extensively and
successfully applied in hyperspectral image (HSI) analysis for several decades.
 However, HSI contains a broad spectral range and complex spatial structures,
 resulting in a diverse pixel distribution. Consequently, traditional variations of
 fuzzy c-means clustering suffer from low segmentation accuracy. To address this
 issue, we propose super-aware fuzzy c-means clustering (SAFCM) for HSI segmen
tation, which innovatively integrates superpixel generation and segmentation into
 a single objective function. The SAFCM utilizes a spatial distance that combines
 color intensity and corresponding position coordinates to generate superpixels,
 which enhances the regularity of superpixels and improves immunity to cluttered
 pixels. Subsequently, the SAFCM employs superpixel features and corresponding
 histogram information for target segmentation, which accelerates the clustering
 process and refines segmentation accuracy. To validate the efficiency and effec
tiveness of the SAFCM, we conduct experiments on HSI data sets. These results
 demonstrate that the SAFCM outperforms current state-of-the-art methods.

<img width="3685" height="1545" alt="Fig1" src="https://github.com/user-attachments/assets/1f13a9ee-de94-4a53-94bb-86924615e42a" />
Fig. 1 The framework of SAFCM incorporates superpixel generation and segmentation for HSI.

In this paper, we apply a simple yet very effective principal component analysis (PCA) to extract the most representative bands of HSI, maximizing the total vari
ance and revealing intrinsic low-dimensional features. The PCA considers only the spectral signature of each pixel, whereas the FCM variant focuses exclusively on local differences. To address this limitation, we propose a super spatial perceptive strategy to improve classification accuracy. Fig. 1 shows the schematic of super-aware fuzzy c means clustering (SAFCM) applied to the first three principal components (3 PCs) of HSI.

**# 📚 Cite Us

✨ Please cite us if this work is helpful to you 

```bibtex
@ARTICLE{
  author={Xiaohong Jia, Yonghui Li, Yunchao Wei, Yao Zhao, and Wenwen Chang.},
  journal={International Journal of Fuzzy Systems}, 
  title={Super-Aware Fuzzy C-Means Clustering for Hyperspectral Image Segmentation}, 
  keywords={Fuzzy c-means clustering, Hyperspectral image, Superpixels, Segmentation},
  doi={}}
**
