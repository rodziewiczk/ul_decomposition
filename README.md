# UL Decomposition – Numerical Methods Project (MATLAB)

This repository contains an implementation of **UL factorization**, along with utilities to compute a matrix determinant, an inverse (via UL), and to solve right-sided linear systems of the form **X·A = B**.

## Contents
- **UL factorization (Doolittle-style)**: computes `U` (upper triangular) and `L` (unit lower triangular) such that `A = U*L`.
- **Determinant**: computed from `U` (product of diagonal entries). Since `L` is unit lower triangular, `det(L)=1`, so `det(A)=det(U)`.
- **Inverse**: computed by solving `U*Y = I` and then `L*X = Y` (i.e., applying the two triangular solves for each column of `I`).
- **Right-sided system**: solves `X*A = B` (commonly via transposition: `A^T * X^T = B^T`, then solving for `X^T`).

## Project Structure
- `src/` – core functions (UL, inverse/det, solvers, validation)

- `scripts/` – examples and tests
