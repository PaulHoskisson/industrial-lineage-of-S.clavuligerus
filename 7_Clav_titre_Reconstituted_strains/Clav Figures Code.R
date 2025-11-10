library(ggplot2)
library(patchwork)
library(Rmisc)
library(dplyr)
library(lmerTest)
library(ggbeeswarm)
library(MASS)
library(scales)
library(ggthemes)
library(gridExtra)
library(Hmisc)




data<-read.csv("/Users/johnbbruce/Desktop/Clav Combined Data for figures.csv")
head(data) 
data

TSB<- subset(data, Media %in% c("TSB"), select=c(Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g))
TSB
Citric<- subset(data, Media %in% c("Citrc Acid"), select=c(Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g))
Citric
Maltodextrin<- subset(data, Media %in% c("Maltodextrin"), select=c(Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g))
Maltodextrin

SC2TSB<- subset(TSB, Strain %in% c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX"), select=c(Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g))
SC2TSB

SC6TSB<- subset(TSB, Strain %in% c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX"), select=c(Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g))
SC6TSB

SC2CITRIC<- subset(Citric, Strain %in% c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX"), select=c(Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g))
SC2CITRIC

SC6CITRIC<- subset(Citric, Strain %in% c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX"), select=c(Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g))
SC6CITRIC

SC2MALTO<- subset(Maltodextrin, Strain %in% c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX"), select=c(Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g))
SC2MALTO

SC6MALTO<- subset(Maltodextrin, Strain %in% c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX"), select=c(Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g))
SC6MALTO

SC2TSB$Strain<-factor(SC2TSB$Strain,levels=c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX"))
SC2CITRIC$Strain<-factor(SC2CITRIC$Strain,levels=c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX"))
SC2MALTO$Strain<-factor(SC2MALTO$Strain,levels=c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX"))

SC6TSB$Strain<-factor(SC6TSB$Strain,levels=c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX"))
SC6CITRIC$Strain<-factor(SC6CITRIC$Strain,levels=c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX"))
SC6MALTO$Strain<-factor(SC6MALTO$Strain,levels=c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX"))


#Yield
SC2TSB_Avs<-summarySE(SC2TSB,measurevar="Yield.mg.g",groupvars=c("Strain"),na.rm=TRUE)
SC2TSB_Avs

SC6TSB_Avs<-summarySE(SC6TSB,measurevar="Yield.mg.g",groupvars=c("Strain"),na.rm=TRUE)
SC6TSB_Avs

SC2CITRIC_Avs<-summarySE(SC2CITRIC,measurevar="Yield.mg.g",groupvars=c("Strain"),na.rm=TRUE)
SC2CITRIC_Avs

SC6CITRIC_Avs<-summarySE(SC6CITRIC,measurevar="Yield.mg.g",groupvars=c("Strain"),na.rm=TRUE)
SC6CITRIC_Avs

SC2MALTO_Avs<-summarySE(SC2MALTO,measurevar="Yield.mg.g",groupvars=c("Strain"),na.rm=TRUE)
SC2MALTO_Avs

SC6MALTO_Avs<-summarySE(SC6MALTO,measurevar="Yield.mg.g",groupvars=c("Strain"),na.rm=TRUE)
SC6MALTO_Avs

#Dry weight
SC2TSB_Avs<-summarySE(SC2TSB,measurevar="Weight.g.L",groupvars=c("Strain"),na.rm=TRUE)
SC2TSB_Avs

SC6TSB_Avs<-summarySE(SC6TSB,measurevar="Weight.g.L",groupvars=c("Strain"),na.rm=TRUE)
SC6TSB_Avs

SC2CITRIC_Avs<-summarySE(SC2CITRIC,measurevar="Weight.g.L",groupvars=c("Strain"),na.rm=TRUE)
SC2CITRIC_Avs

SC6CITRIC_Avs<-summarySE(SC6CITRIC,measurevar="Weight.g.L",groupvars=c("Strain"),na.rm=TRUE)
SC6CITRIC_Avs

SC2MALTO_Avs<-summarySE(SC2MALTO,measurevar="Weight.g.L",groupvars=c("Strain"),na.rm=TRUE)
SC2MALTO_Avs

SC6MALTO_Avs<-summarySE(SC6MALTO,measurevar="Weight.g.L",groupvars=c("Strain"),na.rm=TRUE)
SC6MALTO_Avs

#Figure theme
theme_Publication <- function(base_size=18, base_family="") {
     library(grid)
      library(ggthemes)
      (theme_foundation(base_size=base_size, base_family=base_family)
       + theme(plot.title = element_text(face = "bold",
                                         size = rel(1.2), hjust = 0.5),
               text = element_text(),
               panel.background = element_rect(colour = NA),
               plot.background = element_rect(colour = NA),
               panel.border = element_rect(colour = NA),
               axis.title = element_text(face = "bold",size = rel(1)),
               axis.title.y = element_text(angle=90,vjust =2),
               axis.title.x = element_text(vjust = -0.2),
               axis.text.x=element_text(face = "bold"),
               axis.text = element_text(), 
               axis.line = element_line(colour="black"),
               axis.ticks = element_line(),
               panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               legend.key = element_rect(colour = NA),
               legend.position = c("none"),
               legend.direction = "vertical",
               legend.key.size= unit(0.04, "cm"),
               legend.spacing = unit(0, "cm"),
               legend.title = element_text(face="italic"),
               legend.background = element_rect(fill="transparent"),
               plot.margin=unit(c(10,5,5,5),"mm"),
               strip.background=element_rect(colour="#f0f0f0",fill="#f0f0f0"),
               strip.text = element_text(face="bold")
          ))
      
}

scale_fill_Publication <- function(...){
      library(scales)
      discrete_scale("fill","Publication",manual_pal(values = c("#7fc97f","#386cb0","#fdb462","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)

}

scale_colour_Publication <- function(...){
      library(scales)
      discrete_scale("colour","Publication",manual_pal(values = c("#7fc97f","#386cb0","#fdb462","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)

}



#Yield
labels<-c("SC2 -\npIJ10257","SC2 -\n0130","SC2 -\n1550","SC2 -\n1980","SC2 -\nglpX")

A<-ggplot(data=SC2TSB,aes(x=Strain,y=Yield.mg.g, fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,25)+labs(title = "TSB", x = "Strain", y = "Yield (mg/g)", fill = "Strain")+ annotate("text", x = "SC2-1550", y = 20, label = "*",size=6)+ annotate("text", x = "SC2-1980", y = 20, label = "**",size=6)+ annotate("text", x = "SC2-glpX", y = 20, label = "**",size=6)
A
A<-grid.arrange(A+scale_fill_Publication()+ theme_Publication(),nrow=1)
A

modelA <- lm(Yield.mg.g ~ Strain, data = SC2TSB)
modelA
summary(modelA)




labels<-c("SC2 -\npIJ10257","SC2 -\n0130","SC2 -\n1550","SC2 -\n1980","SC2 -\nglpX")
B<-ggplot(data=SC2CITRIC,aes(x=Strain,y=Yield.mg.g, fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,1.5)+labs(title = "NMMP + 50mM Citric Acid", x = "Strain", y = "Yield (mg/g)", fill = "Strain")+ annotate("text", x = "SC2-1550", y = .8, label = "*",size=6)
B
B<-grid.arrange(B+scale_fill_Publication()+ theme_Publication(),nrow=1)
B

modelB <- lm(Yield.mg.g ~ Strain, data = SC2CITRIC)
modelB
summary(modelB)

labels<-c("SC6 -\npIJ10257","SC6 -\n0130","SC6 -\n1550","SC6 -\n1980","SC6 -\nglpX")
C<-ggplot(data=SC6TSB,aes(x=Strain,y=Yield.mg.g, fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,20)+labs(title = "TSB", x = "Strain", y = "Yield (mg/g)", fill = "Strain")+ annotate("text", x = "SC6-1550", y = 15, label = "**",size=6)
C
C<-grid.arrange(C+scale_fill_Publication()+ theme_Publication(),nrow=1)
C

modelC <- lm(Yield.mg.g ~ Strain, data = SC6TSB)
modelC
summary(modelC)

labels<-c("SC6 -\npIJ10257","SC6 -\n0130","SC6 -\n1550","SC6 -\n1980","SC6 -\nglpX")
D<-ggplot(data=SC6CITRIC,aes(x=Strain,y=Yield.mg.g, fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,2)+labs(title = "NMMP + 50mM Citric Acid", x = "Strain", y = "Yield (mg/g)", fill = "Strain")+ annotate("text", x = "SC6-glpX", y = 1.8, label = "*",size=6)
D
D<-grid.arrange(D+scale_fill_Publication()+ theme_Publication(),nrow=1)
D

modelD <- lm(Yield.mg.g ~ Strain, data = SC6CITRIC)
modelD
summary(modelD)

labels<-c("SC2 -\npIJ10257","SC2 -\n0130","SC2 -\n1550","SC2 -\n1980","SC2 -\nglpX")
E<-ggplot(data=SC2MALTO,aes(x=Strain,y=Yield.mg.g, fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,2.5)+labs(title = "NMMP + 50mM Maltodextrin", x = "Strain", y = "Yield (mg/g)", fill = "Strain")+ annotate("text", x = "SC2-0130", y = 2.4, label = "**",size=6)
E
E<-grid.arrange(E+scale_fill_Publication()+ theme_Publication(),nrow=1)
E

modelE <- lm(Yield.mg.g ~ Strain, data = SC2MALTO)
modelE
summary(modelE)

labels<-c("SC6 -\npIJ10257","SC6 -\n0130","SC6 -\n1550","SC6 -\n1980","SC6 -\nglpX")
F<-ggplot(data=SC6MALTO,aes(x=Strain,y=Yield.mg.g, fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,2.5)+labs(title = "NMMP + 50mM Maltodextrin", x = "Strain", y = "Yield (mg/g)", fill = "Strain")
F
F<-grid.arrange(F+scale_fill_Publication()+ theme_Publication(),nrow=1)
F

modelF <- lm(Yield.mg.g ~ Strain, data = SC6MALTO)
modelF
summary(modelF)




#Dry weight
labels<-c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX")
E<-ggplot(data=SC2TSB,aes(x=Strain,y=Sample.Weight..g.L., fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,8)+labs(title = "", x = "Strain", y = "Dry Weight (g/L)", fill = "Strain")+ annotate("text", x = "SC2-1550", y = 6.5, label = "*",size=6)+ annotate("text", x = "SC2-1980", y = 6.5, label = "***",size=6) + annotate("text", x = "SC2-glpX", y = 6.5, label = "**",size=6)
E
E<-grid.arrange(E+scale_fill_Publication()+ theme_Publication(),nrow=1)
E

modelE <- lm(Sample.Weight..g.L. ~ Strain, data = SC2TSB)
modelE
summary(modelE)

labels<-c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX")
F<-ggplot(data=SC2CITRIC,aes(x=Strain,y=Sample.Weight..g.L., fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,10)+labs(title = "", x = "Strain", y = "Dry Weight (g/L)", fill = "Strain")+ annotate("text", x = "SC2-1980", y = 9, label = "**",size=6)
F
F<-grid.arrange(F+scale_fill_Publication()+ theme_Publication(),nrow=1)
F

modelF <- lm(Sample.Weight..g.L. ~ Strain, data = SC2CITRIC)
modelF
summary(modelF)

labels<-c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX")
G<-ggplot(data=SC6TSB,aes(x=Strain,y=Sample.Weight..g.L., fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,10)+labs(title = "", x = "Strain", y = "Dry Weight (g/L)", fill = "Strain")
G
G<-grid.arrange(G+scale_fill_Publication()+ theme_Publication(),nrow=1)
G

modelG <- lm(Sample.Weight..g.L. ~ Strain, data = SC6TSB)
modelG
summary(modelG)

labels<-c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX")
H<-ggplot(data=SC6CITRIC,aes(x=Strain,y=Sample.Weight..g.L., fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,10)+labs(title = "", x = "Strain", y = "Dry Weight (g/L)", fill = "Strain")+ annotate("text", x = "SC6-1550", y = 6.5, label = "**",size=6)+ annotate("text", x = "SC6-1980", y = 6.5, label = "*",size=6) + annotate("text", x = "SC6-glpX", y = 6.5, label = "**",size=6)

H
H<-grid.arrange(H+scale_fill_Publication()+ theme_Publication(),nrow=1)
H

modelH <- lm(Sample.Weight..g.L. ~ Strain, data = SC6CITRIC)
modelH
summary(modelH)


#Clav
labels<-c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX")
I<-ggplot(data=SC2TSB,aes(x=Strain,y=Clav..g.L., fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,0.15)+labs(title = "", x = "Strain", y = "Clav (g/L)", fill = "Strain")
I
I<-grid.arrange(I+scale_fill_Publication()+ theme_Publication(),nrow=1)
I

modelI <- lm(Clav..g.L. ~ Strain, data = SC2TSB)
modelI
summary(modelI)




labels<-c("SC2-pIJ10257","SC2-0130","SC2-1550","SC2-1980","SC2-glpX")
J<-ggplot(data=SC2CITRIC,aes(x=Strain,y=Clav..g.L., fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,0.01)+labs(title = "", x = "Strain", y = "Clav (g/L)", fill = "Strain")+ annotate("text", x = "SC2-0130", y = 0.005, label = "*",size=6)+ annotate("text", x = "SC2-1550", y = 0.005, label = "*",size=6)

J
J<-grid.arrange(J+scale_fill_Publication()+ theme_Publication(),nrow=1)
J

modelJ <- lm(Clav..g.L. ~ Strain, data = SC2CITRIC)
modelJ
summary(modelJ)

labels<-c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX")
K<-ggplot(data=SC6TSB,aes(x=Strain,y=Clav..g.L., fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,0.1)+labs(title = "", x = "Strain", y = "Clav (g/L)", fill = "Strain")+ annotate("text", x = "SC6-0130", y = 0.065, label = "*",size=6)+ annotate("text", x = "SC6-1550", y = 0.065, label = "***",size=6)
K
K<-grid.arrange(K+scale_fill_Publication()+ theme_Publication(),nrow=1)
K

modelK <- lm(Clav..g.L. ~ Strain, data = SC6TSB)
modelK
summary(modelK)

labels<-c("SC6-pIJ10257","SC6-0130","SC6-1550","SC6-1980","SC6-glpX")
L<-ggplot(data=SC6CITRIC,aes(x=Strain,y=Clav..g.L., fill=factor(Strain))) +
  geom_boxplot(alpha=0.5) + 
  scale_x_discrete(labels= labels) + 
  geom_point(position=position_jitterdodge(),alpha=0.8,size=5,shape=21) +ylim(0,0.01)+labs(title = "", x = "Strain", y = "Clav (g/L)", fill = "Strain")+ annotate("text", x = "SC6-glpX", y = 0.0095, label = "*",size=6)
L
L<-grid.arrange(L+scale_fill_Publication()+ theme_Publication(),nrow=1)
L

modelL <- lm(Clav..g.L. ~ Strain, data = SC6CITRIC)
modelL
summary(modelL)


#################################################





data<-read.csv("/Users/johnbbruce/Dropbox/Hoskisson Lab/Clav Figures + Data/Maltodextrin/Clav Combined Data for figures.csv")
head(data) 
data



SC2<- subset(data, Strain %in% c("SC2-0130","SC2-1550","SC2-1980","SC2-glpX"), select=c(Media,Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g,Relative.Yield,Relative.Yield.neg))
SC2

SC6<- subset(data, Strain %in% c("SC6-0130","SC6-1550","SC6-1980","SC6-glpX"), select=c(Media,Strain,Weight.g.L,Predicted.Clav.mg.L,Yield.mg.g,Relative.Yield,Relative.Yield.neg))
SC6

SC2_Avs<-summarySE(SC2,measurevar="Relative.Yield.neg",groupvars=c("Strain","Media"),na.rm=TRUE)
SC2_Avs

SC6_Avs<-summarySE(SC6,measurevar="Relative.Yield.neg",groupvars=c("Strain","Media"),na.rm=TRUE)
SC6_Avs



#Relative Yield
labels<-c("SC2 -\n0130","SC2 -\n1550","SC2 -\n1980","SC2 -\nglpX")
A<-ggplot(data=SC2_Avs,aes(x=Strain,y=Relative.Yield.neg, fill=factor(Media))) +
  geom_bar(position="dodge",stat="identity")  +
  scale_x_discrete(labels= labels)+geom_errorbar(aes(ymin=Relative.Yield.neg-se, ymax=Relative.Yield.neg+se),alpha=.5, width=.2, colour="black",position=position_dodge(.9)) +ylim(-1,1)+labs(title = "", x = "Strain", y = "Yield Relative to Empty Vector Control", fill = "Media")
A
A<-grid.arrange(A+scale_fill_Publication()+ theme_Publication(),nrow=1)
A

labels<-c("SC6 -\n0130","SC6 -\n1550","SC6 -\n1980","SC6 -\nglpX")
B<-ggplot(data=SC6_Avs,aes(x=Strain,y=Relative.Yield.neg, fill=factor(Media))) +
  geom_bar(position="dodge",stat="identity")  +
  scale_x_discrete(labels= labels)+geom_errorbar(aes(ymin=Relative.Yield.neg-se, ymax=Relative.Yield.neg+se),alpha=.5, width=.2, colour="black",position=position_dodge(.9)) +ylim(-1,1.4)+labs(title = "", x = "Strain", y = "Yield Relative to Empty Vector Control", fill = "Media")
B
B<-grid.arrange(B+scale_fill_Publication()+ theme_Publication(),nrow=1)
B

theme_Publication <- function(base_size=18, base_family="") {
     library(grid)
      library(ggthemes)
      (theme_foundation(base_size=base_size, base_family=base_family)
       + theme(plot.title = element_text(face = "bold",
                                         size = rel(1.2), hjust = 0.5),
               text = element_text(),
               panel.background = element_rect(colour = NA),
               plot.background = element_rect(colour = NA),
               panel.border = element_rect(colour = NA),
               axis.title = element_text(face = "bold",size = rel(1)),
               axis.title.y = element_text(angle=90,vjust =2),
               axis.title.x = element_text(vjust = -0.2),
               axis.text.x=element_text(face = "bold"),
               axis.text = element_text(), 
               axis.line = element_line(colour="black"),
               axis.ticks = element_line(),
               panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               legend.key = element_rect(colour = NA),
               legend.position = c("none"),
               legend.direction = "vertical",
               legend.key.size= unit(0.5, "cm"),
               legend.spacing = unit(0, "cm"),
               legend.title = element_blank(),
               legend.background = element_rect(fill="transparent"),
               plot.margin=unit(c(10,5,5,5),"mm"),
               strip.background=element_rect(colour="#f0f0f0",fill="#f0f0f0"),
               strip.text = element_text(face="bold")
          ))
      
}

scale_fill_Publication <- function(...){
      library(scales)
      discrete_scale("fill","Publication",manual_pal(values = c("#7fc97f","#386cb0","#fdb462","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)

}

scale_colour_Publication <- function(...){
      library(scales)
      discrete_scale("colour","Publication",manual_pal(values = c("#7fc97f","#386cb0","#fdb462","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)

}
