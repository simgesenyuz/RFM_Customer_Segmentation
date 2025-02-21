# RFM Customer Segmentation
## <ins> Overview: </ins> <br /> 
This project focuses on RFM (Recency, Frequency, Monetary) Analysis, a technique used in marketing to segment customers based on their purchasing behavior. By analyzing Recency (how recently a customer made a purchase), Frequency (how often they purchase), and Monetary (how much they spend), businesses can identify valuable customer segments and tailor their marketing strategies accordingly.

The project includes a Python implementation of RFM analysis, along with data preprocessing, segmentation, and visualization steps. The goal is to provide actionable insights into customer behavior and help businesses optimize their marketing efforts.

##  <ins> Technologies Used <ins> <br /> 

This project leverages the following technologies and libraries:

* Python: Primary programming language.
* SQL: For querying and organizing data (if applicable).
* NumPy: For numerical computations.
* Pandas: For data manipulation and analysis.
* SciPy: For statistical operations, including boxcox transformations.
* Scikit-learn: For machine learning-related tasks, including clustering (KMeans) and scaling (StandardScaler).
* Matplotlib and Seaborn: For data visualization.
* Plotly: For interactive visualizations.

##  <ins> Dataset generation: </ins> <br /> 
* A random dataset is generated with the following code: [generate_user_rfm.ipynb](generate_user_rfm.ipynb) with Recency, Frequency, and MonetaryValue metrics. Recency is generated with bimodal distribution whereas Frequency and MonetaryValue are generated with skewed distribution in order to make the dataset more realistic. <br />
* An SQL file is given to retrieve the data in a real-life setting: [retrieve_rfm_data.sql](retrieve_rfm_data.sql). <br />
* The distribution of the dataset: <br /> <br />

  <div align="center">
    
  ![image](https://github.com/user-attachments/assets/587bec41-6a22-4928-9c1f-8c7a578d3c23)
  
   </div>
   
##  <ins> Normalization: </ins> <br /> 
* The dataset is normalized with box-cox transformation and StandardScaler function of sklearn. Box-cox transformation is preferred since the dataset is highly skewed. <br /> 
* The distribution of transformed dataset: <br /> <br />

  <div align="center">
    
  ![image](https://github.com/user-attachments/assets/1ac68178-888b-469e-b505-55734227c87f)
  
   </div>
   
##  <ins> Clustering: </ins> <br /> 
* The script of the RFM analysis is here: [rfm.ipynb](rfm.ipynb)
* Applied k-means clustering on the normalized dataset. The optimum number of clusters is chosen based on the sum of squared errors (SSE). <br />
* The visualization of clusters based on Recency, Frequency, and MonetaryValue of 4 clusters: <br /> <br />
  <div align="center">
    
  ![image](https://github.com/user-attachments/assets/4d84c072-2539-4cfb-bf64-9d061d5c097a)

  </div>
* The clustering doesn't show good separation between clusters except for cluster 2 which has high Frequency and MonetaryValue with respect to other clusters. The mean values of each cluster are given here: <br />

<div align="center">
  
| Cluster | Recency mean | Frequency mean | MonetaryValue mean | count |
|---------|--------------|----------------|--------------------|-------|
| 0       | 19.86        | 8.06           | 67135.53           | 2398  |
| 1       | 2.92         | 59.79          | 51737.55           | 2657  |
| 2       | 34.44        | 82.83          | 71100.53           | 2485  |
| 3       | 24.60        | 44.91          | 9337.75            | 2460  |
  
</div>

* Relative importance of attributes is calculated by dividing the average of the metrics in a specific cluster by the whole population averages. This analysis shows a separation between cluster 2 and all of the other clusters: <br /> <br />

 <div align="center">
   
 ![image](https://github.com/user-attachments/assets/a32039ee-79a0-4874-8c17-3b04f2cb4d20)
 
 </div>

 ##  <ins> Insights: </ins> <br />

A summary of the insights is given below. Among these segments, I would recommend to prioritize At-Risk High-Spenders (Cluster 2) since they have the highest MonetaryValue but the lowest recency.

<div align="center">
  
| Cluster | Group                     | Characteristics                                                                 | Action                                                                 |
|---------|---------------------------|---------------------------------------------------------------------------------|------------------------------------------------------------------------|
| 0       | High-Value, Occasional Buyers | Moderate recency, low frequency, high spending                                 | Encourage repeat purchases with targeted offers.                       |
| 1       | Champions (Best Customers) | Very recent, very frequent, high spending                                      | Reward with exclusive offers and loyalty programs.                     |
| 2       | At-Risk High-Spenders      | Less recent, very frequent, very high spending                                 | Re-engage with personalized offers or win-back campaigns.              |
| 3       | Potential Loyalists        | Moderate recency, moderate frequency, low spending                             | Upsell or cross-sell to increase their monetary value.                 |

 </div>
