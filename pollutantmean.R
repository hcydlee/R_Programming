
pollutantmean <- function(directory, pollutant, id = 1:332) {
        if (exists("pollutantdata")) {
                rm(pollutantdata)
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
                if (!exists("pollutantdata")) {
                        pollutantdata<-temp
                }
                else {
                        pollutantdata<-rbind(pollutantdata,temp)
                }
        }   
        if (pollutant=="sulfate") {
                vect<-pollutantdata$sulfate
        }
        else {
                vect<-pollutantdata$nitrate
        }
       
        mean(vect,na.rm=TRUE)
}





