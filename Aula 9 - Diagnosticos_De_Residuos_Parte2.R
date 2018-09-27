> install.packages("lmtest")
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/lmtest_0.9-36.zip'
Content type 'application/zip' length 359253 bytes (350 KB)
downloaded 350 KB

package 'lmtest' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Renata\AppData\Local\Temp\RtmpYjWt4n\downloaded_packages
> install.packages("aTSA")
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/aTSA_3.1.2.zip'
Content type 'application/zip' length 181302 bytes (177 KB)
downloaded 177 KB

package 'aTSA' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Renata\AppData\Local\Temp\RtmpYjWt4n\downloaded_packages
> library(lmtest)
Carregando pacotes exigidos: zoo

Attaching package: 'zoo'

The following objects are masked from 'package:base':
  
  as.Date, as.Date.numeric

> library(aTSA)

Attaching package: 'aTSA'

The following object is masked from 'package:graphics':
  
  identify

> library(agricolae)
> library(normtest)
> library(readxl)
> data(jocci)
> View(jocci)
> JOCCI <- as.data.frame(jocci)
> joccits <- ts(JOCCI$dy,start = 1959,frequency = 12)
> plot(joccits, main="Índice Jocci", xlab="Ano", ylab="Indice")
> ar6model <- dy~dy1+dy2+dy3+dy4+dy5+dy6
> ar5model <- dy~dy1+dy2+dy3+dy4+dy5
> ar4model <- dy~dy1+dy2+dy3+dy4
> ar3model <- dy~dy1+dy2+dy3
> ar2model <- dy~dy1+dy2
> ar1model <- dy~dy1
> TesteBGAR6 <- bgtest(ar6model,data=JOCCI)
> TesteBGAR5 <- bgtest(ar5model,data=JOCCI)
> TesteBGAR4 <- bgtest(ar4model,data=JOCCI)
> TesteBGAR3 <- bgtest(ar3model,data=JOCCI)
> TesteBGAR2 <- bgtest(ar2model,data=JOCCI)
> TesteBGAR1 <- bgtest(ar1model,data=JOCCI)
> P_Valores_BG <- c(TesteBGAR6$p.value,
                    + TesteBGAR5$p.value,
                    + TesteBGAR4$p.value,
                    + TesteBGAR3$p.value,
                    + TesteBGAR2$p.value,
                    + TesteBGAR1$p.value)
> Modelos <- c("ar6model","ar5model","ar4model","ar3model","ar2model","ar1model")
> Resultados <- data.frame(Modelos,P_Valores_BG)
> View(Resultados)
> TesteReset6 <- resettest(ar6model,data=jocci)
Error in model.matrix.formula(formula, data = data) : 
  data must be a data.frame
> TesteReset6 <- resettest(ar6model,data=JOCCI)
> TesteReset5 <- resettest(ar5model,data=JOCCI)
> TesteReset4 <- resettest(ar4model,data=JOCCI)
> TesteReset3 <- resettest(ar3model,data=JOCCI)
> TesteReset2 <- resettest(ar2model,data=JOCCI)
> TesteReset1 <- resettest(ar1model,data=JOCCI)
> P_Valores_RESET <- c(TesteReset6$p.value,
                       + TesteReset5$p.value,
                       + TesteReset4$p.value,
                       + TesteReset4$p.value,
                       + TesteReset3$p.value,
                       + TesteReset2$p.value,
                       + TesteReset1$p.value)
> Resultados <- data.frame(Modelos,P_Valores_BG, P_Valores_RESET)
Error in data.frame(Modelos, P_Valores_BG, P_Valores_RESET) : 
  arguments imply differing number of rows: 6, 7
> TesteReset6 <- resettest(ar6model,data=jocci)
Error in model.matrix.formula(formula, data = data) : 
  data must be a data.frame
> P_Valores_RESET <- c(TesteReset6$p.value,
                       + TesteReset5$p.value,
                       + TesteReset5$p.value,
                       + TesteReset4$p.value,
                       + TesteReset3$p.value,
                       + TesteReset2$p.value,
                       + TesteReset1$p.value)
> Resultados <- data.frame(Modelos,P_Valores_BG, P_Valores_RESET)
Error in data.frame(Modelos, P_Valores_BG, P_Valores_RESET) : 
  arguments imply differing number of rows: 6, 7
> P_Valores_RESET <- c(TesteReset6$p.value,
                       + TesteReset5$p.value,
                       + TesteReset4$p.value,
                       + TesteReset3$p.value,
                       + TesteReset2$p.value,
                       + TesteReset1$p.value)
> Resultados <- data.frame(Modelos,P_Valores_BG, P_Valores_RESET)
> View(Resultados)
> variacao_PIB <- read.table("c:/Econometria/variacao.xls", header = T)
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
  In file(file, "rt") :
  cannot open file 'c:/Econometria/variacao.xls': No such file or directory
> variacao_PIB <- read.table("c:/EconometriaA/variacao.xls", header = T) 
> variacao_PIB <- as.data.frame(variacao_PIB[,-1])
> AR1_VAR <- arima(variacao_PIB,c(1,0,0))
> AR2_VAR <- arima(variacao_PIB,c(2,0,0))
> arch.test(AR1_VAR)
ARCH heteroscedasticity test for residuals 
alternative: heteroscedastic 

Portmanteau-Q test: 
  order    PQ p.value
[1,]     4  3.05   0.550
[2,]     8  4.67   0.793
[3,]    12 13.82   0.312
[4,]    16 15.90   0.460
[5,]    20 19.80   0.470
[6,]    24 22.47   0.551
Lagrange-Multiplier test: 
  order     LM  p.value
[1,]     4 21.400 8.69e-05
[2,]     8  8.049 3.28e-01
[3,]    12  2.768 9.93e-01
[4,]    16  1.430 1.00e+00
[5,]    20  0.325 1.00e+00
[6,]    24  0.137 1.00e+00
> save.image("C:/EconometriaA/AULA 9/Comandos.RData")