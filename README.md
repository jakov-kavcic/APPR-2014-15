# Analiza podatkov s programom R, 2014/15

Avtor: Jakov Kavčič

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

Tema mojega projekta so ameriške predsedniške volitve, ki so potekale leta 2000. V drugi krog volitev sta prisla Albert Arnold "Al" Gore, ki je bil podprecednik Bill Clintonu, in George W. Bush, ki pa je sin George H. W. Busha. Odlocil sem se prav za te volitve, saj so pokazale pomankljivosti ameriškega volilnega procesa. 

Moj cilj je prikazati razporeditev zveznih držav med temi dvemi kandidati in tudi št. ljudi, ki je glasovalo za posameznega kandidata. 

Podatke, ki jih bom uporabljal sem našel na spletni strani od American university. Podatki sami se nahajajo na naslednjem URL-ju:
- http://www.american.edu/spa/ccps/Data-Sets.cfm (13.11.2014)

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
