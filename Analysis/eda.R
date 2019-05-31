library(tidyverse)

price_modeling_data = read_csv('Analysis/Data/modelingData.csv' ,
                         col_types = cols(.default = 'i'  ))


p = ggplot(data = price_modeling_data, aes( x= life_sq,y = price_doc))

p+geom_point(mapping = aes( x= life_sq)) +
  stat_smooth(method = "lm", col = "red")




p+geom_point(mapping = aes( x = num_room))

p+geom_bar(mapping = aes( x = num_room), stat = "identity") + 
  coord_flip()

p+geom_bar(mapping = aes( x = floor), stat = "identity") 
dev.new()
p+geom_bar(mapping = aes( x = radiation_raion), stat = "identity") 

#coord_flip()


p+geom_point(mapping = aes( x= kitch_sq))



