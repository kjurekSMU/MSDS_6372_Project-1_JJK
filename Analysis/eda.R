library(tidyverse)
library(stats)
library(broom)

sas_directory = '/Users/pankaj/dev/sas/SASUniversityEdition/myfolders/stats2_hw'

price_modeling_data = read.csv('Analysis/Data/modelingData.csv' , header=T, stringsAsFactors=F)



### count vars that are all none or  no none

na_count <-sapply(price_modeling_data, function(y) sum(length(which(is.na(y)))))

na_count_frame= stack(na_count)
all_na= filter(na_count_frame, na_count==25471)
no_na = filter(na_count_frame, na_count==0)

##### check all factoers 

factors =  sapply(price_modeling_data, function(x) class (x)=="character")
factor_stack= stack(factors)
cat_vars= filter(factor_stack, values == TRUE) %>% select(ind)
cat_var_names= as.character(cat_vars$ind)

ggplot(data = price_modeling_data)+
  geom_bar(mapping = aes(x= product_type))+
  geom_text('23')

ggplot(data = filter(na_count_frame , values >24000))+
  geom_bar(mapping = aes(y= values, x=ind), stat='identity')+
  xlab('variable name')+
  ylab('number of NAs')+
  coord_flip();


p = ggplot(data = price_modeling_data )

p+geom_point(mapping = aes( x= full_sq)) 

view(price_modeling_data$full_sq)

p+geom_point(mapping = aes( x= full_all)) 

p+geom_histogram(mapping = aes( x= full_all)) 

p+geom_point(mapping = aes( x = num_room))

p+geom_bar(mapping = aes( x = num_room), stat = "identity") + 
  coord_flip()

p+geom_bar(mapping = aes( x = floor), stat = "identity") 
dev.new()
p+geom_bar(mapping = aes( x = radiation_raion), stat = "identity") 

#coord_flip()
p+geom_point(mapping = aes( x= kitch_sq))
summarise(price_modeling_data$radiation_raion)

pr_model = lm(price_doc ~ full_sq+work_all  , price_modeling_data)
cookd=cooks.distance(pr_model)
summary(pr_model)

df <- augment(pr_model)
ggplot(df, aes(x = .fitted, y = .resid)) + geom_point()


# ignore with cookd greater than 4 to filter outliers

cookd=cooks.distance(pr_model)

reduced_model_data = 
  select( price_modeling_data , c(no_na$ind))  %>% 
  filter(row_number() %in% names(Filter(function(x){x<4}, cookd)), full_sq <200  ) %>% 
  # additional filter based graph
  filter(id!=2121) %>% filter(full_sq>=5)

## fit smaller model

pr_model = lm(price_doc ~ full_sq +work_all+ as.factor(ID_metro) + as.factor(children_school)+
                as.factor(healthcare_centers_raion),  
              reduced_model_data)
summary(pr_model)



ggplot(data= reduced_model_data, aes( x=shopping_centers_raion, y = price_doc ))+
  geom_point()+
  geom_smooth(method= "lm", color = "red")
 


cookd[2321]

Filter(function(x){x>2}, cookd)[2321]

plot(cookd)

summary(pr_model)
