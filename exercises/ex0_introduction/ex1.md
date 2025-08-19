## Exercise 1
- a) You have a simple workload that runs daily in Snowflake. The workload uses 0.5 credits per day. Calculate the total credit usage and cost for a 30-day month.

*Answer:*
Based on findings [here:](https://www.snowflake.com/pricing/pricing-guide/)
Price per Snowflake Credit = $3.90
Credits = 0.5 Credits x 30 days per month = 15 credits
Cost = USD58,5

- b) Your workload varies throughout the month. For the first 10 days, you use 2 credits per day. For the next 10 days, you use 1.5 credits per day, and for the last 10 days, you use 1 credit per day. Calculate the total credit usage and cost for a 30-day month.

Price per Snowflake Credit = $3.90

2 Credits x 10 days per month
1,5 Credits x 10 days per month
1 Credits x 10 days per month

- c) You have three different warehouses running workloads simultaneously. Warehouse A is of size XS, Warehouse B is of size S, and Warehouse C is of size M. Warehouse A is used for 10h/day, B is used for 2h/day and C is used for 1h/day. Calculate the total monthly cost assuming each warehouse runs for the full 30-day month.

Price per Snowflake Credit = $3.90
XS = 1
S = 2
M = 4
A = 1 credit x 10 hours per day x 30 days per month = 300
B = 2 credit x 2 hours per day x 30 days per month = 120
C = 4 credit x 1 hours per day x 30 days per month = 120
=540 redits
=USD2106

d) Your Snowflake warehouse uses auto-scaling. For the first 10 days, it operates on 2 clusters for 10 hours per day. For the next 10 days, it scales up to 3 clusters for 10 hours per day. For the last 10 days, it scales up to 4 clusters for 10 hours per day. Calculate the total monthly budget. Assume the warehouse consumes 1 credit per hour per cluster.
Price per Snowflake Credit = $3.90
1 cluster = 1 credit

2 Credits x 10 days per month
+
3 Credits x 10 days per month
+
4 Credits x 10 days per month
=90 Credits
=USD351