setwd("folder_path")

namecorrection<-function()
   {
       coalist<-grep("\\$",list.files(getwd()),value=T,invert=T)
       coalist2<-grep("（",coalist,value=T)
       coalist3<-grep("）",coalist,value=T)
       coalist4<-uniun(coalist2,coalist3)
       coalist5<-(gsub("（",replacement="\\(",coalist4))
       coalist5<-(gsub("）",replacement="\\)",coalist5))
       for(x in 1:length(coalist4))
          {
              file.rename(paste(getwd(),coalist4[x],sep="/"), paste(getwd(),coalist5[x],sep="/"))
          }
       
   }
coalist<-grep("\\$",list.files(getwd()),value=T,invert=T)
coalist2<-grep("（",coalist,value=T)
coalist3<-grep("）",coalist,value=T)

coalist4<-uniun(coalist2,coalist3)

coalist5<-(gsub("（",replacement="\\(",coalist4))
coalist5<-(gsub("）",replacement="\\)",coalist5))
file.rename(paste(getwd(),coalist4[x],sep="/"), paste(getwd(),coalist5[x],sep="/"))


grep(coalistrev[x],originalcoafile,value=T)


coalist２<-strsplit(coalist,"\\(")
strsplit(coalist,"\\（")
strsplit(coalist,"\\(")
grep("（",coalist,value=T)


write.csv(coalist,"coalist.csv")


#rename 有重新命名與搬移兩種效果
#file.rename("~/Desktop/test folder/test1/IS.png", "~/Desktop/test folder/test1/IS2.png")

list.dirs(path = "~/Desktop", full.names = TRUE, recursive = FALSE)
leftfilecount<-5
targetfolder<-c("folder_path_1","folder_path_2")
dir.create(targetfolder[1],showWarnings = FALSE)
dir.create(targetfolder[2],showWarnings = FALSE)
coalist<-read.csv("coalist.csv")
coalistrev<-rev(coalist[,"x"])
originalcoafile<-list.files(getwd())
for(x in 1:length(coalistrev))
   {
       

      temptargetfile<-grep(coalistrev[x],originalcoafile,value=T)
      if(length(temptargetfile)!=0)
      {
       temptargetfile<-sort(temptargetfile,decreasing=FALSE)

       if(length(temptargetfile)>leftfilecount)
          {
              targetfile<-temptargetfile[1:(length(temptargetfile)-leftfilecount)]#將舊資料擷取出來
              for(y in 1 :length(targetfile))
                 {
                     file.copy(paste(getwd(),targetfile[y],sep="/"), paste(targetfolder[1],targetfile[y],sep="/"),overwrite =TRUE)
                 }
              for(z in (length(temptargetfile)-leftfilecount+1):length(temptargetfile))
                 {
                     file.copy(paste(getwd(),temptargetfile[z],sep="/"), paste(targetfolder[2],temptargetfile[z],sep="/"),overwrite =TRUE) 
                 }                   
                     
          }else
             {
              for(w in 1:length(temptargetfile))
                 {
                     file.copy(paste(getwd(),temptargetfile[w],sep="/"), paste(targetfolder[2],temptargetfile[w],sep="/"),overwrite =TRUE) 
                 }
             }

      originalcoafile<-setdiff(originalcoafile,temptargetfile)
     }
   }
   

strsplit(coalist,"\\(")

originalcoafile<-list.files(getwd())
length(originalcoafile)
targetfolderlist1<-list.files(targetfolder[1])
targetfolderlist2<-list.files(targetfolder[2])
length(union(targetfolderlist1,targetfolderlist2))
length(intersect(targetfolderlist1,targetfolderlist2))
length(setdiff(originalcoafile,targetfolderlist1))
length(setdiff(originalcoafile,targetfolderlist2))
length(setdiff(originalcoafile,union(targetfolderlist1,targetfolderlist2)))
setdiff(originalcoafile,union(targetfolderlist1,targetfolderlist2))




# 以下用來檢視檔案儲存、存取、修改日期
originalcoafile<-list.files(getwd())
originalcoafile<-t(t(originalcoafile))

originalcoafile<-cbind(originalcoafile,originalcoafile)
originalcoafile<-cbind(originalcoafile,originalcoafile)
for(x in 1:nrow(originalcoafile))
   {
       temp<-file.info(paste(getwd(),originalcoafile[x,1],sep="/"))[1,4:6]
       originalcoafile[x,2]<-as.character(as.POSIXct(temp[1,1]))
       originalcoafile[x,3]<-as.character(as.POSIXct(temp[1,2]))
       originalcoafile[x,4]<-as.character(as.POSIXct(temp[1,3]))
   }
colnames(originalcoafile)<-c("檔案名稱","修改日期","存取日期","最後查看日期")
write.csv(originalcoafile,"原始檔案修改紀錄.csv")

#
