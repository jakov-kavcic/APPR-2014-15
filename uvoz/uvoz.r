# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvoziCounty <- function() {
  return(read.csv("podatki/CY/COUNTY.csv", sep = ",",dec = ".", as.is = TRUE,
                      header = TRUE,
                      na.strings = ".",
                      row.names = 1,
                      fileEncoding = "Windows-1250"))
}

# Zapisemo podatke v razpredelnico county.
cat("Zapisem celotne podatke o volitvah\n")
county <- uvoziCounty()

# Manjkajoce podatke sem zamenjal z 0.
county$NOTA <- as.numeric(county$NOTA)
county[is.na(county)] <- 0

#Zdruzil sem lokalne kandidate v eden stolpec OTHER.
county <- data.frame(county[,1:9],OTHER=apply(county[,9:23],1,sum))




# Razdelim rezultate v procentih in odanih glasovih.
procenti <- data.frame(county[1],county[2],PBUSH=county$PBUSH,PGORE=county$PGORE,PNADER=county$PNADER,POTHER=county$POTHER)

odaniGlasovi <- data.frame(county[1],county[2],county[,7:10])














