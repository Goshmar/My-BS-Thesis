# Digitalization and optimization of business processes of construction segment companies accompanied by AI

_Georgii Budnik, g.budnik@innopolis.university
BS21-AI-01_

## Thesis description

....

## Basic pipeline (commands) (not TRUE):

1. On the basis of the laptop ```1_data_preparation.ipynb``` download the dataset (it happens in the laptop automatically) and process the data by receiving the generated data that lies in the ```data/interim``` folder

2. Launch one of the two or both laptops with the developed models (```2_SVD_implementation.ipynb```, ```3_Hybrid_SVD_implementation.ipynb```). Detailed versions of these scripts are located in the ```models``` folder

3. As soon as the models are ready to work, set your query from the laptop ```4_preparing_to_evaluation.ipynb``` and create the results of the work of the recommendation systems (ready-made program outputs are in the ```benchmark/data``` folder)

4. In order to evaluate and compare the quality of the models, use the laptop ```5_evaluation.ipynb``` or the file ```benchmark/evaluate.py```

5. Also, for a more convenient launch of all "sections", the laptop ```6_overall_baseline.ipynb``` is presented

## Repository structure

Repository has the following structure:

```
My-BS-Thesis
├── README.md               # Short info about the thesis
│
├── data
│   ├── interim             # Prepared/transformed data
│   └── raw                 # The initially data
│
├── models                  # Final checkpoints models
│
├── notebooks               # Jupyter notebooks           
│ 
├── references              # Key explanatory papers
│
└── reports
    ├── figures             # Generated graphics and figures to be used in reporting
    └── final_report.pdf    # Final report about the results
```
