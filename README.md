# RFM Customer Segmentation
&nbsp; <ins> Dataset generation: </ins> <br /> 
* A random dataset is generated with the following code: [generate_user_rfm.ipynb](generate_user_rfm.ipynb) with Recency, Frequency, and MonetaryValue metrics. Recency is generated with bimodal distribution whereas Frequency and MonetaryValue are generated with skewed distribution in order to make the dataset more realistic. <br /> 
* An SQL file is given to retrieve the data in a real-life setting: [retrieve_rfm_data.sql](retrieve_rfm_data.sql). <br />
* The distribution of the dataset: <br /> <br />

  <div align="center">
    
  ![image](https://github.com/user-attachments/assets/587bec41-6a22-4928-9c1f-8c7a578d3c23)
  
   </div>
   
&nbsp; <ins> Normalization: </ins> <br /> 
* The dataset is normalized with box-cox transformation and StandardScaler function of sklearn. Box-cox transformation is preferred since the dataset is highly skewed. <br /> 
* The distribution of transformed dataset: <br /> <br />

  <div align="center">
    
  ![image](https://github.com/user-attachments/assets/1ac68178-888b-469e-b505-55734227c87f)
  
   </div>
   
&nbsp; <ins> Clustering: </ins> <br /> 
* The script of the RFM analysis is here: [rfm.ipynb](rfm.ipynb)
* Applied k-means clustering on the normalized dataset. The optimum number of clusters is chosen based on the sum of squared errors (SSE). <br />
* The visualization of clusters based on Recency, Frequency, and MonetaryValue of 4 clusters: <br /> <br />
  <div align="center">
    
  ![image](https://github.com/user-attachments/assets/4d84c072-2539-4cfb-bf64-9d061d5c097a)

  </div>
* The clustering doesn't show good separation between clusters except for cluster 2 which has high Frequency and MonetaryValue with respect to other clusters. The mean values of each cluster are given here: <br />

<div align="center">
  
| Cluster | Recency   | Frequency | MonetaryValue |
|---------|-----------|-----------|---------------|
| 0       | 0.939210  | 0.158824  | 1.347769      |
| 1       | 0.137845  | 1.185070  | 1.038649      |
| 2       | 1.626548  | 1.641895  | 1.427368      |
| 3       | 1.163313  | 0.890114  | 0.187459      |
  
</div>

* Relative importance of attributes is calculated by dividing the average of the metrics in a specific cluster by the whole population averages. This analysis shows a separation between cluster 2 and all of the other clusters: <br /> <br />

 <div align="center">
   
 ![image](https://github.com/user-attachments/assets/a32039ee-79a0-4874-8c17-3b04f2cb4d20)
 
 </div>
