# Implementation AI algorithms in business processes of inductrial companies

_Georgii Budnik, g.budnik@innopolis.university
BS21-AI-01_

## Abstract

This thesis examines the ways of digital transformation of companies in the industrial sector using Artificial Intelligence (AI) algorithms and without its participation. The paper considers the optimization of two key indicators: the time when a customer's order was placed by an employee of the company (Customer Checkout time) and the average number of product items in the order (SKU).

This repository contains the full pipeline of a Bachelor's thesis on the digital transformation of customer service and recommender systems in industrial retail, structured around two key research questions:

- RQ1: To what extent can barcode mechanisms reduce customer checkout time?

- RQ2: To what extent can a recommendation system increase the average number of SKUs in a customer’s order?

The project is structured into several core directories to support end-to-end experimentation, real-world integration, and documentation.

## 📦 RQ1 – Barcode Mechanism Integration
This part addresses customer path optimization by replacing printed documents with reusable barcode ID cards linked to customer orders inside the ERP system.

### 🔧 ERP Integration Logic
Folder: ```erp_modifications/```

 - Client-side: ```client/``` – Custom logic for assigning a barcode to a newly created order in the user interface.

 - Server-side: ```server/``` – Logic for unlinking barcodes after checkout completion.

### 📊 Data Analysis Pipeline
Raw Data: Stored in ```data/raw/``` – Includes event timestamps (order placement, service registration, completion).

Preprocessing: Conducted in notebooks in notebooks/ using IQR-based outlier filtering.

Visualization: Final figures are stored in ```artifacts/visualizations/``` and ```reports/figures/```:

```TotalTimeCheckoutPlot.png``` – Final checkout time reduction

```StagesTimePlot.png``` – Time analysis by service stage

### 📈 Outcome
Checkout time reduced by ~7.43%

Estimated business impact: 78M rub/year

## 🤖 RQ2 – Recommendation System Pipeline
This part focuses on increasing product completeness in customer baskets through real-time SKU suggestions. It includes collaborative filtering, neural models, and embedding-based clustering.

### 📊 Data Workflow
Raw Data: ```data/raw/``` exported ERP orders with item metadata

Filtering: ```data/interim/``` is intermediate versions after cleaning

Preprocessing: ```data/processed/``` – Final train/test splits and matrices for model training

Representing: ```notebooks/``` scripts allow to cluster and extract meta-data, which provides in ```artifacts/```

### 🔧 Model Training Notebooks
Stored in ```notebooks/```, each notebook corresponds to a pipeline stage (in quickstart form) choosing appropriate points:

- Data Preprocessing – Cleansing, IQR filtering

- Matrix Construction – Binary & Quantity user-item matrices

- Item Embedding – MiniLM & SBERT via SentenceTransformers

- Dimensionality Reduction – SVD + UMAP

- Clustering – DBSCAN, HDBSCAN with KDE support

- Model Training - Global Top, ALS (implicit), Item2Item similarity or BERT4Rec (PyTorch implementation with masked item prediction)

### 💡 Evaluation & Visualization
```rec_output.png``` – Sample recommendation UI for sellers

```sku_boxplot.png``` – SKU distribution before/after deployment

```sku_histogram.png``` – Histogram of SKU count improvements

Final metrics summary table in ```reports/final_report.pdf```

### 📈 Outcome
Best Model: BERT4Rec + HDBSCAN

Metrics: nDCG@20 = 0.2473, Recall@20 = 0.3790

Business Impact: +0.75 SKUs/order (~7.66% growth)

Estimated ROI: 42M rub/year

### 🔗 Getting Started
To reproduce the full pipeline:

1. Prepare the data using scripts in ```notebooks/```

2. Visualize outputs from ```artifacts/visualizations/```

3. Train models via dedicated notebooks in ```models/```

4. Compare integration results using notebooks from ```notebooks/```

Refer to key practice paper ```src``` and  ```thesis/``` for leterature review and methodology

Explore ```erp_modifications/``` for real-world ERP logic (1C implementation)

## Repository structure

Repository has the following structure:

```
My-BS-Thesis
├── README.md              # Short info about the thesis
|
├── erp_modifications
│   ├── server             # Barcode unlinking
│   └── client             # Client order form
|
├── artifacts              # Representation and meta-data
│   └── visualizations     # Figures of the representation erp_modifications
│
├── data
│   ├── interim            # Prepared/transformed data
│   ├── processed          # Training/Testing data for models
│   └── raw                # Initially data
│
├── models                 # Final checkpoints models
│
├── notebooks              # Jupyter notebooks           
│ 
├── reports
│   ├── figures            # Generated graphics and figures to be used in reporting
│   └── final_report.pdf   # Final report about the results
│
├── src                    # Key explanatory papers for practice
│
└── thesis                 # Thesis contet
```
