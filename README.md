# SOS-counterexample
Matrices and code for verifying nonnegativity of H_44 - H_521

### Instructions

Open a project at https://cocalc.com/ for free.

You can upload the two matrix files "counterexample-A.sobj" and "counterexample-P.sobj" to your main project folder. And you can upload the sage worksheet file "verify-certificate.sagews" as well. For help on how to upload files see https://doc.cocalc.com/howto/upload.html. 

After those files are in your project folder, you can open the SAGE worksheet "verify-certificate.sagews", which loads these matrices, and then performs computations with them. Open up that file in your CoCalc project, and then execute it cell-by-cell.

For example, you may wish to see the explicit sums of squares decomposition of the symmetric polynomial H_44 - H_521. You could print this out term-by-term. Alternatively, you can view .txt files which contain each of the 41 polynomials and each of the 41 (positive) coefficients. If you square each polynomial, then multiply by the coefficient, then sum the results, you obtain H_44 - H_521. These files are named "counterexample-coefficients.txt" and "counterexample-unsquared-polys.txt".
