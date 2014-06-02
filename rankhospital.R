#rankhospital
rankhospital <- function(state, outcome,num) {
        
        ## Read outcome data
        dout<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        statelist<-levels(as.factor(dout$State))
        
        if(match(state,statelist,0)) {
           dout<-dout[dout$State==state,]     
        }
        else {
                stop("invalid state")
        }
      
        
        if(outcome=="heart attack"){
                dout[, 11] <- as.numeric(dout[, 11])
                data<-na.omit(dout[,c(2,11)])
        }
        else if(outcome=='heart failure'){
                dout[, 17] <- as.numeric(dout[, 17])
                data<-na.omit(dout[,c(2,17)])
        }
        else if (outcome=='pneumonia'){
                dout[, 23] <- as.numeric(dout[, 23])
                data<-na.omit(dout[,c(2,23)])
        }
        else {
                stop("invalid outcome")
        }

        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        
        rank<-data[order(data[,2],data[,1]),]
        rank$rank<-1:nrow(rank)
        
        if(num=='best'){
                 rank[rank$rank==1,]$Hospital.Name
        }
        else if (num=='worst'){
                rank[rank$rank==max(rank$rank),]$Hospital.Name
        }
        else if (num>max(rank$rank)) {
                NA
        }
        else {
                rank[rank$rank==num,]$Hospital.Name
        }
}



