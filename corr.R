
corr <- function(directory, threshold=0) {
        if(exists("crr")){
                rm(crr)
        }
        fid<-1:332

        neligbl<-0
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
                nobs<-sum(temp$comp)
                if (nobs>threshold){
                        corr<-cor(x=temp$sulfate,y=temp$nitrate,use="complete.obs")
                        if(!exists("crr")){
                               crr <-corr      
                        }
                        else {
                                crr<-c(crr,corr)
                        }
                        neligbl<-neligbl+1
                }
                
                
                }
                if (neligbl==0) {
                        crr<-vector("numeric",0)
                }
                crr 
                
        }   

     






