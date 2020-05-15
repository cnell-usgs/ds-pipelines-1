# fetch model RMSE data

## preliminaries 
library(sbtools)

## fetch data
### default saves as '1_fetch/out/model_RMSEs.csv'

fetch_data<-function(output_path = '1_fetch/out/model_RMSEs.csv', verbose = TRUE){
  
  # fetch data and write file
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = output_path, overwrite_file = TRUE)
  
  if(verbose) message('RMSE data written to ', output_path)

  
  }

