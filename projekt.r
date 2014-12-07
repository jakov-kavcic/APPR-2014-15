# 2. faza: Obdelava, uvoz in ciscenje podatkov
source("uvoz/uvoz.r")

#Prikaz grobih rezultatov iz Floride.
library(plotrix)

rezine <- c(floridaGlasovi[68,"BUSH"],
            floridaGlasovi[68,"GORE"],
            floridaGlasovi[68,"NADER"],
            floridaGlasovi[68,"OTHER"])

oznake <- c("Bush","Al Gore","Nader","ostali")

pct <- round(rezine/sum(rezine)*100,2)

oznake <- paste(oznake,pct)
oznake <- paste(oznake,"%",sep="")

pdf("slike/Tortni_prikaz_Florida.pdf")
tortniFlorida <-  pie3D(rezine,
                        radius=1,
                        start=0,
                        labelrad=1.6,
                        height=0.05,
                        labels=oznake,
                        explode=0.1,
                        main="Rezultati: Florida",
                        pty="s",
                        shade=0.6)
dev.off()


# 3. faza: Analiza in vizualizacija podatkov
#source("vizualizacija/vizualizacija.r")

# 4. faza: Napredna analiza podatkov
#source("analiza/analiza.r")

# cat("Koncano.\n")

