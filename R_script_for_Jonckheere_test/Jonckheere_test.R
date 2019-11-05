#JONCKHEERE'S TREND TEST FOR SUPPLEMENTARY TABLES 5 AND 6



#BEFORE RUNNING THE SCRIPT,
#LOAD THE DATA FROM THE CSV FILE
#IN THE SAME FOLDER AS THIS SCRIPT
#NAMED AFTER THE VARIABLES IN df_seq.
#P-VALUES MUST THEN BE ADJUSTED BY HOLM-BONFERRONI CORRECTION

library(clinfun)

###TEST INDEPENDENCE BETWEEN ANCESTOR AND THE MAX GENERATION
###REACHED BY ITS PROGENY. 

#SLAM-HSC 24h and 48h

df_seq <- list(P24hSLAM_HSC, P48hSLAM_HSC, P_ILs24hSLAM_HSC,
               P_ILs48hSLAM_HSC)
df_labs <- list('P24hSLAM_HSC', 'P48hSLAM_HSC', 'P_ILs24hSLAM_HSC',
                'P_ILs48hSLAM_HSC')
for (k in c(1:4)){
  df <- df_seq[[k]]
  colnames(df)[4] <- "SCA1"
  cond <- df_labs[[k]]
  g <- df$maxdd
  print(cond)
  
  alt_h <- "two.sided"
  x <- df$ckit
  test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
  print('ckit')
  print(alt_h)
  print(test)

  x <- df$SCA1
  test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
  print('SCA-1')
  print(alt_h)
  print(test)

  x <- df$CD48
  test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
  print('CD48')
  print(alt_h)
  print(test)  
}

###TEST INDEPENDENCE BETWEEN ANCESTOR AND PRESENCE,
###AMONG ITS PROGENY, OF A CERTAIN CELL TYPE 

#SLAM-HSC 24h and 48h

df_seq <- list(P24hSLAM_HSC, P48hSLAM_HSC, P_ILs24hSLAM_HSC,
               P_ILs48hSLAM_HSC)
df_labs <- list('P24hSLAM_HSC', 'P48hSLAM_HSC', 'P_ILs24hSLAM_HSC',
                'P_ILs48hSLAM_HSC')
classes = list('SLAM-HSC', 'SLAM+ MEP')

for (k in c(1:4)){
  df <- df_seq[[k]]
  colnames(df)[4] <- "SCA1"
  cond <- df_labs[[k]]
  
  for (h in c(1:2)){
    g <- data.matrix(df[classes[[h]]])[,]
    if((all(g==0)) || (all(g==1))) next
    
    print(cond)
    print(classes[[h]])
    
    alt_h <- "two.sided"
    x <- df$ckit
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('ckit')
    print(alt_h)
    print(test)
    
    x <- df$SCA1
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('SCA-1')
    print(alt_h)
    print(test)
    
    x <- df$CD48
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('CD48')
    print(alt_h)
    print(test)
  }
}



#ST-HSC 24h

df_seq <- list(P24hST_HSC, P_ILs24hST_HSC)
df_labs <- list('P24hST_HSC', 'P_ILs24hST_HSC')
classes = list('SLAM-HSC')

for (k in c(1:2)){
  df <- df_seq[[k]]
  colnames(df)[4] <- "SCA1"
  cond <- df_labs[[k]]
  
  for (h in c(1:1)){
    g <- data.matrix(df[classes[[h]]])[,]
    if((all(g==0)) || (all(g==1))) next
    
    print(cond)
    print(classes[[h]])
    
    x <- df$SCA1
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('SCA-1')
    print(alt_h)
    print(test)
    
    x <- df$CD48
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('CD48')
    print(alt_h)
    print(test)
  }
}



#ST-HSC 48h

df_seq <- list(P48hST_HSC, P_ILs48hST_HSC)
df_labs <- list('P48hST_HSC', 'P_ILs48hST_HSC')
classes = list('SLAM-HSC', 'GMP')

for (k in c(1:2)){
  df <- df_seq[[k]]
  colnames(df)[4] <- "SCA1"
  cond <- df_labs[[k]]
  
  for (h in c(1:1)){
    g <- data.matrix(df[classes[[h]]])[,]
    if((all(g==0)) || (all(g==1))) next
    
    print(cond)
    print(classes[[h]])
    
    x <- df$SCA1
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('SCA-1')
    print(alt_h)
    print(test)
    
    x <- df$CD48
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('CD48')
    print(alt_h)
    print(test)
  }
}



#MPP 48h P

df_seq <- list(P48hMPP)
df_labs <- list('P48hMPP')
classes = list('GMP', 'MEP')

for (k in c(1:1)){
  df <- df_seq[[k]]
  colnames(df)[4] <- "SCA1"
  cond <- df_labs[[k]]
  
  for (h in c(1:2)){
    g <- data.matrix(df[classes[[h]]])[,]
    if((all(g==0)) || (all(g==1))) next
    
    print(cond)
    print(classes[[h]])
    
    alt_h <- "two.sided"
    x <- df$ckit
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('ckit')
    print(alt_h)
    print(test)
    
    x <- df$SCA1
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('SCA-1')
    print(alt_h)
    print(test)
    
    x <- df$Flt3
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('Flt3')
    print(alt_h)
    print(test)
  }
}



#MPP 48h P+ILs

df_seq <- list(P_ILs48hMPP)
df_labs <- list('P_ILs48hMPP')
classes = list('GMP')

for (k in c(1:1)){
  df <- df_seq[[k]]
  colnames(df)[4] <- "SCA1"
  cond <- df_labs[[k]]
  
  for (h in c(1:1)){
    g <- data.matrix(df[classes[[h]]])[,]
    if((all(g==0)) || (all(g==1))) next
    
    print(cond)
    print(classes[[h]])
    
    alt_h <- "two.sided"
    x <- df$ckit
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('ckit')
    print(alt_h)
    print(test)
    
    x <- df$SCA1
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('SCA-1')
    print(alt_h)
    print(test)
    
    x <- df$Flt3
    test <- jonckheere.test(x, g, alternative = alt_h, nperm=250000)
    print('Flt3')
    print(alt_h)
    print(test)
  }
}