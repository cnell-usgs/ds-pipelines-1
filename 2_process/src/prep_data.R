# Prep RMSE data for plotting

## preliminaries 
library(dplyr)
library(readr)
library(stringr)

## prep RMSE data
### add vars for col and pch based on model_type, & n_prof
### saves & returns processed dataframe 

prep_data<-function(input_path = '1_fetch/out/model_RMSEs.csv', output_path = '2_process/out/model_summary_results.csv'){
 
  eval_data <- readr::read_csv(input_path) %>%
    filter(str_detect(exper_id, 'similar_[0-9]+')) %>%
    mutate(col = case_when(
      model_type == 'pb' ~ '#1b9e77',
      model_type == 'dl' ~'#d95f02',
      model_type == 'pgdl' ~ '#7570b3'
    ), pch = case_when(
      model_type == 'pb' ~ 21,
      model_type == 'dl' ~ 22,
      model_type == 'pgdl' ~ 23
    ), n_prof = as.numeric(str_extract(exper_id, '[0-9]+')))
  
  # save generated 
  write_csv(eval_data, output_path)
  
  print(paste('processes RMSE data is saved to', output_path))
  
  return(eval_data)
}

