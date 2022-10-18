
// Creating tables
Table DasarMateri {
  id init [pk, increment] // auto-increment
  Pengertian varchar
  JenisStatistika varchar
  JenisData varchar
  PopulasidanSampel varchar
  created_at timestamp
}

Table PengertianStatistika {
  pengertian_statik varchar [pk]
  pengertian_statistika varchar
 }
 
Table JenisStatistika {
  Jenis_Statistika int [pk]
  pertama_StatistikaDeskriptif varchar
  kedua_StatistikaInferensial varchar
 }

Table JenisData {
  Jenis_Data int [pk]
  pertama_DataKualitatif varchar
  kedua_DataKuantitatif text
 }
 
Table DataKuantitatif {
  pertama_DataDiskrit varchar [pk]
  kedua_DataKontinu varchar
 }
 
// Creating references
// You can also define relaionship separately
// > many-to-one; < one-to-many; - one-to-one; <> many-to-many
Ref: DasarMateri.Pengertian > PengertianStatistika.pengertian_statik
Ref: DasarMateri.JenisStatistika > JenisStatistika.Jenis_Statistika
Ref: DasarMateri.JenisData > JenisData.Jenis_Data
Ref: JenisData.kedua_DataKuantitatif > DataKuantitatif.pertama_DataDiskrit

//----------------------------------------------//

//// -- LEVEL 2
//// -- Adding column settings
// Creating tables
Table PenyajianData {
  id init [pk, increment] // auto-increment
  TabelDistribusiFrekuensi varchar
  FrekuensiRelatifdanKumulatif varchar
  GrafikuntukDistribusiFrekuensi varchar
  created_at timestamp
}

Table FrekuensiRelatifdanKumulatif {
  Jenis_Frekuensi int [pk]
  pertama_FrekuensiRelatif blob
  kedua_FrekuensiKumulatif blob
}

Table GrafikuntukDistribusiFrekuensi {
  Jenis_Grafik int [pk]
  pertama_Histogram blob
  kedua_Poligon blob
  ketiga_Ogive blob
 }

// Creating references
// You can also define relaionship separately
// > many-to-one; < one-to-many; - one-to-one; <> many-to-many
Ref: PenyajianData.FrekuensiRelatifdanKumulatif > FrekuensiRelatifdanKumulatif.Jenis_Frekuensi
Ref: PenyajianData.GrafikuntukDistribusiFrekuensi > GrafikuntukDistribusiFrekuensi.Jenis_Grafik

//----------------------------------------------//

//// -- LEVEL 3
//// -- Adding column settings
// Creating tables
Table UkuranDispersi {
  id init [pk, increment] // auto-increment
  Rentang varchar
  Deviasiratarata varchar
  VariansidanDeviasiStandar varchar
  created_at timestamp
}

Table Deviasiratarata {
  Jenis_DataDeviasi int [pk]
  pertama_DeviasiratarataDatatunggal varchar
  kedua_DeviasiratarataDataberkelompok varchar
}

Table VariansidanDeviasiStandar {
  pertama_Variansi varchar [pk]
  kedua_DeviasiStandar varchar
 }

// Creating references
// You can also define relaionship separately
// > many-to-one; < one-to-many; - one-to-one; <> many-to-many
Ref: UkuranDispersi.Deviasiratarata > Deviasiratarata.Jenis_DataDeviasi
Ref: UkuranDispersi.VariansidanDeviasiStandar > VariansidanDeviasiStandar.pertama_Variansi

//----------------------------------------------//

//// -- LEVEL 4
//// -- Adding column settings
// Creating tables
Table UkuranKemiringandanKeruncingan {
  id init [pk, increment] // auto-increment
  UkuranKemiringan varchar
  UkuranKeruncingan varchar
  PersentildanDesil text
  created_at timestamp
}

Table UkuranKemiringan {
  Jenis_KoefisienKemiringan int [pk]
  pertama_KoefisienKemiringan_Modus varchar
  kedua_KoefisienKemiringan_Median varchar
  ketiga_KoefisienKemiringan_Kuartil varchar
}

Table UkuranKeruncingan {
  rumus_keruncingan varchar [pk]
 }

Table PersentildanDesil {
  pertama_Persentil varchar [pk]
  kedua_Desil varchar
 }

// Creating references
// You can also define relaionship separately
// > many-to-one; < one-to-many; - one-to-one; <> many-to-many
Ref: UkuranKemiringandanKeruncingan.UkuranKemiringan > UkuranKemiringan.Jenis_KoefisienKemiringan
Ref: UkuranKemiringandanKeruncingan.UkuranKeruncingan > UkuranKeruncingan.rumus_keruncingan
Ref: UkuranKemiringandanKeruncingan.PersentildanDesil > PersentildanDesil.pertama_Persentil

//----------------------------------------------//

//// -- LEVEL 5
//// -- Adding column settings
// Creating tables
Table UkuranPemusatan {
  id init [pk, increment] // auto-increment
  Mean varchar
  Median varchar
  Modus varchar
  Kuartil varchar
  created_at timestamp
}

Table Mean {
  Jenis_Mean int [pk]
  rumus_MeanDatatunggal varchar
  rumus_MeanDataberkelompok varchar
}

Table Median {
  Jenis_Median int [pk]
  rumus_MedianDatatunggal varchar
  rumus_MedianDataberkelompok varchar
 }
 
Table Modus {
  Jenis_Modus int [pk]
  rumus_ModusDatatunggal varchar
  rumus_ModusDataberkelompok varchar
 }

Table Kuartil {
  Jenis_Kuartil int [pk]
  pertama_Kuartilsatu varchar
  kedua_Kuartildua varchar
  ketiga_Kuartiltiga varchar
  rumus_MencariKuartilke blob
 }

// Creating references
// You can also define relaionship separately
// > many-to-one; < one-to-many; - one-to-one; <> many-to-many
Ref: UkuranPemusatan.Mean > Mean.Jenis_Mean
Ref: UkuranPemusatan.Median > Median.Jenis_Median
Ref: UkuranPemusatan.Modus > Modus.Jenis_Modus
Ref: UkuranPemusatan.Kuartil > Kuartil.Jenis_Kuartil