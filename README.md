
# LSQR algorithm analysis and implementation for image restoration

**Description:** MATLAB implementation of the **LSQR algorithm** for the least squares problem and its **regularized variant** ($\lambda \ne 0$), applied to **blurred image restoration** (deblurring).

---

## 📝 Project Overview

This scientific computing project aims to analyze, implement, and apply the **LSQR Algorithm** (Least Squares QR) to solve least squares problems, specifically **deblurring blurry images** (image restoration).

LSQR is an iterative method chosen for its **numerical stability** and its ability to handle **large-scale** and **ill-conditioned problems** (like those arising from the discretization of convolution).

The project's key objectives are:

- **Derivation and implementation** of the standard (unregularized) LSQR Algorithm.
    
- **Formulation and implementation** of the regularized LSQR variant for the regularized least squares problem, which is essential for managing **Gaussian noise** in the data.
    
- The use of the **matrix-vector operator** via 2D convolution, avoiding the explicit construction of the (very large) blurring matrix.
    

## 📄 Scientific Report

The complete report, covering the theory, the algorithm's derivation (including the regularized variant), and the analysis of experimental results (with and without noise), is available here:

- **Report:** `Report_Progetto_Calcolo_scientifico__Algoritmo_LSQR.pdf`
    

---

## 💻 Repository Structure and Content

The repository is organized to separate source code from input/output files and documentation.

|**File/Folder**|**Description**|
|---|---|
|`Report_Progetto_...pdf`|The complete scientific project report.|
|**`hubble.tif`**|The original input image used in the deblurring experiments.|
|**`Alg_LSQR.m`**|**Implementation of the LSQR algorithm** (unregularized version).|
|**`Alg_LSQR_regolarizzato.m`**|**Implementation of the regularized LSQR variant** (accepts $\lambda$ as a third parameter).|
|**`matvec.m`**|Essential function for efficiency. Computes the products $A \mathbf{v}$ and $A^T \mathbf{v}$ via **2D convolution** (simulating the action of the blurring matrix $A$).|
|`Confronto_LSQR.m`|Example script to compare the implemented function (`Alg_LSQR`) with MATLAB's native function (`lsqr`).|
|`Replica_example.m`|Script to demonstrate the usage of `Alg_LSQR` in the basic deblurring case.|
|`Ricerca_lambda.m`|Script for finding the optimal $\lambda$ in the **ideal case** (no noise).|
|`Ricerca_lambda_con_rumore.m`|Script for finding the optimal $\lambda$ in the case with added **Gaussian noise**.|

---

## 🚀 Execution Instructions (MATLAB)

To replicate the experiments and results presented in the report, follow these steps in the MATLAB environment:

1. **Clone the Repository:**
    
    Bash
    
    ```
    git clone https://github.com/YourUsername/LSQR-Image-Restoration.git
    ```
    
2. **Set the Directory:** Open MATLAB and set the current directory to the repository's main folder.
    
3. **Run Test Scripts:**
    
    - To verify the correct functionality of the unregularized algorithm: Run `Replica_example.m`
        
    - To see the effect of regularization under noisy conditions (as shown in Figure 3 of the report): Run `Ricerca_lambda_con_rumore.m`
        

**Note:** All scripts depend on the presence of the image file `hubble.tif` and the function `matvec.m` for the convolution operator.

---

## 📜 License

This project is distributed under the **MIT License**. See the `LICENSE` file for more details.