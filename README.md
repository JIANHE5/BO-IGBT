# BO-IGBT: Microseismic Signal Classification

## Overview

This repository implements a Bayesian-optimized improved gradient
boosting tree (BO-IGBT) stacking framework for binary microseismic (MS)
signal classification in tunnel rockburst monitoring.

The framework combines three focal-loss-based gradient boosting
learners:

-   XGBoost
-   LightGBM
-   CatBoost

Bayesian hyperparameter
optimization is applied to the base learners used **inside the stacking
branch**. The standalone XGBoost, LightGBM, and CatBoost models are
trained separately with fixed parameters and serve as comparison
baselines.

The implementation also provides classification reports, learning
curves, and built-in feature-importance analysis..

## Main components

1.  **Focal-loss base learners:** XGBoost, LightGBM, and CatBoost use a
    binary focal-loss objective.
2.  **Bayesian optimization:** Optuna's TPE sampler searches
    hyperparameters for the three base learners in the stacking branch.
3.  **Model evaluation:** Accuracy, balanced accuracy, MS precision, MS
    recall, MS F1, specificity, macro-F1, MCC, ROC-AUC, and average
    precision are reported where applicable.
4.  **Feature importance:** Model-specific built-in importance is
    exported for the three standalone learners.
5.  **Optional interpretation:** Stacking permutation importance and
    stacking SHAP can be enabled independently of model fitting.

## Repository files

-   `BO_IGBT_demo.ipynb`: Jupyter Notebook
    implementation.
-   `README.md`: project overview and quick-start instructions.

## Requirements

Use Python 3.10 or later. Install the core dependencies:

``` bash
pip install numpy pandas scipy scikit-learn matplotlib xgboost lightgbm catboost optuna
```

SHAP is optional:

``` bash
pip install shap
```

## Input data

By default, the script searches for the following directory relative to
the script:

``` text
Data_sets/
└── MS_NS_TrainData/
    ├── Features_matrix.mat
    ├── Label.mat
    ├── Group.mat              # optional; recommended when samples come from events
    ├── Feature_names.txt      # optional
    └── Feature_names.csv      # optional
```

Expected data:

-   `Features_matrix.mat`: a numeric feature matrix with shape `N × P`
    (samples × features). The preferred MATLAB variable name is
    `Features_matrix`.
-   `Label.mat`: a binary label vector with `N` entries. The preferred
    MATLAB variable name is `Label`.
-   Labels must be `1 = MS` and `0 = NS`.
-   `Group.mat` is optional and should contain one original-event
    identifier per sample. It is recommended when multiple segments
    originate from the same microseismic event.
-   `Feature_names.txt` or `Feature_names.csv` is optional. If absent,
    features are named `F01`, `F02`, and so on.

The example configuration expects 21 samples (7 MS and 14 NS). To use a
dataset with a different sample count, set `EXAMPLE_21 = False` in the
configuration.

For a real-data run, set:

``` python
ALLOW_SYNTHETIC_IF_MISSING = False
```

This prevents the script from silently generating illustrative synthetic
data when the input MAT files are absent.

## Quick start

1.  Place the input files in `Data_sets/MS_NS_TrainData/`.
2.  Check the label convention (`1 = MS`, `0 = NS`) and the
    feature-matrix orientation (`N × P`).
3.  Set `EXAMPLE_21` according to the dataset size.
4.  Set `ALLOW_SYNTHETIC_IF_MISSING = False` for real-data analysis.
5.  Run the Jupyter script:

Open and run `BO_IGBT_demo.ipynb`
sequentially in Jupyter.
