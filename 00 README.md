![1](https://github.com/user-attachments/assets/cdc2a5ed-cbf3-4605-a23f-4a724f6d54d0)

# Cyclistic
How do Annual Members and Casual Riders, use Cyclistic Bikes differently? Find out the results for 2023!

---

Hello there!! 
I hope by now you have a good understanding of what this project is. If not, you can watch this [Youtube Video](https://youtu.be/MUZ0fFxClYI?si=YHDYuqpNpRUHhlOG) where I explain the context and premise of this project. 
Once you know the premise, you can come back here and check out the code! 

## 01 Understanding the Data

### 1.1 Data Structure
- The cyclistic trip data is stored and organised on a month by month basis in a CSV file, each of which is imported into SQL as a separate table.
- 12 tables, are then combined into 1 single table using SQL
- A backup is created to prevent data loss and restarting from scratch  

  ![Tables](https://github.com/user-attachments/assets/3ab318e0-aeaf-4a48-9ba8-d098033d5a66)

Each CSV file has the following 13 columns, which were imported into SQL as follows : 
  ![Column Properties](https://github.com/user-attachments/assets/6bf2c761-df0e-4ee4-bcf3-315d6196e260)

For our analysis, few columns were added. After addition, the columns for the table **_year2023_** looks like below :   
 ![Year2023 columns](https://github.com/user-attachments/assets/f5d68667-9e50-4807-8eef-4f128aa177fe)


  ### 1.2 Data Source and Data License Agreement

  - [Click here for the orignal data](https://divvy-tripdata.s3.amazonaws.com/index.html)  
  - [Click here for the license agreement](https://divvybikes.com/data-license-agreement)  

---

## 02 Data Cleaning, Analysis and Visualization

For our analysis, the relevant columns are : 
- ride_id
- rideable_type
- started_at
- ended_at
- member_casual

Thanks to the data provider, none of these columns were missing values.  

However, the data wasn't entirely clean. When the ride duration was calculated by subtracting "ended_at" from "started_at", there were several values that were negative. Since ride duration can't be negative, we had to exclude those rows from our analysis. 

You can check out the SQL queries in the SQL files. Each query is preceeded by comments which explains what the query does 

The output of the SQL queries was stored in Google Sheets, and the charts were made using Google Sheets itself.



  

