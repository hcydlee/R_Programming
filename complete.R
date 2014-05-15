
complete <- function(directory, id=1:332) {
        if(exists("output")){
                rm(output)
        }
        fid<-id
      
        for (i in fid) {
                if (i<10){
                        fileid<-paste('00',format(i,trim=TRUE),sep='')
                }
                else if (i<100) {
                        fileid<-paste('0',format(i,trim=TRUE),sep='')
                }
                else {
                        fileid<-as.character(i)
                }  
                filename<-paste("~/Github/R_Programming/",directory,'/',fileid,'.csv',sep='')
                temp<-read.csv(filename,header=TRUE)
                temp$comp<-complete.cases(temp$sulfate,temp$nitrate)
                cdf<-data.frame(id=i,nobs=sum(temp$comp))
                if(!exists("output")){
                        output <-cdf    
                }
                else {
                        output<-rbind(output,cdf)
                }
                
                
                }
             output
        }   

     






