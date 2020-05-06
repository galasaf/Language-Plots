library(tidyverse)
library(ggplot2)
library(ggpubr)
library(ggalt)



########################################################################### 1) Ratings
Ratings <- tribble(
  ~'Subject',    ~'Family',   ~'Comprehend',    ~'Speak',
  'Daniel (O)',      '1',         10,             10,
  'Mia (Y)',         '1',         10,             10,
  'Brent (O)',       '2',         10,             10,
  'Kyle (Y)',        '2',         9,               7,
  'Benito (O)',      '3',         10,             7,
  'Oscar (Y)',       '3',         6,              5,
 'Samuel (O)',       '4',        10,              10,
  'Kendra (Y)',      '4',        10,              5,
  'Lani (O)',        '5',        10,              8,
  'Leo (Y)',         '5',        9,               2,
  'Bryce (O)',       '6',        8,               8,
  'Melvin (Y)',      '6',        9,               9
)



# Above didn't work, so adding in two more columns for sibling older and score type. This way I can
# add them into facet grid.
Ratings_3 <- tribble(
  ~'Subject', ~'Sibling Order',    ~'Family',   ~'Score Type',    ~'Score',
  'Daniel',      'Older',              '1',         'Comprehend',             10,
  'Daniel',      'Older',              '1',         'Speak',             10,
  'Mia',      'Younger',               '1',         'Comprehend',             10,
  'Mia',      'Younger',               '1',         'Speak',             10,
  'Brent',     'Older',                '2',         'Comprehend',             10,
  'Brent',     'Older',                '2',         'Speak',             10,
  'Kyle',       'Younger',             '2',        'Comprehend',              9,
  'Kyle',       'Younger',             '2',        'Speak',              7,
  'Benito',     'Older',               '3',         'Comprehend',             10,
  'Benito',     'Older',               '3',         'Speak',             7,
  'Oscar',       'Younger',            '3',         'Comprehend',              6,
  'Oscar',       'Younger',            '3',         'Speak',              5,
  'Samuel',       'Older',             '4',        'Comprehend',              10,
  'Samuel',       'Older',             '4',        'Speak',              10,
  'Kendra',      'Younger',            '4',        'Comprehend',              10,
  'Kendra',      'Younger',            '4',        'Speak',              5,
  'Lani',        'Older',              '5',        'Comprehend',              10,
  'Lani',        'Older',              '5',        'Speak',              8,
  'Leo',         'Younger',            '5',        'Comprehend',               9,
  'Leo',         'Younger',            '5',        'Speak',               2,
  'Bryce',      'Older',               '6',        'Comprehend',               8,
  'Bryce',      'Older',               '6',        'Speak',               8,
  'Melvin',     'Younger',             '6',        'Comprehend',               9,
  'Melvin',     'Younger',             '6',        'Speak',               9
)

Ratings_3$Family <- as.factor(Ratings_3$Family)
Ratings_3$`Sibling Order` <- as.factor(Ratings_3$`Sibling Order`)
Ratings_3$`Score Type` <- as.factor(Ratings_3$`Score Type`)

ggplot2::ggplot(Ratings_3) + 
  geom_bar(aes(x = `Sibling Order`, y = `Score`, fill = `Sibling Order`), stat = "identity") + 
  facet_grid(`Score Type` ~ Family) # but is there any way to put sibling names on the X axis 
    # and mark Family?

# put sibling names on x axis 


############################################################ 3)TMA 

# TMA Total
TMA_total <- tribble(
  ~'TMA', ~'Younger siblings', ~'Older siblings',
  "Present",       18.72,           35.98,
  "Preterite",     55.07,           41.08,
  "Imperfect",     24.89,           18.98,
  "Subjunctive",  0.44,             1.70, 
  "Other",        0.88,             2.22
) 

# Geom barbell plot
TMA_total$TMA <- factor(TMA_total$TMA, levels = as.character(TMA_total$TMA))
ggplot(TMA_total, aes(x=`Younger siblings`, xend=`Older siblings`, y=TMA)) + 
  geom_dumbbell() 



