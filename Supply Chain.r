library(readr)
library(dplyr)
library(ggplot2)

DCSC_df <- read_csv('DataCoSupplyChainDataset.csv');

head(DCSC_df)

glimpse(DCSC_df)

(summary(DCSC_df))

(sum(is.na(DCSC_df)))
names(which(colSums(is.na(DCSC_df))>0))

df <- DCSC_df %>%
select(Product_Name, Type, Benefit_per_order, Sales_per_customer, Delivery_Status, Category_Name,
       Customer_Country, Customer_Segment, Department_Name, Market, Order_Status, Shipping_Mode)
head(df)

(summary(df))

(glimpse(df))

sapply(df, mode)

df %>% count(Type, sort=TRUE)

df1 <- df %>% group_by(Type) %>% summarize(total_benefit_per_order = sum(Benefit_per_order)) %>% arrange(desc(total_benefit_per_order))
df1

df1 <- df %>% group_by(Type) %>% summarize(total_sales_per_customer = sum(Sales_per_customer)) %>% arrange(desc(total_sales_per_customer))
df1

df %>% count(Delivery_Status, sort=TRUE)

df %>% count(Category_Name, sort=TRUE)

df1 <- df %>% group_by(Category_Name) %>% summarize(total_benefit_per_order = sum(Sales_per_customer)) %>% arrange(desc(total_benefit_per_order))
df1

df1 <- df %>% group_by(Category_Name) %>% summarize(total_sales_per_customer = sum(Sales_per_customer)) %>% arrange(desc(total_sales_per_customer))
df1

unique(df$Customer_Country)

df['Customer_Country'][df['Customer_Country']=='EE. UU.'] <- 'United States' 
df

df %>% count(Customer_Country, sort=TRUE)

ggplot(df, aes(Customer_Country)) + geom_bar(fill='Purple', alpha = 0.4)

df %>% count(Customer_Segment, sort=TRUE)

df1 <- df %>% group_by(Customer_Segment) %>% summarize(total_benefit_per_order = sum(Benefit_per_order)) %>% arrange(desc(total_benefit_per_order))
df1

df1 <- df %>% group_by(Customer_Segment) %>% summarize(total_sales_per_customer = sum(Sales_per_customer)) %>% arrange(desc(total_sales_per_customer))
df1

df %>% count(Customer_Country, sort=TRUE)

df %>% count(Department_Name, sort=TRUE)

df1 <- df %>% group_by(Department_Name) %>% summarize(total_sales_per_customer = sum(Sales_per_customer)) %>% arrange(desc(total_sales_per_customer))
df1

df1 <- df %>% group_by(Department_Name) %>% summarize(total_benefit_per_order = sum(Benefit_per_order)) %>% arrange(desc(total_benefit_per_order))
df1

df %>% count(Market, sort=TRUE)

df1 <- df %>% group_by(Market) %>% summarize(total_sales_per_customer = sum(Sales_per_customer)) %>% arrange(desc(total_sales_per_customer))
df1

df1 <- df %>% group_by(Market) %>% summarize(total_benefit_per_order = sum(Benefit_per_order)) %>% arrange(desc(total_benefit_per_order))
df1

df %>% count(Shipping_Mode, sort=TRUE)

ggplot(df, aes(Shipping_Mode)) + geom_bar(fill='magenta', alpha=0.5)

df1 <- df %>% group_by(Shipping_Mode) %>% summarize(total_benefit_per_order = sum(Benefit_per_order)) %>% arrange(desc(total_benefit_per_order))
df1

df1 <- df %>% group_by(Shipping_Mode) %>% summarize(total_sales_per_customer = sum(Sales_per_customer)) %>% arrange(desc(total_sales_per_customer))
df1
