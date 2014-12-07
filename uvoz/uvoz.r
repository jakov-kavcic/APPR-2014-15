# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvoziCounty <- function() {
  return(read.csv("podatki/CY/COUNTY.csv", 
                      sep = ",",
                      dec = ".", 
                      as.is = TRUE,
                      header = TRUE,
                      na.strings = ".",
                      row.names = 1,
                      fileEncoding = "Windows-1250"))
}

# Zapisemo podatke v razpredelnico county.
cat("Ustvarim tabelo z vsemi podatki.\n")
county <- uvoziCounty()

county$STATE <- gsub("\\?", " ", county$STATE)
county$COUNTY <- gsub("\\?", " ", county$COUNTY)

# Manjkajoce podatke sem zamenjal z 0.
county$NOTA <- as.numeric(county$NOTA)
county[is.na(county)] <- 0

#Zdruzil sem lokalne kandidate v eden stolpec OTHER.
county <- data.frame(county[,1:9],OTHER=apply(county[,10:23],1,sum))

# Razdelim rezultate v procentih in odanih glasovih.
procenti <- data.frame(county[1],county[2],PBUSH=county$PBUSH,PGORE=county$PGORE,PNADER=county$PNADER,POTHER=county$POTHER)
odaniGlasovi <- data.frame(county[1],county[2],county[,7:10])

#Grobi rezultati Florida.GCVPk8H6
floridaLista <- which(county[,1]=="Florida")
floridaProcenti <- data.frame(county[floridaLista,2:6])
rownames(floridaProcenti) <- NULL
floridaGlasovi <- data.frame("COUNTY"=county[floridaLista,2],county[floridaLista,7:10])
rownames(floridaGlasovi) <- NULL

floridaGlasovi <- rbind(floridaGlasovi,data.frame(
  "COUNTY"="Vsota oddanih glasov", 
  "BUSH" = sum(floridaGlasovi$BUSH) , 
  "GORE" = sum(floridaGlasovi$GORE), 
  "NADER"= sum(floridaGlasovi$NADER),
  "OTHER"= sum(floridaGlasovi$OTHER)))

moznosti <- c("Zmagal Bush.","Zmagal Al Gore.","Zmagal Nader.","Zmagal nekdo drugi.")
zmagovalec <- character(length(floridaProcenti$BUSH))

bushZmagal <- c(floridaGlasovi$BUSH>floridaGlasovi$GORE)
goreZmagal <- c(floridaGlasovi$GORE>floridaGlasovi$BUSH)

zmagovalec[bushZmagal] <- "Zmagal Bush."
zmagovalec[goreZmagal] <- "Zmagal Al Gore."

Zmagovalec <- factor(zmagovalec, levels=moznosti, ordered=TRUE)

floridaGlasovi <- data.frame(floridaGlasovi,"ZMAGOVALEC" = Zmagovalec)








