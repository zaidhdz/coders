
pacman::p_load(tidyverse, rebus, survey, srvyr, gridExtra, haven, stringr)

SDEMYCOEST320 <- read_dta(paste0(carpeta_enoe, "4T/limpia/sdemycoest419.dta"))


SDEMYCOEST320 <- SDEMYCOEST320 %>%  mutate(ent = str_pad(ent, 2, pad = "0"),
                                           sex=ifelse(sex==1,"Hombre",sex),
                                           sex=ifelse(sex==2,"Mujer",sex),
                                           niv_ins=ifelse(niv_ins==0,"No aplica",niv_ins),
                                           niv_ins=ifelse(niv_ins==1,"Primaria incompleta",niv_ins),
                                           niv_ins=ifelse(niv_ins==2,"Primaria completa",niv_ins),
                                           niv_ins=ifelse(niv_ins==3,"Secundaria completa",niv_ins),
                                           niv_ins=ifelse(niv_ins==4,"Medio superior y superior",niv_ins),
                                           niv_ins=ifelse(niv_ins==5,"No especificado",niv_ins),
                                           dur9c=ifelse(dur9c==0,"No aplica",dur9c),
                                           dur9c=ifelse(dur9c==1,"Ausentes temporales \n con vínculo laboral",dur9c),
                                           dur9c=ifelse(dur9c==2,"Menos de 15 horas",dur9c),
                                           dur9c=ifelse(dur9c==3,"De 15 a 24 horas",dur9c),
                                           dur9c=ifelse(dur9c==4,"De 25 a 34 horas",dur9c),
                                           dur9c=ifelse(dur9c==5,"De 35 a 39 horas",dur9c),
                                           dur9c=ifelse(dur9c==6,"De 40 a 48 horas",dur9c),
                                           dur9c=ifelse(dur9c==7,"De 49 a 56 horas",dur9c),
                                           dur9c=ifelse(dur9c==8,"Más de 56 horas",dur9c),
                                           dur9c=ifelse(dur9c==9,"No especificado",dur9c),
                                           emp_ppal=ifelse(emp_ppal==0,"No aplica",emp_ppal),
                                           emp_ppal=ifelse(emp_ppal==1,"Empleo informal",emp_ppal),
                                           emp_ppal=ifelse(emp_ppal==2,"Empleo formal",emp_ppal),
                                           eda12c=ifelse(eda12c==0,"No aplica",eda12c),
                                           eda12c=ifelse(eda12c==1,"De 15 a 19 años",eda12c),
                                           eda12c=ifelse(eda12c==2,"De 20 a 24 años",eda12c),
                                           eda12c=ifelse(eda12c==3,"De 25 a 29 años",eda12c),
                                           eda12c=ifelse(eda12c==4,"De 30 a 34 años",eda12c),
                                           eda12c=ifelse(eda12c==5,"De 35 a 39 años",eda12c),
                                           eda12c=ifelse(eda12c==6,"De 40 a 44 años",eda12c),
                                           eda12c=ifelse(eda12c==7,"De 45 a 49 años",eda12c),
                                           eda12c=ifelse(eda12c==8,"De 50 a 54 años",eda12c),
                                           eda12c=ifelse(eda12c==9,"De 55 años 59 años",eda12c),
                                           eda12c=ifelse(eda12c==10,"De 60 a 64 años",eda12c),
                                           eda12c=ifelse(eda12c==11,"De 65 años y más",eda12c),
                                           eda12c=ifelse(eda12c==12,"No especificado",eda12c),
                                           clase3=ifelse(clase3==0,"No aplica",clase3),
                                           clase3=ifelse(clase3==1,"Ocupado pleno",clase3),
                                           clase3=ifelse(clase3==2,"Ocupado sin pago",clase3),
                                           clase3=ifelse(clase3==3,"Ocupado ausente nexo laboral",clase3),
                                           clase3=ifelse(clase3==4,"Ocupado ausente con retorno",clase3),
                                           clase3=ifelse(clase3==5,"Desocupados Iniciadores",clase3),
                                           clase3=ifelse(clase3==6,"Desocupados con búsqueda",clase3),
                                           clase3=ifelse(clase3==7,"Desocupados Ausentes",clase3),
                                           medica5c=ifelse(medica5c==0,"No aplica",medica5c),
                                           medica5c=ifelse(medica5c==1,"Sin prestaciones",medica5c),
                                           medica5c=ifelse(medica5c==2,"Solo acceso a salud",medica5c),
                                           medica5c=ifelse(medica5c==3,"Acceso a salud y \n otras prestaciones",medica5c),
                                           medica5c=ifelse(medica5c==4,"No tiene acceso a salud pero si \n a otras prestaciones",medica5c),
                                           medica5c=ifelse(medica5c==5,"No especificado",medica5c),
                                           clase2=ifelse(clase2==0,"No aplica",clase2),
                                           clase2=ifelse(clase2==1,"Población ocupada",clase2),
                                           clase2=ifelse(clase2==2,"Población desocupada",clase2),
                                           clase2=ifelse(clase2==3,"Disponibles",clase2),
                                           clase2=ifelse(clase2==4,"No disponibles",clase2),
                                           ambito2=ifelse(ambito2==0,"No aplica",ambito2),
                                           ambito2=ifelse(ambito2==1,"Micronegocios",ambito2),
                                           ambito2=ifelse(ambito2==2,"Sin establecimiento",ambito2),
                                           ambito2=ifelse(ambito2==3,"Con establecimiento",ambito2),
                                           ambito2=ifelse(ambito2==4,"Pequeños establecimientos",ambito2),
                                           ambito2=ifelse(ambito2==5,"Medianos establecimientos",ambito2),
                                           ambito2=ifelse(ambito2==6,"Grandes establecimientos",ambito2),
                                           ambito2=ifelse(ambito2==7,"Gobierno",ambito2),
                                           ambito2=ifelse(ambito2==8,"Otros",ambito2),
                                           rama_est1=ifelse(rama_est1==0,"No aplica",rama_est1),
                                           rama_est1=ifelse(rama_est1==1,"Primario",rama_est1),
                                           rama_est1=ifelse(rama_est1==2,"Secundario",rama_est1),
                                           rama_est1=ifelse(rama_est1==3,"Terciario",rama_est1),
                                           rama_est1=ifelse(rama_est1==4,"No especificado",rama_est1),
                                           rama_est2=ifelse(rama_est2==0,"No aplica",rama_est2),
                                           rama_est2=ifelse(rama_est2==1,"Agricultura, ganadería, silvicultura, caza y pesca",rama_est2),
                                           rama_est2=ifelse(rama_est2==2,"Industria extractiva y de la electricidad",rama_est2),
                                           rama_est2=ifelse(rama_est2==3,"Industria manufacturera",rama_est2),
                                           rama_est2=ifelse(rama_est2==4,"Construcción",rama_est2),
                                           rama_est2=ifelse(rama_est2==5,"Comercio",rama_est2),
                                           rama_est2=ifelse(rama_est2==6,"Restaurantes y servicios de alojamiento",rama_est2),
                                           rama_est2=ifelse(rama_est2==7,"Transportes, comunicaciones, correo y almacenamiento",rama_est2),
                                           rama_est2=ifelse(rama_est2==8,"Servicios profesionales, financieros y corporativos",rama_est2),
                                           rama_est2=ifelse(rama_est2==9,"Servicios sociales",rama_est2),
                                           rama_est2=ifelse(rama_est2==10,"Servicios diversos",rama_est2),
                                           rama_est2=ifelse(rama_est2==11,"Gobierno y organismos internacionales",rama_est2),
                                           rama_est2=ifelse(rama_est2==12,"No especificado",rama_est2),
                                           eda7c=ifelse(eda7c==0,"No aplica",eda7c),
                                           eda7c=ifelse(eda7c==1,"De 14 a 19 años",eda7c),
                                           eda7c=ifelse(eda7c==2,"De 20 a 29 años",eda7c),
                                           eda7c=ifelse(eda7c==3,"De 30 a 39 años",eda7c),
                                           eda7c=ifelse(eda7c==4,"De 40 a 49 años",eda7c),
                                           eda7c=ifelse(eda7c==5,"De 50 a 59 años",eda7c),
                                           eda7c=ifelse(eda7c==6,"De 60 años y más",eda7c),
                                           eda7c=ifelse(eda7c==7,"Edad no especificado",eda7c),
                                           sub_o=ifelse(sub_o==0,"No es subocupado",sub_o),
                                           sub_o=ifelse(sub_o==1,"Sí es subocupado",sub_o),
                                           pos_ocu=ifelse(pos_ocu==0,"No aplica",pos_ocu),
                                           pos_ocu=ifelse(pos_ocu==1,"Subordinados y remunerados",pos_ocu),
                                           pos_ocu=ifelse(pos_ocu==2,"Empleadores",pos_ocu),
                                           pos_ocu=ifelse(pos_ocu==3,"Cuenta propia",pos_ocu),
                                           mh_fil2=ifelse(mh_fil2==2,"Trabajo doméstico remunerado",mh_fil2),
                                           mh_fil2=ifelse(mh_fil2==3,"Empresas, Gobierno e Instituciones4/",mh_fil2),
                                           mh_fil2=ifelse(mh_fil2==4,"Ámbito agropecuario",mh_fil2),
                                           mh_col=ifelse(mh_col==0,"No aplica",mh_col),
                                           p6d = ifelse(p6d==1, "IMSS",p6d),
                                           p6d = ifelse(p6d==2, "Hospital o clínica naval de PEMEX",p6d),
                                           p6d = ifelse(p6d==3, "ISSSTE",p6d),
                                           p6d = ifelse(p6d==4, "ISSSTE estatal",p6d),
                                           p6d = ifelse(p6d==5, "Otra institución médica",p6d),
                                           p6d = ifelse(p6d==6, "No recibe atención médica",p6d),
                                           p6d = ifelse(p6d==9, "No sabe",p6d),
                                           seg_soc=ifelse(seg_soc==0,"No aplica",seg_soc),
                                           seg_soc=ifelse(seg_soc==1,"Con acceso",seg_soc),
                                           seg_soc=ifelse(seg_soc==2,"Sin acceso",seg_soc),
                                           seg_soc=ifelse(seg_soc==3,"No especificado",seg_soc),
                                           eda19c=ifelse(eda19c==0,"No aplica",eda19c),
                                           eda19c=ifelse(eda19c==1,"Menores de 1 año",eda19c),
                                           eda19c=ifelse(eda19c==2,"De 1 a 4 años",eda19c),
                                           eda19c=ifelse(eda19c==3,"De 5 a 9 años",eda19c),
                                           eda19c=ifelse(eda19c==4,"De 10 a 11 años",eda19c),
                                           eda19c=ifelse(eda19c==5,"De 12 a 13 años",eda19c),
                                           eda19c=ifelse(eda19c==6,"De 14 a 19 años",eda19c),
                                           eda19c=ifelse(eda19c==7,"De 20 a 24 años",eda19c),
                                           eda19c=ifelse(eda19c==8,"De 25 a 29 años",eda19c),
                                           eda19c=ifelse(eda19c==9,"De 30 a 34 años",eda19c),
                                           eda19c=ifelse(eda19c==10,"De 35 a 39 años",eda19c),
                                           eda19c=ifelse(eda19c==11,"De 40 a 44 años",eda19c),
                                           eda19c=ifelse(eda19c==12,"De 45 a 49 años",eda19c),
                                           eda19c=ifelse(eda19c==13,"De 50 a 54 años",eda19c),
                                           eda19c=ifelse(eda19c==14,"De 55 a 59 años",eda19c),
                                           eda19c=ifelse(eda19c==15,"De 60 a 64 años",eda19c),
                                           eda19c=ifelse(eda19c==16,"De 65 a 69 años",eda19c),
                                           eda19c=ifelse(eda19c==17,"De 70 a 74 años",eda19c),
                                           eda19c=ifelse(eda19c==18,"De 75 años y más",eda19c),
                                           eda19c=ifelse(eda19c==19,"No especificado",eda19c),
                                           ing7c=ifelse(ing7c==0,"No aplica",ing7c),
                                           ing7c=ifelse(ing7c==1,"Hasta un salario mínimo",ing7c),
                                           ing7c=ifelse(ing7c==2,"Más de 1 hasta 2 salarios mínimos",ing7c),
                                           ing7c=ifelse(ing7c==3,"Más de 2 hasta 3 salarios mínimos",ing7c),
                                           ing7c=ifelse(ing7c==4,"Más de 3 hasta 5 salarios mínimos",ing7c),
                                           ing7c=ifelse(ing7c==5,"Más de 5 salarios mínimos",ing7c),
                                           ing7c=ifelse(ing7c==6,"No recibe ingresos",ing7c),
                                           ing7c=ifelse(ing7c==7,"No especificado",ing7c),
                                           scian=ifelse(scian==0,"No aplica",scian),
                                           scian=ifelse(scian==1,"Agricultura, ganadería, aprovechamiento forestal, pesca y caza",scian),
                                           scian=ifelse(scian==2,"Mineria",scian),
                                           scian=ifelse(scian==3,"Generación y Distribución de Electricidad, suminitros de Agua y gas",scian),
                                           scian=ifelse(scian==4,"Construcción",scian),
                                           scian=ifelse(scian==5,"Industrias Manufactureras",scian),
                                           scian=ifelse(scian==6,"Comercio al por mayor",scian),
                                           scian=ifelse(scian==7,"Comercio al por menor",scian),
                                           scian=ifelse(scian==8,"Transportes, Correos y Almacenamiento",scian),
                                           scian=ifelse(scian==9,"Información en medios masivos",scian),
                                           scian=ifelse(scian==10,"Servicios financieros y de seguros",scian),
                                           scian=ifelse(scian==11,"Servicios Inmobiliarios y alquiler de bienes",scian),
                                           scian=ifelse(scian==12,"Servicios profesionales, cientificos y técnicos",scian),
                                           scian=ifelse(scian==13,"Corporativos",scian),
                                           scian=ifelse(scian==14,"Servicio de apoyo a los negocios y manejo de desechos",scian),
                                           scian=ifelse(scian==15,"Servicios Educativos",scian),
                                           scian=ifelse(scian==16,"Servicios de salud y asistencia social",scian),
                                           scian=ifelse(scian==17,"Servicios de Esparcimiento culturales y deportivos",scian),
                                           scian=ifelse(scian==18,"Servicios de hospedaje, de preparación, de alimentos y bebidas",scian),
                                           scian=ifelse(scian==19,"Otros servicios, excepto actividades gubernamentales",scian),
                                           scian=ifelse(scian==20,"Actividades gubernamentales y de organismos internacionales",scian),
                                           scian=ifelse(scian==21,"No especificado",scian),
                                           tue1=ifelse(tue1==0,"No aplica",tue1),
                                           tue1=ifelse(tue1==1,"Empresas y negocios",tue1),
                                           tue1=ifelse(tue1==2,"Instituciones",tue1),
                                           tue1=ifelse(tue1==3,"Sector de los hogares",tue1),
                                           tue1=ifelse(tue1==4,"Situaciones de carácter especial y no especificadas",tue1),
                                           tue2=ifelse(tue2==0,"No aplica",tue2),
                                           tue2=ifelse(tue2==1,"Empresas constituidas en sociedad y corporativas",tue2),
                                           tue2=ifelse(tue2==2,"Negocios no constituidos en sociedad",tue2),
                                           tue2=ifelse(tue2==3,"Privadas",tue2),
                                           tue2=ifelse(tue2==4,"Públicas",tue2),
                                           tue2=ifelse(tue2==5,"Sector informal",tue2),
                                           tue2=ifelse(tue2==6,"Trabajo doméstico remunerado",tue2),
                                           tue2=ifelse(tue2==7,"Agricultura de auto subsistencia",tue2),
                                           tue3=ifelse(tue3==0,"No aplica",tue3),
                                           tue3=ifelse(tue3==1,"Administradas por los gobiernos",tue3),
                                           tue3=ifelse(tue3==2,"No administradas por los gobiernos",tue3),
                                           hij5c=ifelse(hij5c==0,"No aplica",hij5c),
                                           hij5c=ifelse(hij5c==1,"Sin hijos",hij5c),
                                           hij5c=ifelse(hij5c==2,"De 1 a 2 hijos",hij5c),
                                           hij5c=ifelse(hij5c==3,"De 3 a 5 hijos",hij5c),
                                           hij5c=ifelse(hij5c==4,"De 6 hijos y más",hij5c),
                                           hij5c=ifelse(hij5c==5,"No especificado",hij5c))

