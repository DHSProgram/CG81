PROC GLOBAL
  { DHS-V chapter 14, section test tables  version 1.0.0 of 05/09/07 }

  set explicit;

  numeric byteam, x, i, itot, j, jtot, jtot1, jtot2, jtot3, jmax, jmin, k;
  numeric j15, j14, unitx, number, hwage, hwvalue, hwsex, hwerr;
  numeric yearint, cutoff, ismonth, isyear, isage, valdate;
  numeric f1u_tar, f1r_tar, f2w_urb, f2w_rur, f3w_urb, f3w_rur, f3m_urb, f3m_rur;
  numeric f2m_urb, f2m_rur, f4m_tar;
  numeric f4w_tar, f6_tar,f7l_tar, f7d_tar, f8_tar, f5_tar, f10_tar;
  numeric f11_tar1, f11_tarm1, f11_tar2, f11_tar3, f11_tar4, f12_tar1, f12_tar2, f12_tar3, f13_tar;
  numeric f14_t1, f14_t2, f14_t3, f15_tar;
  numeric asterisk = 999999999;     // constant to be used by tables editor to put an * in a cell

  alpha(4) strval;

  array interview(100);       { determine if an individual was successfully interviewed to be used for DBS collection }

  //crosstab float(1) f1u Fteams+{fintnum+}ftotal QHRESULT+ftotaln+ftarget
  crosstab float(1) f1u Fteams+{fintnum+}ftotal FHRESULT+ftotaln+ftarget
    exclude( percents, totals, specval )
    //title( "FC-1: Household completion rate (urban)", " ",
    title( "FC-1U: Taux de réponse des ménages (Urbain)", " ",
           "Distribution (en %) des ménages par résultat de l'interview",
           ", selon l'équipe, Bénin 2017-18" )

  //crosstab float(1) f1r Fteams+{fintnum+}ftotal QHRESULT+ftotaln+ftarget
  crosstab float(1) f1r Fteams+{fintnum+}ftotal FHRESULT+ftotaln+ftarget
    exclude( percents, totals, specval )
    //title( "FC-1: Household completion rate (rural)", " ",
    title( "FC-1R: Taux de réponse des ménages (Rural) ", " ",
           "Distribution (en %) des ménages par résultat de l'interview",
           ", selon l'équipe, Bénin 2017-18" )

  crosstab float(2) f2w Fteams+{fintnum+}ftotal URBRUR*Fhhmean
    exclude( percents, totals, specval )
    //title( "FC-2W: Eligible women per household","",
    title( "FC-2W: Femmes éligibles par ménage","",
           "Nombre moyen de femmes (population de fait) éligibles par ménage,",
           "selon l'équipe, Bénin 2017-18" );

  crosstab float(2) f2m Fteams+{fintnum+}ftotal URBRUR*Fhhmeanm
    exclude( percents, totals, specval )
    //title( "FC-2M: Eligible men per household","",
    title( "FC-2M: Hommes éligibles par ménage","",
           "Nombre moyen d'hommes (population de fait) éligibles par ménage,",
           "selon l'équipe, Bénin 2017-18" );

  //crosstab float(1) f3wu Fteams+{fintnum+}ftotal QRESULT+ftotaln+ftarget
  crosstab float(1) f3wu Fteams+{fintnum+}ftotal FRESULT+ftotaln+ftarget
    exclude( percents, totals, specval )
    //title( "FC-3W: Eligible woman completion rate (urban)","",
    title( "FC-3WU: Taux de réponse des femmes éligibles (Urbain)","",
           "Distribution (en %) des femmes (population de fait) éligibles ",
           "selon le résultat de l'interview individuelle par équipe,",
           "Bénin 2017-18" );

  //crosstab float(1) f3wr Fteams+{fintnum+}ftotal QRESULT+ftotaln+ftarget
  crosstab float(1) f3wr Fteams+{fintnum+}ftotal FRESULT+ftotaln+ftarget
    exclude( percents, totals, specval )
    //title( "FC-3W: Eligible woman completion rate (rural)","",
    title( "FC-3WR: Taux de réponse des femmes éligibles (Rural)","",
           "Distribution (en %) des femmes (population de fait) éligibles ",
           "selon le résultat de l'interview individuelle par équipe,",
           "Bénin 2017-18" );

  //crosstab float(1) f3mu Fteams+{fintnum+}ftotal QRESULT+ftotaln+ftarget
  crosstab float(1) f3mu Fteams+{fintnum+}ftotal FMRESULT+ftotaln+ftarget
    exclude( percents, totals, specval )
    //title( "FC-3M: Eligible man completion rate (urban)","",
    title( "FC-3MU: Taux de réponse des hommes éligibles (Urbain)","",
           "Distribution (en %) des hommes (population de fait) éligibles ",
           "selon le résultat de l'interview individuelle par équipe, ",
           "Bénin 2017-18" );

  //crosstab float(1) f3mr Fteams+{fintnum+}ftotal QRESULT+ftotaln+ftarget
  crosstab float(1) f3mr Fteams+{fintnum+}ftotal FMRESULT+ftotaln+ftarget
    exclude( percents, totals, specval )
    //title( "FC-3M: Eligible man completion rate (rural)","",
    title( "FC-3MR:  Taux de réponse des hommes éligibles (Rural)","",
           "Distribution (en %) des hommes (population de fait) éligibles ",
           "selon le résultat de l'interview individuelle par équipe, ",
           "Bénin 2017-18" );

  crosstab float(2) f4w Fteams+{fintnum+}ftotal Fage+ftotalw+Fratio+ftarget
    exclude( percents, totals, specval )
    //title( "FC-4W: Age displacement: women","",
    title( "FC-4W: Déplacement des âges: femmes","",
           "Effectif de toutes les femmes* de 12-18 ans listées dans ",
           "le questionnaire ménage par année d'âge et ratio des âges 15/14, ",
           "selon l'équipe, Bénin 2017-18" );

  crosstab float(2) f4m Fteams+{fintnum+}ftotal Fagem+ftotalm+Fratiom+ftarget
    exclude( percents, totals, specval )
    //title( "FC-4M: Age displacement: men","",
    title( "FC-4M: Déplacement des âges: hommes","",
           "Effectif de Effectif de tous les hommes* de 12-18 ans listés dans ",
           "le questionnaire ménage par année d'âge et ratio des âges 15/14, ",
           "selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f5 Fteams+{fintnum+}ftotal Fceb+ftarget
    exclude( percents, totals, specval )
    //title( "FC-5:  Children ever born","",
    //title( "FC-5:  Enfants déjà nés (Ensemble)","",
    title( "FC-5:  Enfants déjà nés ","",
           "Effectif de TOUTES LES FEMMES* avec une interview complète, ",
           "effectif d'enfants déjà nés et nombre moyen d'enfants déjà nés, ",
           "selon l'équipe, Bénin 2017-18" );

  crosstab float(2) f6 Fteams+{fintnum+}ftotal Fyearb+ftotalb+Fratiob+ftarget
    exclude( percents, totals, specval)
    //title( "FC-6: Birth displacement","",
    title( "FC-6: Déplacement des naissances","",
           "Effectif de naissances depuis 2008 par année de naissance et ",
           "ratio des années de naissance 2012/2013, selon l'équipe ",
           "(basé sur les naissances de toutes les femmes), Bénin 2017-18" );

  crosstab float(1) f7l Fteams+{fintnum+}ftotal Fcompl+ftotaln+ftarget
    exclude( percents, totals, specval )
    //title( "FC-7L: Birth date reporting: living children","",
    title( "FC-7L: Déclaration de la date de naissance: enfants vivants","",
           "Distribution (en %) des naissances par complétude de l'information ",
           "sur la date de naissance/âge, selon l'équipe ",
           "(basé sur les naissances de toutes les femmes), Bénin 2017-18" );

  crosstab float(1) f7d Fteams+{fintnum+}ftotal Fcompd+ftotaln+ftarget
    exclude( percents, totals, specval )
    //title( "FC-7D: Birth date reporting: dead children","",
    title( "FC-7D: Déclaration de la date de naissance: enfants décédés","",
           "Distribution (en %) des naissances par complétude de l'information ",
           "sur la date de naissance, selon l'équipe ",
           "(basé sur les naissances de toutes les femmes), Bénin 2017-18" );

  crosstab float(1) f8  Fteams+{fintnum+}ftotal Faged+ftotald+Fratiod+ftarget
    exclude( percents, totals, specval )
    //title( "FC-8: Age at death heaping","",
    title( "FC-8: Attraction des âges au décès","",
           "Effectif des décès des 15 dernières années, survenus aux âges de 8-16 ",
           "mois selon l'âge au décès en mois déclaré (y compris l'âge au décès ",
           "déclaré comme '1 an') et ratio des 12 mois, selon l'équipe. ",
           "Y compris les décès pour lesquels une période de calendrier de décès ne peut être ",
           "affectée parce que la date de naissance est manquante. Les décès sans âge au décès ",
           "ne sont pas inclus. Basé sur les naissances de toutes les femmes, Bénin 2017-18" );

  crosstab float(2) f9u  Fteams+{fintnum+}ftotal Faged9+Falive+ftotalb9+Fratio9
    exclude( percents, totals, specval )
    //title( "FC-9U:  Child mortality","",
    title( "FC-9:  Mortalité des enfants (URBAIN)","",
           "Effectif de naissances des 15 années avant l'enquête selon l'état de survie et ",
           "l'âge au décès (pour les décédés), ratio des décès néonatals (<1 mois) à tous ",
           "les décès infantiles (<12 mois), et ratio des décès infantiles à toutes ",
           "les naissances, selon l'équipe, Bénin 2017-18" );

  crosstab float(2) f9r  Fteams+{fintnum+}ftotal Faged9+Falive+ftotalb9+Fratio9
    exclude( percents, totals, specval )
    //title( "FC-9R:  Child mortality","",
    title( "FC-9:  Mortalité des enfants (RURAL)","",
           "Effectif de naissances des 15 années avant l'enquête selon l'état de survie et ",
           "l'âge au décès (pour les décédés), ratio des décès néonatals (<1 mois) à tous ",
           "les décès infantiles (<12 mois), et ratio des décès infantiles à toutes ",
           "les naissances, selon l'équipe, Bénin 2017-18" );

  crosstab float(2) f9  Fteams+{fintnum+}ftotal Faged9+Falive+ftotalb9+Fratio9
    exclude( percents, totals, specval )
    //title( "FC-9:  Child mortality","",
    title( "FC-9:  Mortalité des enfants (ENSEMBLE)","",
           "Effectif de naissances des 15 années avant l'enquête selon l'état de survie et ",
           "l'âge au décès (pour les décédés), ratio des décès néonatals (<1 mois) à tous ",
           "les décès infantiles (<12 mois), et ratio des décès infantiles à toutes ",
           "les naissances, selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f10 Fteams+{fintnum+}ftotal Fcardr+Fcardp+ftarget
    exclude( percents, totals, specval )
    //title( "FC-10: Vaccination cards","",
    title( "FC-10: Carnets de Vaccination","",
           "Pourcentage d'enfants vivants nés depuis Janvier 2014-15 qui ont actuellement une carte ",
           "de vaccination, pourcentage d'enfants dont la carte a été vue par l'enquêtrice, ",
           "et proportion de cartes vues, selon l'équipe, Bénin 2017-18" );

   //crosstab float(1) f11cw1 Fteams+{fintnum+}ftotal fwc11+ftotalc2+Fhwc+ftarget2
   crosstab float(1) f11cw1 Fteams+{fintnum+}ftotal fwc11+ftotalc2+Fhwc1+ftarget2
    exclude( percents, totals, specval )
    //title( "FC-11CW: Children's weight","",
    title( "FC-11CW: Poids des enfants","",
           "Distribution (en %) d'enfants de moins de 5 ans éligibles pour le poids et la taille ",
           "par les résultats des mesures du poids, et pourcentage des enfants mesurés dont ",
           "les valeurs du poids sont hors fourchettes ou dont la date de naissance est incomplète, ",
           "et pourcentage des enfant mesurés dont les valeurs poids-taille ",
           "Z-score sont hors fourchettes, selon l'équipe, Bénin 2017-18" );

   crosstab float(1) f11cw2 Fteams+{fintnum+}ftotal fdec1+ftotpc1+ftotalc3+ftarget
    exclude( percents, totals, specval )
    //title( "FC-11C wt 1dec: Accuracy of children's weight, 1st decimal","",
    title( "FC-11C wt 1dec: Précision du Poids des enfants, 1ère décimale","",
           "Pourcentage du poids des enfants de moins de 5 ans pesés et avec données , ",
           "valides d'après la première décimale du poids enregistrée, selon l'équipe, Bénin 2017-18" );

   crosstab float(1) f11cw3 Fteams+{fintnum+}ftotal fdec2+ftotpc2+ftotalc3+ftarget
    exclude( percents, totals, specval )
    //title( "FC-11C wt 2dec: Accuracy of children's weight, 2nd decimal","",
    title( "FC-11C wt 2dec: Précision du Poids des enfants, 2ème décimale","",
           "Pourcentage du poids des enfants de moins de 5 ans pesés et avec données valides ",
           "d'après la deuxième du poids enregistrée, selon l'équipe, Bénin 2017-18" );

   //crosstab float(1) f11ch Fteams+{fintnum+}ftotal fhc11+ftotalc2+Fhwc+ftarget3
   crosstab float(1) f11ch Fteams+{fintnum+}ftotal fhc11+ftotalc2+Fhwc1+ftarget3 
    exclude( percents, totals, specval )
    //title( "FC-11CH: Height: children","",
    title( "FC-11CH: Taille des enfants","",
           "Distribution (en %) d'enfants de moins de 5 ans éligibles pour le poids ",
           "et la taille par les résultats des mesures de la taille, et pourcentage ",
           "mesurés dont les valeurs de la taille sont hors fourchettes ou dont ",
           "la date de naissance est incomplète, et pourcentage des enfant mesures dont ",
           "les valeurs taille-age Z-score sont hors fourchettes, selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f11ww1 Fteams+{fintnum+}ftotal fww11+ftotalw2+Fhww+ftarget4
    exclude( percents, totals, specval )
    //title( "FC-11W wt: Women's weight","",
    title( "FC-11W wt: Poids des femmes","",
           "Distribution (en %) de femmes éligibles pour le poids et ",
           "le poids et la taille par résultat des mesures du poids, selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f11ww2 Fteams+{fintnum+}ftotal fdec1+ftotpc1+ftotalw3+ftarget
    exclude( percents, totals, specval )
    //title( "FC-11W wt 1dec: Accuracy of women's weight, 1st decimal","",
    title( "FC-11W wt 1dec: Précision du Poids des femmes 1ère décimale","",
           "Pourcentage du poids des femmes de 15-49 ans pesés et avec données valides ",
           "d'après la première décimale du poids enregistrée, selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f11ww3 Fteams+{fintnum+}ftotal fdec2+ftotpc2+ftotalw3+ftarget
    exclude( percents, totals, specval )
    //title( "FC-11W wt 2dec: Accuracy of women's weight, 2nd decimal","",
    title( "FC-11W wt 2dec: Précision du Poids des femmes 2ème décimale","",
           "Pourcentage du poids des femmes de 15-49 ans pesés et avec données ",
           "valides d'après la seconde décimale du poids enregistrée, selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f11wh Fteams+{fintnum+}ftotal fhw11+ftotalw2+Fhww+ftarget4
    exclude( percents, totals, specval )
    //title( "FC-11W ht: Women's height","",
    title( "FC-11W ht: Taille des femmes","",
           "Distribution (en %) de femmes de 15-49 ans éligibles pour le poids ",
           "et la taille par les résultats des mesures de la taille, selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f12c1 Fteams+{fintnum+}ftotal Fac12+ftotalc5+fanc+ftarget6
    exclude( percents, totals, specval )
    //title( "FC-12C hb: Anemia testing: children","",
    title( "FC-12C hb: Test d'anémie parmi les enfants","",
           "Distribution (en %) d'enfants de 6-59 mois éligibles pour ",
           "le test d'anémie par résultat du test, selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f12c2 Fteams+{fintnum+}ftotal fdec1+ftotpc1+ftotalc4+ftarget
    exclude( percents, totals, specval )
    //title( "FC-12C hb 1dec: Accuracy of children's hemoglobin level, 1st decimal","",
    title( "FC-12C hb 1dec: Précision du niveau d'hémoglobine d'enfants, 1ère décimale ","",
           "Distribution (en %) d'enfants 6-59 mois testés pour l'hémoglobine et avec données ",
           "valide, d'après la première décimale du niveau d'hémoglobine enregistrée, selon l'équipe, ",
           "selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f12w1 Fteams+{fintnum+}ftotal Faw12+ftotalw2+fanw+ftarget4
    exclude( percents, totals, specval )
    //title( "FC-12W hb: Anemia testing: women","",
    title( "FC-12W hb: Test d'anémie parmi les femmes","",
           "Distribution (en %) de femmes de 15-49 ans éligibles pour ",
           "le test d'anémie par résultat du test, selon l'équipe, Bénin 2017-18" );

  crosstab float(1) f12w2 Fteams+{fintnum+}ftotal fdec1+ftotpc1+ftotalw4+ftarget
    exclude( percents, totals, specval )
    //title( "FC-12W hb 1dec: Accuracy of women's hemoglobin level, 1st decimal","",
    title( "FC-12W hb 1dec: Précision du niveau d'hémoglobine de femme, 1ère décimale","",
           "Distribution (en %) de femmes de 15-49 ans testés pour l'hémoglobine et ",
           "avec données valide, d'après la première décimale du niveau d'hémoglobine enregistrée, ",
           "selon l'équipe, Bénin 2017-18" );
{
  crosstab float(1) f14 Fteams+{fintnum+}ftotal
                      fcol14a+ftarget+fcol14b+ftarget+fcol14c+ftarget
    exclude( percents, totals, specval )
    //title( "FC-14:  Adult and Maternal Mortality Module","",
    title( "FC-14:  Module de mortalité maternelle","",
           "Effectif de soeurs décédées et effectif et pourcentage de celles pour lesquelles ",
           "l'âge au décès est manquant; effectif de soeurs décédées à l'âge de 12 ans ou ",
           "plus et effectif et pourcentage de celles pour lesquelles l'information sur ",
           "le décès au cours de la grossesse, de l'accouchement ou après l'accouchement est manquante, ",
           "et pour lesquelles l'information sur le nombre d'années depuis le décès est manquante ",
           "(TOUTES les femmes), selon l'équipe, Bénin 2017-18" );
}
  crosstab float(1) f15 Fteams+{fintnum+}ftotal resdv+ftarget
    exclude( percents, totals, specval )
    //title( "FC-15:  Domestic violence","",
    title( "FC-15:  Violence domestique","",
           "Femmes éligibles au module violence domestique et enquêtées ",
           "(confidentialité obtenue) et pourcengage pas enquêtées, selon l'équipe, Bénin 2017-18" );

  crosstab float(0) f20 Fteams+{fintnum+}ftotal fsumm1
    exclude( percents, totals, specval )
    title( "Evaluation globale tableaux 1 à 10, 14 et 15","",
           "selon l'équipe, Bénin 2017-18" );

  crosstab float(0) f21 Fteams+{fintnum+}ftotal fsumm2
    exclude( percents, totals, specval )
    title( "Evaluation globale biomarqueur tableaux 11 et 12 ","",
           "selon l'équipe, Bénin 2017-18" );

  crosstab float(0) f22 Fteams+{fintnum+}ftotal fsumm3
    exclude( percents, totals, specval )
    title( "Evaluation globale des cibles","",
           "selon l'équipe, Bénin 2017-18" );

  function valid(xvar);
    valid = ( !special(xvar) & xvar <= 96 )
  end;

  function validyr(xvar);
    validyr = ( !special(xvar) & xvar <= 9996 )
  end;

  { obtain measurement result for children's weight }
  function measure1( xvar )
    box   xvar   => x;
          99.94  => 2;
          99.95  => 3;
          99.96  => 6;
         missing => 9;
                 => 1;
    endbox;
    measure1 = x;
  end;

  { obtain measurement result for women and men }
  function measure2( xvar )
    box   xvar   => x;
         999.94  => 2;
         999.95  => 3;
         999.96  => 6;
         missing => 9;
                 => 1;
    endbox;
    measure2 = x;
  end;

  { obtain measurement result for hemoglobin }
  function measure3( xvar )
    box   xvar   => x;
           99.4  => 2;
         notappl => 2;        { in DHS7, not present skips for children }
           99.5  => 3;
           99.6  => 6;
         missing => 9;
                 => 1;
    endbox;
    measure3 = x;
  end;

  { obtain measurement result for HIV testing }
  function measure4( alpha(5) yvar );
    x = 1;
    if     yvar = "99995" then x = 2;
    elseif yvar = "99994" then x = 3;
    elseif yvar = "99996" then x = 6;
    elseif pos("?",yvar)  then x = 9;
    endif;
    measure4 = x;
  end;

  { obtain measurement result for children's height }
  function measure5( xvar )
    box   xvar   => x;
          999.4  => 2;
          999.5  => 3;
          999.6  => 6;
         missing => 9;
                 => 1;
    endbox;
    measure5 = x;
  end;

  { returns the first or second digit (decpos) of a decimal variable }
  function GetDecimal( value, decpos )
    numeric wholeval, intval, decval;
    intval   = int( value + 0.00001 ) * 100;   //to properly round the decimal part
    wholeval = int( value * 100 + 0.00001 );
    decval   = wholeval - intval;
    strval   = edit( "99", decval );
    GetDecimal = tonumber( strval[decpos:1] );
  end;
PROC BJHH70_FF
preproc

  ftotal   = 1;
  ftotalb  = 1;
  ftotald  = 1;
  ftotalb9 = 1;
  ftotaln  = 1;
  ftotalw  = 1;
  ftotalm  = 1;
  ftotalc2 = 1;
  ftotalc3 = 1;
  ftotalc4 = 1;
  ftotalc5 = 1;
  ftotalw2 = 1;
  ftotalm2 = 1;
  ftotalw3 = 1;
  ftotalw4 = 1;
  ftotalm3 = 1;
  ftarget  = notappl;
  fratio   = notappl;
  fratiob  = notappl;
  fratiom  = notappl;
  fratiod  = notappl;
  fratio9  = notappl;
{}
  fhresult = notappl;
  fresult  = notappl;
  fmresult = notappl;    
{}
  byteam = ( sysparm()[1:1] = "T" );

  yearint = 2017;                      { Year of interview (Last year)    }
  cutoff  = 2012;                      { Cutoff year/health section       }

  { Targets }
  f1u_tar   = 96;       { !! request target from CM }
  f1r_tar   = 98;       { !! request target from CM }
  f2w_urb   = 1.05;     { !! request target from CM }
  f2w_rur   = 0.96;     { !! request target from CM }
  f2m_urb   = 0.99;     { !! request target from CM }
  f2m_rur   = 0.93;     { !! request target from CM }
  f3w_urb   = 95;       { !! request target from CM }
  f3w_rur   = 97;       { !! request target from CM }
  f3m_urb   = 92;       { !! request target from CM }
  f3m_rur   = 96;       { !! request target from CM }
  f4w_tar   = 0.8;
  f4m_tar   = 0.8;
  f5_tar    = 2.33;      { !! request target from CM }
  f6_tar    = 0.85;
  f7l_tar   = 98;
  f7d_tar   = 96;
  f8_tar    = 1.5;
  f10_tar   = 90;
  f11_tar1  = 95;
  f11_tarm1 = 90;
  f11_tar2  = 4;
  f11_tar3  = 30;
  f11_tar4  = 95;
  f12_tar1  = 95;
  f12_tar2  = 30;
  f12_tar3  = 95;
  f13_tar   = 90;      { !! request target from CM }
  f14_t1    = 2;
  f14_t2    = 0;
  f14_t3    = 0;
  f15_tar   = 5;

postproc

  { initialize global evaluation tables to make sure that they are displayed }
  f20  = 0.001;
  f21  = 0.001;
  f22  = 0.001;

  { Table f1u }
  jtot    = tblcol( f1u, ftotaln );
  jmax    = jtot - 2;
  { Percents }
  do j = 0 while j <= jmax
    f1u[*,j] = f1u[*,j] * 100 / f1u[*,jtot];
  enddo;
  { Total }
  f1u[*,jtot-1] = tblsum( column f1u[*,0:jmax] );
  { Targets }
  fsumm1 = 0;
  itot = tblrow( f1u );
  do i = 0 while i <= itot
    f1u(i,jtot+1) = Default;
    if f1u(i,0) < f1u_tar then
      f1u(i,jtot+1) = f1u(i,0);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f1r }
  jtot    = tblcol( f1r, ftotaln );
  jmax    = jtot - 2;
  { Percents }
  do j = 0 while j <= jmax
    f1r[*,j] = f1r[*,j] * 100 / f1r[*,jtot];
  enddo;
  { Total }
  f1r[*,jtot-1] = tblsum( column f1r[*,0:jmax] );
  { Targets }
  fsumm1 = 1;
  itot = tblrow( f1r );
  do i = 0 while i <= itot
    f1r(i,jtot+1) = Default;
    if f1r(i,0) < f1r_tar then
      f1r(i,jtot+1) = f1r(i,0);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f2w }
  jtot1 = tblcol( f2w, URBRUR = 1 FHHMEAN = 2 );   { mean for urban }
  jtot2 = tblcol( f2w, URBRUR = 2 FHHMEAN = 2 );   { mean for rural }
  itot = tblrow(  f2w );
  { Means }
  f2w[*,jtot1] = f2w[*,jtot1-1] / f2w[*,jtot1-2];
  f2w[*,jtot2] = f2w[*,jtot2-1] / f2w[*,jtot2-2];
  { Targets }
  fsumm1 = 2;
  do i = 0 while i <= itot
    { Urban }
    f2w(i,jtot1+1) = Default;
    if f2w(i,jtot1) < f2w_urb then
      f2w(i,jtot1+1) = f2w(i,jtot1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
    { Rural }
    f2w(i,jtot2+1) = Default;
    if f2w(i,jtot2) < f2w_rur then
      f2w(i,jtot2+1) = f2w(i,jtot2);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f2m }
  jtot1 = tblcol( f2m, URBRUR = 1 FHHMEANM = 2 );   { mean for urban }
  jtot2 = tblcol( f2m, URBRUR = 2 FHHMEANM = 2 );   { mean for rural }
  itot = tblrow(  f2m );
  { Means }
  f2m[*,jtot1] = f2m[*,jtot1-1] / f2m[*,jtot1-2];
  f2m[*,jtot2] = f2m[*,jtot2-1] / f2m[*,jtot2-2];
  { Targets }
  fsumm1 = 3;
  do i = 0 while i <= itot
    { Urban }
    f2m(i,jtot1+1) = Default;
    if f2m(i,jtot1) < f2m_urb then
      f2m(i,jtot1+1) = f2m(i,jtot1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
    { Rural }
    f2m(i,jtot2+1) = Default;
    if f2m(i,jtot2) < f2m_rur then
      f2m(i,jtot2+1) = f2m(i,jtot2);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f3wu }
  jtot = tblcol( f3wu, ftotaln );
  jmax = jtot - 2;
  { Percents }
  do j = 0 while j <= jmax
    f3wu[*,j] = f3wu[*,j] * 100 / f3wu[*,jtot];
  enddo;
  { Total }
  f3wu[*,jtot-1] = tblsum( column f3wu[*,0:jmax] );
  { Targets }
  fsumm1 = 4;
  itot = tblrow( f3wu );
  do i = 0 while i <= itot
    f3wu(i,jtot+1) = Default;
    if f3wu(i,0) < f3w_urb then
      f3wu(i,jtot+1) = f3wu(i,0);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f3wr }
  jtot = tblcol( f3wr, ftotaln );
  jmax = jtot - 2;
  { Percents }
  do j = 0 while j <= jmax
    f3wr[*,j] = f3wr[*,j] * 100 / f3wr[*,jtot];
  enddo;
  { Total }
  f3wr[*,jtot-1] = tblsum( column f3wr[*,0:jmax] );
  { Targets }
  fsumm1 = 5;
  itot = tblrow( f3wr );
  do i = 0 while i <= itot
    f3wr(i,jtot+1) = Default;
    if f3wr(i,0) < f3w_rur then
      f3wr(i,jtot+1) = f3wr(i,0);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f3mu }
  jtot = tblcol( f3mu, ftotaln );
  jmax = jtot - 2;
  { Percents }
  do j = 0 while j <= jmax
    f3mu[*,j] = f3mu[*,j] * 100 / f3mu[*,jtot];
  enddo;
  { Total }
  f3mu[*,jtot-1] = tblsum( column f3mu[*,0:jmax] );
  { Targets }
  fsumm1 = 6;
  itot = tblrow( f3mu );
  do i = 0 while i <= itot
    f3mu(i,jtot+1) = Default;
    if f3mu(i,0) < f3m_urb then
      f3mu(i,jtot+1) = f3mu(i,0);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f3mr }
  jtot = tblcol( f3mr, ftotaln );
  jmax = jtot - 2;
  { Percents }
  do j = 0 while j <= jmax
    f3mr[*,j] = f3mr[*,j] * 100 / f3mr[*,jtot];
  enddo;
  { Total }
  f3mr[*,jtot-1] = tblsum( column f3mr[*,0:jmax] );
  { Targets }
  fsumm1 = 7;
  itot = tblrow( f3mr );
  do i = 0 while i <= itot
    f3mr(i,jtot+1) = Default;
    if f3mr(i,0) < f3m_rur then
      f3mr(i,jtot+1) = f3mr(i,0);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f4w }
  j15  = tblcol( f4w, Fage = 15 );
  j14  = tblcol( f4w, Fage = 14 );
  jtot = tblcol( f4w );
  { Ratios }
  f4w[*,jtot-1] = f4w[*,j15] / f4w[*,j14];
  { Target }
  fsumm1 = 8;
  itot = tblrow( f4w );
  do i = 0 while i <= itot
    f4w(i,jtot) = Default;
    if f4w(i,jtot-1) <= f4w_tar then
      f4w(i,jtot) = f4w(i,jtot-1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f4m }
  j15  = tblcol( f4m, Fagem = 15 );
  j14  = tblcol( f4m, Fagem = 14 );
  jtot = tblcol( f4m );
  { Ratios }
  f4m[*,jtot-1] = f4m[*,j15] / f4m[*,j14];
  { Target }
  fsumm1 = 9;
  itot = tblrow( f4m );
  do i = 0 while i <= itot
    f4m(i,jtot) = Default;
    if f4m(i,jtot-1) <= f4m_tar then
      f4m(i,jtot) = f4m(i,jtot-1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f5 }
  jtot = tblcol( f5 );
  itot = tblrow( f5 );
  { Means }
  f5[*,jtot-1] = f5[*,1] / f5[*,0];
  { Target }
  fsumm1 = 10;
  do i = 0 while i <= itot
    f5(i,jtot) = Default;
    if f5(i,jtot-1) <= f5_tar then
      f5(i,jtot) = f5(i,jtot-1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f6 }
  jtot  = tblcol( f6 );
  jtot1 = tblcol( f6, Fyearb = cutoff );
  itot  = tblrow( f6 );
  { Ratios }
  f6[*,jtot-1] = f6[*,jtot1] / f6[*,jtot1-1];
  { Target }
  fsumm1 = 11;
  do i = 0 while i <= itot
    f6(i,jtot) = Default;
    if f6(i,jtot-1) < f6_tar then
      f6(i,jtot) = f6(i,jtot-1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f7l }
  jtot = tblcol( f7l, ftotaln );
  jmax = jtot - 2;
  itot = tblrow( f7l );
  { Percents }
  do j = 0 while j <= jmax
    f7l[*,j] = f7l[*,j] * 100 / f7l[*,jtot];
  enddo;
  { Total }
  f7l[*,jtot-1] = tblsum( column f7l[*,0:jmax] );
  { Target }
  fsumm1 = 12;
  do i = 0 while i <= itot
    f7l(i,jtot+1) = Default;
    if f7l(i,0) <= f7l_tar then
      f7l(i,jtot+1) = f7l(i,0);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f7d }
  jtot = tblcol( f7d, ftotaln );
  jmax = jtot - 2;
  itot = tblrow( f7d );
  { Percents }
  do j = 0 while j <= jmax
    f7d[*,j] = f7d[*,j] * 100 / f7d[*,jtot];
  enddo;
  { Total }
  f7d[*,jtot-1] = tblsum( column f7d[*,0:jmax] );
  { Target }
  fsumm1 = 13;
  do i = 0 while i <= itot
    f7d(i,jtot+1) = Default;
    if f7d(i,0) <= f7d_tar then
      f7d(i,jtot+1) = f7d(i,0);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f8 }
  jtot  = tblcol( f8, ftotald );
  jtot1 = tblcol( f8, faged = 4 );                { deaths at 12 months }
  itot  = tblrow( f8 );
  { Ratios }
  f8[*,jtot+1] = ( f8[*,jtot1] + f8[*,jtot1+1] ) * 9 / f8[*,jtot];
  { Target }
  fsumm1 = 14;
  do i = 0 while i <= itot
    f8(i,jtot+2) = Default;
    if f8(i,jtot+1) >= f8_tar then
      f8(i,jtot+2) = f8(i,jtot+1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f9u }
  jtot    = tblcol( f9u, Faged9 );                   { urban }
  itot = tblrow(  f9u );
  { total deaths }
  f9u[*,jtot] = tblsum( column f9u[*,0:jtot-1] );
  { total births }
  f9u[*,jtot+2] = f9u[*,jtot] + f9u[*,jtot+1];
  { ratio neonatal to infant }
  f9u[*,jtot+3] = f9u[*,0] / ( f9u[*,0] + f9u[*,1] );
  { infant deaths to births }
  f9u[*,jtot+4] = ( f9u[*,0] + f9u[*,1] ) * 1000 / f9u[*,jtot+2];

  { Table f9r }
  jtot    = tblcol( f9r, Faged9 );                   { rural }
  itot = tblrow(  f9r );
  { total deaths }
  f9r[*,jtot] = tblsum( column f9r[*,0:jtot-1] );
  { total births }
  f9r[*,jtot+2] = f9r[*,jtot] + f9r[*,jtot+1];
  { ratio neonatal to infant }
  f9r[*,jtot+3] = f9r[*,0] / ( f9r[*,0] + f9r[*,1] );
  { infant deaths to births }
  f9r[*,jtot+4] = ( f9r[*,0] + f9r[*,1] ) * 1000 / f9r[*,jtot+2];
  
  { Table f9 }
  jtot    = tblcol( f9, Faged9 );                   { all deaths }
  itot = tblrow(  f9 );
  { total deaths }
  f9[*,jtot] = tblsum( column f9[*,0:jtot-1] );
  { total births }
  f9[*,jtot+2] = f9[*,jtot] + f9[*,jtot+1];
  { ratio neonatal to infant }
  f9[*,jtot+3] = f9[*,0] / ( f9[*,0] + f9[*,1] );
  { infant deaths to births }
  f9[*,jtot+4] = ( f9[*,0] + f9[*,1] ) * 1000 / f9[*,jtot+2];
  
  { Table f10 }
  jtot  = tblcol( f10, Fcardr );
  jmax  = jtot - 1;
  itot  = tblrow( f10 );
  { Proportion }
  f10[*,jtot+1] = f10[*,1] * 100 / f10[*,0];
  { Percents }
  do j = 0 while j <= jmax
    f10[*,j] = f10[*,j] * 100 / f10[*,jtot];
  enddo;
  { Target }
  fsumm1 = 15;
  do i = 0 while i <= itot
    f10(i,jtot+2) = Default;
    if f10(i,jtot+1) < f10_tar then
      f10(i,jtot+2) = f10(i,jtot+1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f11cw1 }
  jtot1 = tblcol( f11cw1, ftotalc2 );
  jmax = jtot1 - 2;
  { % of flagged cases for children measured with valid date of birth }
  jtot2 = tblcol( f11cw1, ftarget2 = 3 );
  f11cw1[*,jtot2] = f11cw1[*,jtot2] * 100 / ( f11cw1[*,0] - f11cw1[*,jtot1+2] );
  { % with weight out of range }
  f11cw1[*,jtot1+1] = f11cw1[*,jtot1+1] * 100 / f11cw1[*,0];
  { % date of birth incomplete }
  f11cw1[*,jtot1+2] = f11cw1[*,jtot1+2] * 100 / f11cw1[*,0];
  { % date from birth history }
  f11cw1[*,jtot1+3] = f11cw1[*,jtot1+3] * 100 / f11cw1[*,0];
  { Percents }
  do j = 0 while j <= jmax
    f11cw1[*,j] = f11cw1[*,j] * 100 / f11cw1[*,jtot1];
  enddo;
  f11cw1[*,jtot1-1] = tblsum( column f11cw1[*,0:jmax] );
  { % children with valid data }
  jtot3 = tblcol( f11cw1, ftarget2 = 1);
  f11cw1[*,jtot3] = f11cw1[*,0] - f11cw1[*,0]*f11cw1[*,jtot1+1]/100 - f11cw1[*,0]*f11cw1[*,jtot1+2]/100;
  //f11cw1[*,jtot3] = f11cw1[*,0] - (f11cw1[*,0]*f11cw1[*,jtot1+1]/100 - f11cw1[*,0]*f11cw1[*,jtot1+2]/100);
  { target 1 }
  fsumm2 = 0;
  itot = tblrow( f11cw1 );
  do i = 0 while i <= itot
    f11cw1(i,jtot3+1) = Default;
    if f11cw1(i,jtot3) < f11_tar1 then
      f11cw1(i,jtot3+1) = f11cw1(i,jtot3);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;
  { target 2 }
  fsumm2 = 1;
  itot = tblrow( f11cw1 );
  do i = 0 while i <= itot
    f11cw1(i,jtot2+1) = Default;
    if f11cw1(i,jtot2) >= f11_tar2 then
    //if f11cw1(i,jtot2) > f11_tar2 then
      f11cw1(i,jtot2+1) = f11cw1(i,jtot2);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f11cw2 }
  jtot1 = tblcol( f11cw2, ftotalc3 );
  jmax = jtot1 - 3;
  { Percents }
  do j = 0 while j <= jmax
    f11cw2[*,j] = f11cw2[*,j] * 100 / f11cw2[*,jtot1];
  enddo;
  f11cw2[*,jmax+1] = tblsum( column f11cw2[*,0:jmax] );
  { % with 1st decimal o or 5 }
  jmax  = tblcol( f11cw2, fdec1 = 5 );
  f11cw2[*,jtot1-1] = f11cw2[*,0] + f11cw2[*,jmax];
  { target  }
  fsumm2 = 2;
  jtot2 = tblcol( f11cw2 );
  itot  = tblrow( f11cw2 );
  do i = 0 while i <= itot
    f11cw2(i,jtot2) = Default;
    if f11cw2(i,jtot1-1) >= f11_tar3 then
    //if f11cw2(i,jtot1-1) > f11_tar3 then
      f11cw2(i,jtot2) = f11cw2(i,jtot1-1);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f11cw3 }
  jtot1 = tblcol( f11cw3, ftotalc3 );
  jmax = jtot1 - 3;
  { Percents }
  do j = 0 while j <= jmax
    f11cw3[*,j] = f11cw3[*,j] * 100 / f11cw3[*,jtot1];
  enddo;
  f11cw3[*,jmax+1] = tblsum( column f11cw3[*,0:jmax] );
  { % with 1st decimal o or 5 }
  jmax  = tblcol( f11cw3, fdec2 = 5 );
  f11cw3[*,jtot1-1] = f11cw3[*,0] + f11cw3[*,jmax];
  { target  }
  fsumm2 = 2;
  jtot2 = tblcol( f11cw3 );
  itot  = tblrow( f11cw3 );
  do i = 0 while i <= itot
    f11cw3(i,jtot2) = Default;
    if f11cw3(i,jtot1-1) <= f11_tar4 then
    //if f11cw3(i,jtot1-1) < f11_tar4 then
      f11cw3(i,jtot2) = f11cw3(i,jtot1-1);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f11ch }
  jtot1 = tblcol( f11ch, ftotalc2 );
  jmax = jtot1 - 2;
  { % of flagged cases for children measured with valid date of birth }
  jtot2 = tblcol( f11ch, ftarget3 = 3 );
  f11ch[*,jtot2] = f11ch[*,jtot2] * 100 / ( f11ch[*,0] - f11ch[*,jtot1+2] );
  { % with height out of range }
  f11ch[*,jtot1+1] = f11ch[*,jtot1+1] * 100 / f11ch[*,0];
  { % date of birth incomplete }
  f11ch[*,jtot1+2] = f11ch[*,jtot1+2] * 100 / f11ch[*,0];
  { % date from birth history }
  f11ch[*,jtot1+3] = f11ch[*,jtot1+3] * 100 / f11ch[*,0];
  { Percents }
  do j = 0 while j <= jmax
    f11ch[*,j] = f11ch[*,j] * 100 / f11ch[*,jtot1];
  enddo;
  f11ch[*,jtot1-1] = tblsum( column f11ch[*,0:jmax] );
  { % children with valid data }
  jtot3 = tblcol( f11ch, ftarget3 = 1);
  f11ch[*,jtot3] = f11ch[*,0] - f11ch[*,0]*f11ch[*,jtot1+1]/100 - f11ch[*,0]*f11ch[*,jtot1+2]/100;
  //f11ch[*,jtot3] = f11ch[*,0] - (f11ch[*,0]*f11ch[*,jtot1+1]/100 - f11ch[*,0]*f11ch[*,jtot1+2]/100);
  { target 1 }
  fsumm2 = 3;
  itot = tblrow( f11ch );
  do i = 0 while i <= itot
    f11ch(i,jtot3+1) = Default;
    if f11ch(i,jtot3) < f11_tar1 then
      f11ch(i,jtot3+1) = f11ch(i,jtot3);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;
  { target 2 }
  fsumm2 = 4;
  itot = tblrow( f11ch );
  do i = 0 while i <= itot
    f11ch(i,jtot2+1) = Default;
    if f11ch(i,jtot2) >= f11_tar2 then
    //if f11ch(i,jtot2) > f11_tar2 then
      f11ch(i,jtot2+1) = f11ch(i,jtot2);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f11ww1 }
  jtot = tblcol( f11ww1, ftotalw2 );
  jmax = jtot - 2;
  { % with weight out of range }
  f11ww1[*,jtot+1] = f11ww1[*,jtot+1] * 100 / f11ww1[*,0];
  { Percents }
  do j = 0 while j <= jmax
    f11ww1[*,j] = f11ww1[*,j] * 100 / f11ww1[*,jtot];
  enddo;
  f11ww1[*,jtot-1] = tblsum( column f11ww1[*,0:jmax] );
  { % of women with valid data }
  jtot3 = tblcol( f11ww1, ftarget4 = 1);
  f11ww1[*,jtot3] = f11ww1[*,0] - f11ww1[*,0]*f11ww1[*,jtot+1]/100;
  { target 1 }
  fsumm2 = 5;
  itot = tblrow( f11ww1 );
  do i = 0 while i <= itot
    f11ww1(i,jtot3+1) = Default;
    if f11ww1(i,jtot3) < f11_tar1 then
      f11ww1(i,jtot3+1) = f11ww1(i,jtot3);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f11ww2 }
  jtot1 = tblcol( f11ww2, ftotalw3 );
  jmax = jtot1 - 3;
  { Percents }
  do j = 0 while j <= jmax
    f11ww2[*,j] = f11ww2[*,j] * 100 / f11ww2[*,jtot1];
  enddo;
  f11ww2[*,jmax+1] = tblsum( column f11ww2[*,0:jmax] );
  { % with 1st decimal o or 5 }
  jmax  = tblcol( f11ww2, fdec1 = 5 );
  f11ww2[*,jtot1-1] = f11ww2[*,0] + f11ww2[*,jmax];
  { target  }
  fsumm2 = 6;
  jtot2 = tblcol( f11ww2 );
  itot  = tblrow( f11ww2 );
  do i = 0 while i <= itot
    f11ww2(i,jtot2) = Default;
    if f11ww2(i,jtot1-1) >= f11_tar3 then
    //if f11ww2(i,jtot1-1) < f11_tar4 then
      f11ww2(i,jtot2) = f11ww2(i,jtot1-1);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f11ww3 }
  jtot1 = tblcol( f11ww3, ftotalw3 );
  jmax = jtot1 - 3;
  { Percents }
  do j = 0 while j <= jmax
    f11ww3[*,j] = f11ww3[*,j] * 100 / f11ww3[*,jtot1];
  enddo;
  f11ww3[*,jmax+1] = tblsum( column f11ww3[*,0:jmax] );
  { % with 1st decimal o or 5 }
  jmax  = tblcol( f11ww3, fdec2 = 5 );
  f11ww3[*,jtot1-1] = f11ww3[*,0] + f11ww3[*,jmax];
  { target  }
  fsumm2 = 6;
  jtot2 = tblcol( f11ww3 );
  itot  = tblrow( f11ww3 );
  do i = 0 while i <= itot
    f11ww3(i,jtot2) = Default;
    if f11ww3(i,jtot1-1) <= f11_tar4 then
    //if f11ww3(i,jtot1-1) < f11_tar4 then
      f11ww3(i,jtot2) = f11ww3(i,jtot1-1);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f11wh }
  jtot = tblcol( f11wh, ftotalw2 );
  jmax = jtot - 2;
  { % with height out of range }
  f11wh[*,jtot+1] = f11wh[*,jtot+1] * 100 / f11wh[*,0];
  { Percents }
  do j = 0 while j <= jmax
    f11wh[*,j] = f11wh[*,j] * 100 / f11wh[*,jtot];
  enddo;
  f11wh[*,jtot-1] = tblsum( column f11wh[*,0:jmax] );
  { % of women with valid data }
  jtot1 = tblcol( f11wh, ftarget4 = 1);
  f11wh[*,jtot1] = f11wh[*,0] - f11wh[*,0]*f11wh[*,jtot+1]/100;
  { target 1 }
  fsumm2 = 7;
  itot = tblrow( f11wh );
  do i = 0 while i <= itot
    f11wh(i,jtot1+1) = Default;
    if f11wh(i,jtot1) < f11_tar1 then
      f11wh(i,jtot1+1) = f11wh(i,jtot1);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f12c1 }
  jtot = tblcol( f12c1, ftotalc5 );
  jmax = jtot - 2;
  { % with anemia out of range }
  f12c1[*,jtot+1] = f12c1[*,jtot+1] * 100 / f12c1[*,0];
  { Percents }
  do j = 0 while j <= jmax
    f12c1[*,j] = f12c1[*,j] * 100 / f12c1[*,jtot];
  enddo;
  f12c1[*,jtot-1] = tblsum( column f12c1[*,0:jmax] );
  { % of children with valid data }
  jtot1 = tblcol( f12c1, ftarget6 = 1);
  f12c1[*,jtot1] = f12c1[*,0] - f12c1[*,0]*f12c1[*,jtot+1]/100;
  { target 1 }
  fsumm2 = 11;
  itot = tblrow( f12c1 );
  do i = 0 while i <= itot
    f12c1(i,jtot1+1) = Default;
    if f12c1(i,jtot1) <= f12_tar1 then
      f12c1(i,jtot1+1) = f12c1(i,jtot1);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f12c2 }
  jtot1 = tblcol( f12c2, ftotalc4 );
  jmax = jtot1 - 3;
  { Percents }
  do j = 0 while j <= jmax
    f12c2[*,j] = f12c2[*,j] * 100 / f12c2[*,jtot1];
  enddo;
  f12c2[*,jmax+1] = tblsum( column f12c2[*,0:jmax] );
  { % with 1st decimal o or 5 }
  jmax  = tblcol( f12c2, fdec1 = 5 );
  f12c2[*,jtot1-1] = f12c2[*,0] + f12c2[*,jmax];
  { target  }
  fsumm2 = 12;
  jtot2 = tblcol( f12c2 );
  itot  = tblrow( f12c2 );
  do i = 0 while i <= itot
    f12c2(i,jtot2) = Default;
    if f12c2(i,jtot1-1) >= f12_tar2 then
      f12c2(i,jtot2) = f12c2(i,jtot1-1);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f12w1 }
  jtot = tblcol( f12w1, ftotalw2 );
  jmax = jtot - 2;
  { % with hemoglobin out of range }
  f12w1[*,jtot+1] = f12w1[*,jtot+1] * 100 / f12w1[*,0];
  { Percents }
  do j = 0 while j <= jmax
    f12w1[*,j] = f12w1[*,j] * 100 / f12w1[*,jtot];
  enddo;
  f12w1[*,jtot-1] = tblsum( column f12w1[*,0:jmax] );
  { % of women with valid data }
  jtot1 = tblcol( f12w1, ftarget4 = 1);
  f12w1[*,jtot1] = f12w1[*,0] - f12w1[*,0]*f12w1[*,jtot+1]/100;
  { target 1 }
  fsumm2 = 13;
  itot = tblrow( f12w1 );
  do i = 0 while i <= itot
    f12w1(i,jtot1+1) = Default;
    if f12w1(i,jtot1) < f12_tar3 then
      f12w1(i,jtot1+1) = f12w1(i,jtot1);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f12w2 }
  jtot1 = tblcol( f12w2, ftotalw4 );
  jmax = jtot1 - 3;
  { Percents }
  do j = 0 while j <= jmax
    f12w2[*,j] = f12w2[*,j] * 100 / f12w2[*,jtot1];
  enddo;
  f12w2[*,jmax+1] = tblsum( column f12w2[*,0:jmax] );
  { % with 1st decimal o or 5 }
  jmax  = tblcol( f12w2, fdec1 = 5 );
  f12w2[*,jtot1-1] = f12w2[*,0] + f12w2[*,jmax];
  { target  }
  fsumm2 = 14;
  jtot2 = tblcol( f12w2 );
  itot  = tblrow( f12w2 );
  do i = 0 while i <= itot
    f12w2(i,jtot2) = Default;
    if f12w2(i,jtot1-1) >= f12_tar2 then
      f12w2(i,jtot2) = f12w2(i,jtot1-1);
      f21(i,fsumm2) = asterisk;             { summay table }
    endif;
  enddo;
{
  { Table f14 }
  jtot1 = tblcol( f14, fcol14a );
  jtot2 = tblcol( f14, fcol14b );
  jtot3 = tblcol( f14, fcol14c );
  itot  = tblrow( f14 );
  { Percents }
  f14[*,jtot1] = f14[*,jtot1-1] * 100 / f14[*,jtot1-2];
  f14[*,jtot2] = f14[*,jtot2-1] * 100 / f14[*,jtot2-2];
  f14[*,jtot3] = f14[*,jtot3-1] * 100 / f14[*,jtot3-2];
  { Targets }
  do i = 0 while i <= itot
    fsumm1 = 16;
    f14(i,jtot1+1) = Default;
    if f14(i,jtot1) >= f14_t1 then
      f14(i,jtot1+1) = f14(i,jtot1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
    fsumm1 = 17;
    f14(i,jtot2+1) = Default;
    if f14(i,jtot2) >  f14_t2 then
      f14(i,jtot2+1) = f14(i,jtot2);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
    fsumm1 = 18;
    f14(i,jtot3+1) = Default;
    if f14(i,jtot3) >  f14_t3 then
      f14(i,jtot3+1) = f14(i,jtot3);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;
}
  { Table f15 }
  jtot = tblcol( f15 );
  itot = tblrow( f15 );
  { Percents }
  f15[*,jtot-1] = f15[*,jtot-1] * 100 / f15[*,jtot-2];
  { Targets }
  fsumm1 = 19;
  do i = 0 while i <= itot
    f15(i,jtot) = Default;
    if f15(i,jtot-1) >= f15_tar then
      f15(i,jtot) = f15(i,jtot-1);
      f20(i,fsumm1) = asterisk;             { summay table }
    endif;
  enddo;

  { Table f20 & f22 }
  itot = tblrow( f20 );
  jtot = tblcol( f20 );
  jmax = jtot - 2;
  { count targets not met }
  do i = 0 while i <= itot
    do j = 0 while j <= jmax
      f22(i,1) = f22(i,1) + 1;             { count number of targets }
      if f20(i,j) = asterisk then
        f20(i,jmax+1) = f20(i,jmax+1) + 1;
        f22(i,0) = f22(i,0) + 1;
      endif;
    enddo;
  enddo;
  { f20 percents }
  f20[*,jtot] = f20[*,jmax+1] * 100 / (jmax+1);

  { Table f21 & f22 }
  itot = tblrow( f21 );
  jtot = tblcol( f21 );
  jmax = jtot - 2;
  { count targets not met }
  do i = 0 while i <= itot
    do j = 0 while j <= jmax
      f22(i,1) = f22(i,1) + 1;             { count number of targets }
      if f21(i,j) = asterisk then
        f21(i,jmax+1) = f21(i,jmax+1) + 1;
        f22(i,0) = f22(i,0) + 1;
      endif;
    enddo;
  enddo;
  { f21 percents }
  f21[*,jtot] = f21[*,jmax+1] * 100 / (jmax+1);

  { f22 percents }
  f22[*,1] = f22[*,0] * 100 / f22[*,1];

PROC HOUSEHOLD
preproc

  { initialize array to identify individuals interviewed }
  do i = 1 while i <= 100
    interview(i) = 0;
  enddo;

  URBRUR   = QHTYPE;
  fintnum  = QHINTNUM;  { !!!! make sure to adjust the value sets based on the actual interviewer codes for the survey }
  fhresult = QHRESULT;
  Fteams   = notappl;
  if byteam then
    { !! recode teams as necessary }
    Fteams = int( fintnum/100 );               {!!}
    fintnum = notappl;
  endif;
  { Table f1u & f1r }
  if QHTYPE = 1 then
    xtab( f1u );
  else
    xtab( f1r );
  endif;

  { skip incomplete households }
  if QHRESULT <> 1 then skip case endif;

  { array interview is used by tables f13w and f13m and therefore needs to be poulated here }
  do k = 1 while k <= soccurs( QHSEC01 )
    if QH09(k) | QH10(k) then               { if mmember is eligible }
      QLINE = QH09(k);
      if QH10(k) then QLINE = QH10(k) endif;
      if loadcase( BJIN70, QHCLUST, QHNUMBER, QLINE ) then   { if member found in individual questionnaire }
        { update array of individuals interviewed }
        if QRESULT = 1 then
          interview(QLINE) = 1;
        endif;
      endif;
    endif;
  enddo;

postproc

  { Table f2w }
  Fhhmean  = 0;        { number of complete households }
  xtab( f2w );
  Fhhmean = 1;        { to count number of de facto women }
  for i in QHSEC01_EDT do
    if QH04 = 2 & QH06 = 1 & QH09 <> 0 then   { DE FACTO eligible women }
      xtab( f2w );
    endif;
  enddo;

  { Table f2m }
  if QHELIGM = 1 then
    Fhhmeanm = 0;        { number of completed households }
    xtab( f2m );
    Fhhmeanm = 1;                       { to count number of de facto men }
    for i in QHSEC01_EDT do
      if QH04 = 1 & QH06 = 1 & QH10 <> 0 then    { DE FACTO eligible men }
        xtab( f2m );
      endif;
    enddo;
  endif;

  { Table f4w, f4m }
  for i in QHSEC01_EDT do
    if QH04 = 2 & QH07 in 12:18 then                  { women age 12:18 }
      Fage = QH07(i);
      xtab( f4w );
    endif;
    if QHELIGM = 1 & QH04 = 1 & QH07 in 12:18 then    { men age 12:18 }
        Fagem = QH07(i);
        xtab( f4m );
    endif;
  enddo;

  { Tables f11cw1, f11cw2, fc11cw3 }
  for i in QBSEC01_EDT do
    //Fhwc     = notappl;
    Fhwc1    = notappl;
    ftarget2 = notappl;
    if QH07(QB102) in 0:4 & QB104 = 1 then            { children under 5 }
      { result of measurment based on weight }
      fwc11 = measure1( QB105 );
      valdate  = ( valid(QB103M) & validyr(QB103Y) );
      { determine if weight for height z-score out of range }
      if fwc11 = 1 & valdate & QCSD6 in missing,notappl,9996:9998 then ftarget2 = 3 endif;
      if fwc11 = 1 & valdate then                     { weighted & with a valid date of birth }
        hwage   = cmcode(QHINTM,QHINTY) - cmcode(QB103M(i),QB103Y(i));
        hwsex   = QH04(QB102);
        if hwsex = 1 then
          box hwage :   QB105    => hwerr;
               0- 2 :  0.5- 10.0 => 0;
               3- 5 :  1.0- 13.0 => 0;
               6- 8 :  2.0- 15.0 => 0;
               9-11 :  3.0- 16.5 => 0;
              12-14 :  4.0- 17.5 => 0;
              15-17 :  4.0- 18.5 => 0;
              18-20 :  4.0- 19.5 => 0;
              21-23 :  4.5- 20.5 => 0;
              24-26 :  4.5- 23.0 => 0;
              27-29 :  5.0- 24.0 => 0;
              30-32 :  5.0- 24.5 => 0;
              33-35 :  5.0- 25.5 => 0;
              36-38 :  5.0- 26.0 => 0;
              39-41 :  5.0- 27.0 => 0;
              42-44 :  5.0- 29.0 => 0;
              45-47 :  5.0- 29.0 => 0;
              48-50 :  5.0- 30.0 => 0;
              51-53 :  5.0- 31.0 => 0;
              54-56 :  5.5- 32.0 => 0;
              57-60 :  5.5- 33.0 => 0;
              61-72 :  5.5- 34.0 => 0;
                    :          => 1;
          endbox
        else
          box hwage :   QB105    => hwerr;
               0- 2 :  0.5-  9.0 => 0;
               3- 5 :  1.0- 12.0 => 0;
               6- 8 :  2.0- 14.0 => 0;
               9-11 :  2.5- 15.5 => 0;
              12-14 :  3.0- 16.5 => 0;
              15-17 :  3.5- 17.5 => 0;
              18-20 :  3.5- 18.5 => 0;
              21-23 :  4.0- 19.5 => 0;
              24-26 :  4.5- 21.5 => 0;
              27-29 :  5.0- 23.0 => 0;
              30-32 :  5.0- 24.5 => 0;
              33-35 :  5.0- 25.5 => 0;
              36-38 :  5.0- 27.0 => 0;
              39-41 :  5.0- 29.0 => 0;
              42-44 :  5.5- 29.0 => 0;
              45-47 :  5.5- 30.0 => 0;
              48-50 :  5.5- 31.0 => 0;
              51-53 :  5.5- 32.0 => 0;
              54-56 :  6.0- 33.0 => 0;
              57-60 :  6.0- 34.5 => 0;
              61-72 :  6.0- 36.0 => 0;
                    :          => 1;
          endbox
        endif;
        //if hwerr then Fhwc = 1 endif;
        if hwerr then Fhwc1 = 1 endif;
      endif;
      //if !valdate then fhwc = 2 endif;   { incomplete date }
      if !valdate then fhwc1 = 2 endif;   { incomplete date }
      xtab( f11cw1 );

      { f11cw2, f11cw3 }
      if fwc11 = 1 then                        { for children measured }
        fdec1 = GetDecimal( QB105, 1 );
        xtab( f11cw2 );
        fdec2 = GetDecimal( QB105, 2 );
        xtab( f11cw3 );
      endif;

    endif;                           { end children under 5 }
  enddo;

  for i in QBSEC1A_EDT do
    //Fhwc     = notappl;
    Fhwc1    = notappl;
    ftarget2 = notappl;
    if QH07(QG102) in 0:4 & QG104 = 1 then            { children under 5 }
      { result of measurment based on weight }
      fwc11 = measure1( QG105 );
      valdate  = ( valid(QG103M) & validyr(QG103Y) );
      { determine if weight for height z-score out of range }
      if fwc11 = 1 & valdate & QCSD6A in missing,notappl,9996:9998 then ftarget2 = 3 endif;
      if fwc11 = 1 & valdate then                     { weighted & with a valid date of birth }
        hwage   = cmcode(QHINTM,QHINTY) - cmcode(QG103M(i),QG103Y(i));
        hwsex   = QH04(QG102);
        if hwsex = 1 then
          box hwage :   QG105    => hwerr;
               0- 2 :  0.5- 10.0 => 0;
               3- 5 :  1.0- 13.0 => 0;
               6- 8 :  2.0- 15.0 => 0;
               9-11 :  3.0- 16.5 => 0;
              12-14 :  4.0- 17.5 => 0;
              15-17 :  4.0- 18.5 => 0;
              18-20 :  4.0- 19.5 => 0;
              21-23 :  4.5- 20.5 => 0;
              24-26 :  4.5- 23.0 => 0;
              27-29 :  5.0- 24.0 => 0;
              30-32 :  5.0- 24.5 => 0;
              33-35 :  5.0- 25.5 => 0;
              36-38 :  5.0- 26.0 => 0;
              39-41 :  5.0- 27.0 => 0;
              42-44 :  5.0- 29.0 => 0;
              45-47 :  5.0- 29.0 => 0;
              48-50 :  5.0- 30.0 => 0;
              51-53 :  5.0- 31.0 => 0;
              54-56 :  5.5- 32.0 => 0;
              57-60 :  5.5- 33.0 => 0;
              61-72 :  5.5- 34.0 => 0;
                    :          => 1;
          endbox
        else
          box hwage :   QG105    => hwerr;
               0- 2 :  0.5-  9.0 => 0;
               3- 5 :  1.0- 12.0 => 0;
               6- 8 :  2.0- 14.0 => 0;
               9-11 :  2.5- 15.5 => 0;
              12-14 :  3.0- 16.5 => 0;
              15-17 :  3.5- 17.5 => 0;
              18-20 :  3.5- 18.5 => 0;
              21-23 :  4.0- 19.5 => 0;
              24-26 :  4.5- 21.5 => 0;
              27-29 :  5.0- 23.0 => 0;
              30-32 :  5.0- 24.5 => 0;
              33-35 :  5.0- 25.5 => 0;
              36-38 :  5.0- 27.0 => 0;
              39-41 :  5.0- 29.0 => 0;
              42-44 :  5.5- 29.0 => 0;
              45-47 :  5.5- 30.0 => 0;
              48-50 :  5.5- 31.0 => 0;
              51-53 :  5.5- 32.0 => 0;
              54-56 :  6.0- 33.0 => 0;
              57-60 :  6.0- 34.5 => 0;
              61-72 :  6.0- 36.0 => 0;
                    :          => 1;
          endbox
        endif;
        //if hwerr then Fhwc = 1 endif;
        if hwerr then Fhwc1 = 1 endif;
      endif;
      //if !valdate then fhwc = 2 endif;   { incomplete date }
      if !valdate then fhwc1 = 2 endif;   { incomplete date }
      xtab( f11cw1 );

      { f11cw2, f11cw3 }
      if fwc11 = 1 then                        { for children measured }
        fdec1 = GetDecimal( QG105, 1 );
        xtab( f11cw2 );
        fdec2 = GetDecimal( QG105, 2 );
        xtab( f11cw3 );
      endif;

    endif;                           { end children under 5 }
  enddo;

  { Tables f11ch }
  for i in QBSEC01_EDT do
    //Fhwc  = notappl;
    Fhwc1  = notappl;
    ftarget3 = notappl;
    if QH07(QB102) in 0:4 & QB104 = 1 then            { children under 5 }
      { result of measurment based on weight }
      fhc11 = measure5( QB106 );
      valdate  = ( valid(QB103M) & validyr(QB103Y) );
      { determine if height for age z-score out of range }
      if fhc11 = 1 & valdate & QCSD4 in missing,notappl,9996:9998 then ftarget3 = 3 endif;
      if fhc11 = 1 & valdate then                     { measured & with a valid date of birth }
        hwage   = cmcode(QHINTM,QHINTY) - cmcode(QB103M(i),QB103Y(i));
        hwsex   = QH04(QB102);
        if hwsex = 1 then
          box hwage :   QB106    => hwerr;
               0- 2 : 36.0- 74.0 => 0;
               3- 5 : 45.0- 83.0 => 0;
               6- 8 : 51.0- 87.0 => 0;
               9-11 : 56.0- 91.0 => 0;
              12-14 : 59.0- 96.0 => 0;
              15-17 : 62.0-100.0 => 0;
              18-20 : 64.0-104.0 => 0;
              21-23 : 65.0-107.0 => 0;
              24-26 : 67.0-108.0 => 0;
              27-29 : 68.0-112.0 => 0;
              30-32 : 70.0-115.0 => 0;
              33-35 : 71.0-118.0 => 0;
              36-38 : 73.0-121.0 => 0;
              39-41 : 74.0-124.0 => 0;
              42-44 : 75.0-127.0 => 0;
              45-47 : 77.0-129.9 => 0;
              48-50 : 79.0-132.0 => 0;
              51-53 : 79.0-134.0 => 0;
              54-56 : 80.0-136.0 => 0;
              57-60 : 82.0-139.0 => 0;
              61-72 : 82.0-140.0 => 0;
                    :            => 1;
          endbox
        else
          box hwage :   QB106    => hwerr;
               0- 2 : 36.0- 72.0 => 0;
               3- 5 : 44.0- 80.0 => 0;
               6- 8 : 50.0- 86.0 => 0;
               9-11 : 54.0- 90.0 => 0;
              12-14 : 57.0- 95.0 => 0;
              15-17 : 60.0- 99.0 => 0;
              18-20 : 62.0-102.0 => 0;
              21-23 : 64.0-106.0 => 0;
              24-26 : 66.0-107.0 => 0;
              27-29 : 68.0-111.0 => 0;
              30-32 : 69.0-114.0 => 0;
              33-35 : 71.0-117.0 => 0;
              36-38 : 72.0-120.0 => 0;
              39-41 : 74.0-122.0 => 0;
              42-44 : 75.0-124.0 => 0;
              45-47 : 77.0-126.0 => 0;
              48-50 : 78.0-129.0 => 0;
              51-53 : 79.0-131.0 => 0;
              54-56 : 81.0-133.0 => 0;
              57-60 : 81.0-136.0 => 0;
              61-72 : 81.0-137.0 => 0;
                    :            => 1;
          endbox
        endif;
        //if hwerr then Fhwc = 1 endif;
        if hwerr then Fhwc1 = 1 endif;
      endif;                                  { end children measured with valid date of birth }
      //if !valdate then fhwc = 2 endif;   { incomplete date }
      if !valdate then fhwc1 = 2 endif;   { incomplete date }
      xtab( f11ch );
    endif;                           { end children under 5 }
  enddo;

  for i in QBSEC1A_EDT do
    //Fhwc  = notappl;
    Fhwc1  = notappl;
    ftarget3 = notappl;
    if QH07(QG102) in 0:4 & QG104 = 1 then            { children under 5 }
      { result of measurment based on weight }
      fhc11 = measure5( QG106 );
      valdate  = ( valid(QG103M) & validyr(QG103Y) );
      { determine if height for age z-score out of range }
      if fhc11 = 1 & valdate & QCSD4A in missing,notappl,9996:9998 then ftarget3 = 3 endif;
      if fhc11 = 1 & valdate then                     { measured & with a valid date of birth }
        hwage   = cmcode(QHINTM,QHINTY) - cmcode(QG103M(i),QG103Y(i));
        hwsex   = QH04(QG102);
        if hwsex = 1 then
          box hwage :   QG106    => hwerr;
               0- 2 : 36.0- 74.0 => 0;
               3- 5 : 45.0- 83.0 => 0;
               6- 8 : 51.0- 87.0 => 0;
               9-11 : 56.0- 91.0 => 0;
              12-14 : 59.0- 96.0 => 0;
              15-17 : 62.0-100.0 => 0;
              18-20 : 64.0-104.0 => 0;
              21-23 : 65.0-107.0 => 0;
              24-26 : 67.0-108.0 => 0;
              27-29 : 68.0-112.0 => 0;
              30-32 : 70.0-115.0 => 0;
              33-35 : 71.0-118.0 => 0;
              36-38 : 73.0-121.0 => 0;
              39-41 : 74.0-124.0 => 0;
              42-44 : 75.0-127.0 => 0;
              45-47 : 77.0-129.9 => 0;
              48-50 : 79.0-132.0 => 0;
              51-53 : 79.0-134.0 => 0;
              54-56 : 80.0-136.0 => 0;
              57-60 : 82.0-139.0 => 0;
              61-72 : 82.0-140.0 => 0;
                    :            => 1;
          endbox
        else
          box hwage :   QG106    => hwerr;
               0- 2 : 36.0- 72.0 => 0;
               3- 5 : 44.0- 80.0 => 0;
               6- 8 : 50.0- 86.0 => 0;
               9-11 : 54.0- 90.0 => 0;
              12-14 : 57.0- 95.0 => 0;
              15-17 : 60.0- 99.0 => 0;
              18-20 : 62.0-102.0 => 0;
              21-23 : 64.0-106.0 => 0;
              24-26 : 66.0-107.0 => 0;
              27-29 : 68.0-111.0 => 0;
              30-32 : 69.0-114.0 => 0;
              33-35 : 71.0-117.0 => 0;
              36-38 : 72.0-120.0 => 0;
              39-41 : 74.0-122.0 => 0;
              42-44 : 75.0-124.0 => 0;
              45-47 : 77.0-126.0 => 0;
              48-50 : 78.0-129.0 => 0;
              51-53 : 79.0-131.0 => 0;
              54-56 : 81.0-133.0 => 0;
              57-60 : 81.0-136.0 => 0;
              61-72 : 81.0-137.0 => 0;
                    :            => 1;
          endbox
        endif;
        //if hwerr then Fhwc = 1 endif;
        if hwerr then Fhwc1 = 1 endif;
      endif;                                  { end children measured with valid date of birth }
      //if !valdate then fhwc = 2 endif;   { incomplete date }
      if !valdate then fhwc1 = 2 endif;   { incomplete date }
      xtab( f11ch );
    endif;                           { end children under 5 }
  enddo;

  { Tables f11ww1, f11ww2, f11ww3 }
  for i in QBSEC02_EDT do
    Fhww = notappl;
    fww11 = measure2( QB205 );
    if fww11 = 1 then
      if QB205 in 0.0:19.0,151.0:900.0 then { weight out of range }
        Fhww = 1;
      endif;
    endif;
    xtab( f11ww1 );
    { f11ww2, f11ww3 }
    if fww11 = 1 then                        { for women measured }
      fdec1 = GetDecimal( QB205, 1 );
      xtab( f11ww2 );
      fdec2 = GetDecimal( QB205, 2 );
      xtab( f11ww3 );
    endif;
  enddo;

  { Tables f11wh }
  for i in QBSEC02_EDT do
    Fhww = notappl;
    fhw11 = measure5( QB206 );
    if fhw11 = 1 then
      if QB206 in 0.0:99.0,201.0:900.0 then { height out of range }
        Fhww = 1;
      endif;
    endif;
    xtab( f11wh );
  enddo;

  { Tables f12c1, f12c2 }
  for i in QBSEC01_EDT do
    fanc = notappl;
    if QB109 = 2 then
      fac12 = measure3( QB117 );
      if QB117 in 0.0:3.9,26.1:99.0 then
        fanc = 1;
      endif;
      xtab( f12c1 );
      if fac12 = 1 then
        fdec1 = GetDecimal( QB117, 1 );
        xtab( f12c2 );
      endif;
    endif;
  enddo;

  { Tables f12w1, f12w2 }
  for i in QBSEC02_EDT do
    fanw = notappl;
    faw12 = measure3( QB216 );
    if QB216 in 0.0:3.9,26.1:99.0 then
      fanw = 1;
    endif;
    xtab( f12w1 );
    if faw12 = 1 then
      fdec1 = GetDecimal( QB216, 1 );
      xtab( f12w2 );
    endif;
  enddo;

  { tables for Individual Questionnaire }
  do k = 1 while k <= soccurs( QHSEC01 )
    if QH09(k) | QH10(k) then               { if mmember is eligible }
      QLINE = QH09(k);
      if QH10(k) then QLINE = QH10(k) endif;
      if loadcase( BJIN70, QHCLUST, QHNUMBER, QLINE ) then   { if member found in individual questionnaire }

        Fteams   = notappl;
        fintnum  = QINTNUM;  { !!!! make sure to adjust the value sets based on the actual interviewer codes for the survey }
        fresult  = QRESULT;
        fmresult = QRESULT;
        if byteam then
          { !! recode teams as necessary }
          Fteams = int( fintnum/100 );               {!!}
          fintnum = notappl;
        endif;

        { Table f3wu, f3mu, f3wr, f3mr }
        if QHTYPE = 1 then
          if QQTYPE = 2 & QH06(QLINE) = 1 then  { DE FACTO women }
            xtab( f3wu );
          elseif QQTYPE = 1 & QH06(QLINE) = 1 then  { DE FACTO men }
            xtab( f3mu );
          endif;
        else
          if QQTYPE = 2 & QH06(QLINE) = 1 then  { DE FACTO women }
            xtab( f3wr );
          elseif QQTYPE = 1 & QH06(QLINE) = 1 then  { DE FACTO men }
            xtab( f3mr );
          endif;
        endif;

        { skip incomplete individual interviews }
        if QRESULT <> 1 then next endif;

        if QQTYPE = 2 & QH06(QLINE) = 1 then        { DE FACTO women }

          { Tables f5 }
          Fceb     = 1;       { All completed women }
          xtab( f5 );
          Fceb = 2;   { Children ever born }
          xtab( f5, Q208 );

          { Table f6 }
          for i in BJIN70.QWSEC2B do
            if Q215Y = missing | Q215Y >= cutoff - 4 then
              Fyearb = Q215Y;
              if Q215Y in missing,9997:9998 then Fyearb = 9999 endif;
              xtab( f6 );
            endif;
          enddo;

          { Tables f7l & f7d }
          for i in BJIN70.QWSEC2B do
            //fhwc1     = notappl;
            ismonth = valid(Q215M);
            isyear  = validyr(Q215Y);
            if Q216 = 1 then
              isage = valid(Q217);
              box isyear : ismonth : isage => Fcompl;
                       1 :       1 :       => 1;
                       1 :         :     1 => 2;
                       1 :       0 :     0 => 3;
                       0 :       0 :     1 => 4;
                         :         :       => 5;
              endbox;
              xtab( f7l );
{*** Fidele
             { Fidele: Check where no valdate & date of birth in Birth History }
             if Q219 <> 0 & QH07(Q219) in 0:4 then            { children under 5 }
               if (QG104(Q219) = 1 | QB104(Q219)) = 1 then
                 if measure1( QB105(Q219) ) = 1 | measure1( QG105(Q219) ) = 1 |             { children was measured - Weight }
                    measure5( QB106(Q219) ) = 1 | measure5( QG106(Q219) ) = 1 then          { children was measured - Height }
                 { result of measurment based on weight }
                   ftotalc2  = notappl;
                   fhwc1     = notappl;
                   fhc11     = notappl;
                   Fhwc1     = notappl;
                   ftarget3  = notappl; 
                   fwc11     = notappl;
                   ftarget2  = notappl;
                   if !(valid(QB103M(Q219)) & validyr(QB103Y(Q219))) |
                      !(valid(QG103M(Q219)) & validyr(QG103Y(Q219))) & 
                     Fcompl = 1  then 
                       fhwc1  = 3;        {Date from Birth History  }
                     xtab( f11cw1 );               
                     xtab( f11ch );
                   endif;      
                 endif;
                 fhwc1  = notappl;
               endif;
             endif; 
             ftotalc2 = 1;
*** Fidele}
            else
              box isyear : ismonth  => Fcompd;
                       1 :       1  => 1;
                       1 :       0  => 2;
                       0 :       1  => 3;
                         :          => 4;
              endbox;
              xtab( f7d );
            endif;
          enddo;

          { Tables f8 }
          for i in BJIN70.QWSEC2B do
            if Q216 = 2 & ( !validyr(Q215Y) | Q215Y >= QINTY-15 ) then   { deaths in the last 15 years }
              unitx  = Q220U;
              number = Q220N;
              box  unitx : number => Faged;
                     2   : 8-12   => number-8;  { codes 0:4 }
                     3   : 1      => 5;
                     2   : 13-16  => number-7;  { codes 6:9 }
                         :        => notappl;
              endbox;
              if Faged <> notappl then
                xtab( f8 );
              endif;
            endif;
          enddo;

          { Table f9 }
          for i in BJIN70.QWSEC2B do
            if !validyr(Q215Y) | Q215Y >= QINTY-15 then       { births last 15 years }
              Falive = notappl;
              Faged9 = notappl;
              if Q216 = 2 then
                unitx  = Q220U(i);
                number = Q220N(i);
                box  unitx : number => Faged9;
                      1    : 0-30   => 1;
                      1    : 31-96  => 2;
                      2    : 0      => 1;
                      2    : 1-11   => 2;
                      2    : 12-96  => 3;
                      3    :        => 3;
                           :        => 4;
                endbox;
              else
                Falive = 1;
              endif;
              xtab( f9 );
              if QTYPE = 1 then
                xtab( f9u );
              else
                xtab( f9r );
              endif;
            endif;
          enddo;

          { Table f10 }
          for i in BJIN70.QWSEC05 do
            if Q216(Q502) = 1 then { Living children }
              if Q504 in 1:3  then   { with a vacination card or other document }
                fcardr = 1;
                xtab( f10 );
              endif;
              if Q507 in 1:3 then       { vaccination card or other document seen }
                fcardr = 2;
                xtab( f10 );
              endif;
              fcardr = 3;             { all children }
              xtab( f10 );
            endif;
          enddo;
{
          { table f14 }
          Fcol14b = notappl;
          Fcol14c = notappl;
          for i in BJIN70.QWSECM3 do
            if Q1314 = 2 & Q1315 = 2 then       { Deceased sister }
              fcol14a = 1;
              xtab( f14 );
              if !valid(Q1318) then
                fcol14a = 2;
                xtab( f14 );
              endif;
              Fcol14a = notappl;
              if Q1318 in 12:96 then
                fcol14b = 1;
                xtab( f14 );
                if Q1319 = missing & Q1320 = missing & Q1321 = missing then
                  fcol14b = 2;
                  xtab( f14 );
                endif;
                fcol14b = notappl;
                fcol14c = 1;
                xtab( f14 );
                if !valid(Q1317) then
                  fcol14c = 2;
                  xtab( f14 );
                endif;
                fcol14c = notappl;
              endif;
            endif;
          enddo;
}
          { f15 }
          if QHNUMDV = QLINE then               { woman eligible for doemstic violence }
            resdv = 1;
            xtab( f15 );
            if Q1501 <> 1 then                   { privacy not obtined }
              resdv = 2;
              xtab( f15 );
            endif;
          endif;
        endif;                                  { end DE FACTO women }
      endif;                                 { end found individual member }
    endif;                               { end found individual member }
  enddo;