# Present - The goal is to also use barbell plot for these, but with siblings and family located on the 
# left. The challenge is representing them as percentages. 
Present_verbs <- tribble(
  ~'Subject',    ~'Family',   ~'Percentage',
'Daniel (O)',      '1',       7.14,         
'Mia (Y)',         '1',       31.88,
'Brent (O)',       '2',       37.70,  
'Kyle (Y)',        '2',       15.52,      
'Benito (O)',      '3',       47.54,
'Oscar (Y)',       '3',       46.77,
'Samuel (O)',      '4',       85.96,
'Kendra (Y)',      '4',       5.97,
'Lani (O)',        '5',       6.56,
'Leo (Y)',         '5',       26.00,
'Bryce (O)',       '6',       28.57,
'Melvin (Y)',      '6',       20.97
)


## Preterite
Preterite_verbs <- tribble(
  ~'Subject',    ~'Family',   ~'Percentage',
  'Daniel (O)',      '1',       60.71,         
  'Mia (Y)',         '1',       33.33,
  'Brent (O)',       '2',       36.07,  
  'Kyle (Y)',        '2',       44.83,      
  'Benito (O)',      '3',       40.98,
  'Oscar (Y)',       '3',       37.10,
  'Samuel (O)',      '4',       5.26,
  'Kendra (Y)',      '4',       49.25,
  'Lani (O)',        '5',       55.74,
  'Leo (Y)',         '5',       48.00,
  'Bryce (O)',       '6',       48.21,
  'Melvin (Y)',      '6',       58.06
)

## Imperfect 
Imperfect_verbs <- tribble(
  ~'Subject',    ~'Family',   ~'Percentage',
  'Daniel (O)',      '1',       30.36,         
  'Mia (Y)',         '1',       31.88,
  'Brent (O)',       '2',       22.95,  
  'Kyle (Y)',        '2',       41.38,      
  'Benito (O)',      '3',      8.20,
  'Oscar (Y)',       '3',       16.13,
  'Samuel (O)',      '4',      1.75,
  'Kendra (Y)',      '4',       43.28,
  'Lani (O)',        '5',      31.15,
  'Leo (Y)',         '5',       24.00,
  'Bryce (O)',       '6',       19.64,
  'Melvin (Y)',      '6',       25.81
)

############################################################## 4) Target vs non target features

### Gender Subject Target and nontarget

# Stacked bar chart 
gender_subject <- tribble(
  ~'Subject',    ~'Family',   ~'Target',    ~'NonTarget',
  'Daniel (O)',      '1',       100,         0,
  'Mia (Y)',         '1',       100,         0,
  'Brent (O)',       '2',       100,         0,
  'Kyle (Y)',        '2',       100,         0 ,  
  'Benito (O)',      '3',       97.06,      2.94,
  'Oscar (Y)',       '3',       70,         30,
  'Samuel (O)',      '4',       100,        0,
  'Kendra (Y)',      '4',      87.23,      12.77,
  'Lani (O)',        '5',      100,        0,
  'Leo (Y)',         '5',       16.67,     83.33,
  'Bryce (O)',       '6',       100,       0,
  'Melvin (Y)',      '6',       100,       0
)


# use as model to make plots for gender_object and verb_formation


# English Lexical insertions, this time with only one value 'presence'
English_insertions <- tribble(
  ~'Subject',    ~'Family',   ~'Presence',
  'Daniel (O)',      '1',       7.14,        
  'Mia (Y)',         '1',       4.35,  
  'Brent (O)',       '2',       9.84,        
  'Kyle (Y)',        '2',       16.95,        
  'Benito (O)',      '3',       14.75,    
  'Oscar (Y)',       '3',       51.61,       
  'Samuel (O)',      '4',       7.02,
  'Kendra (Y)',      '4',      14.93,      
  'Lani (O)',        '5',      6.56,       
  'Leo (Y)',         '5',       58,     
  'Bryce (O)',       '6',       7.14,
  'Melvin (Y)',      '6',       6.45
  )      
  
  
  
  
  
  
  
  
  
  
  
  