SYC320_svyset <- SDEMYCOEST419 %>% as_survey_design(strata = est, weights = fac, id = upm, nest=TRUE)




##APORTACIÓN DE ZAID

Ocupados_ETA_CDMX_H <- svytable(~eda7c+pos_ocu+sex, design = subset(SYC320_svyset, ent== "09")) %>% 
  data.frame() %>% filter(Freq != 0) %>% rename(Total = Freq) %>% mutate(ent= "CDMX") %>%  
  filter(sex != "Mujer") %>%  mutate(sexo = c("Hombre CDMX")) %>% filter(pos_ocu %in% c("Subordinados y remunerados")) %>% 
  mutate(Porcentaje = 100 * (Total / sum(Total))*-1)

Ocupados_ETA_CDMX_M <- svytable(~eda7c+pos_ocu+sex, design = subset(SYC320_svyset, ent== "09")) %>% 
  data.frame() %>% filter(Freq != 0) %>% rename(Total = Freq) %>% mutate(ent= "CDMX") %>%  
  filter(sex != "Hombre") %>% mutate(sexo = c("Mujer CDMX")) %>% filter(pos_ocu %in% c("Subordinados y remunerados")) %>% 
  mutate(Porcentaje = 100 * (Total / sum(Total)))

Ocupados_ETA_CDMX <- bind_rows(Ocupados_ETA_CDMX_H,Ocupados_ETA_CDMX_M) %>% mutate(prueba = sum(Total))
rm(Ocupados_ETA_CDMX_H,Ocupados_ETA_CDMX_M)

temp_df <-
  Ocupados_ETA_CDMX %>% 
  filter(sexo == c("Hombre CDMX")) 

the_order <- temp_df$eda7c

graph3 <- 
  plot_ly(Ocupados_ETA_CDMX, y=~eda7c, x=~Porcentaje, type="bar",
          color = ~sexo, colors = c("#00b140","#7343be"),  orientation="v")

graph3 <- graph3 %>%
  layout(
    xaxis = list(
      ticktext = list("10.","20.","10","20"), 
      tickvals = list(-10,-20, 10, 20),
      tickmode = "array"
    ))

graph3  
