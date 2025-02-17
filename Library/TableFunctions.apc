  string SDGChapt, Line;
  File   SDGFile;

  numeric asterisk = 999999999;     // constant to be used by tables editor to put an * in a cell
  numeric omitted  = 999999998;     // constant to be used by tables editor to put an a in a cell
  numeric NAcells  = 999999997;     // constant to be used by tables editor to put na in a cell

  { function to check unweighted N's for a two dimension tables where the N is in column ColNu }
  { parameters:                                                                                }
  { TabName: the table name used to display error messages                                     }
  { TableW:  the two dimensions weighted table                                                 }
  { ColBeg:  first column where the percentages in the weighted table affected by the N begins }
  { ColEnd:  last column where the percentages in the weighted table affected by the N ends    }
  { TableU:  the two dimensions un-weighted table                                              }
  { ColNu:   column where the table's unweighted Ns are kept                                   }
  function Col2Dim( alpha(15) TabName, array TableW(,), ColBeg, ColEnd, array TableU(,), ColNu )
    numeric r, c, value;
    if tblrow( TableW ) <> tblrow( TableU ) then
      errmsg( "Weighted and un-weighted tables have different number of rows for table: %s", TabName );
      exit;
    endif;
    do r = 0 while r <= tblrow( TableU )
      value = 0;
      { check number of unweighted N's }
      if TableU(r,ColNu) < 25 then
        value = asterisk
      elseif TableU(r,ColNu) < 50 then
        value = -1;
      endif;
      if value <> 0 then
        do c = ColBeg while c <= ColEnd
          if value = asterisk then
            TableW(r,c) = value
          else
            if TableW(r,c) = 0 then TableW(r,c) = 0.000001 endif;  { to make sure that 0 gets in parentheses }
            TableW(r,c) = TableW(r,c) * value
          endif;
        enddo;
      endif;
    enddo;
  end;

  { function to check unweighted N's for a two dimension tables where the N is in row RowNu    }
  { parameters:                                                                                }
  { TabName: the table name used to display error messages                                     }
  { TableW:  the two dimensions weighted table                                                 }
  { RowBeg:  first row where the percentages in the weighted table affected by the N begins    }
  { RowEnd:  last row where the percentages in the weighted table affected by the N ends       }
  { TableU:  the two dimensions un-weighted table                                              }
  { RowNu:   row where the table's unweighted Ns are kept                                      }
  function Row2Dim( alpha(15) TabName, array TableW(,), RowBeg, RowEnd, array TableU(,), RowNu )
    numeric r, c, value;
    if tblcol( TableW ) <> tblcol( TableU ) then
      errmsg( "Weighted and un-weighted tables have different number of columns for table: %s", TabName );
      exit;
    endif;
    do c = 0 while c <= tblcol( TableU )
      value = 0;
      { check number of unweighted N's }
      if TableU(RowNu,c) < 25 then
        value = asterisk
      elseif TableU(RowNu,c) < 50 then
        value = -1;
      endif;
      if value <> 0 then
        do r = RowBeg while r <= RowEnd
          if value = asterisk then
            TableW(r,c) = value
          else
            if TableW(r,c) = 0 then TableW(r,c) = 0.000001 endif;  { to make sure that 0 gets in parentheses }
            TableW(r,c) = TableW(r,c) * value
          endif;
        enddo;
      endif;
    enddo;
  end;

  { function to check unweighted N's for three dimension tables where the N is in column ColNu }
  { parameters:                                                                                }
  { TabName: the table name used to display error messages                                     }
  { TableW:  the three dimensions weighted table                                               }
  { ColBeg:  first column where the percentages in the weighted table affected by the N begins }
  { ColEnd:  last column where the percentages in the weighted table affected by the N ends    }
  { TableU:  the three dimensions un-weighted table                                            }
  { ColNu:   column where the table's unweighted Ns are kept                                   }
  function Col3Dim( alpha(15) TabName, array TableW(,,), ColBeg, ColEnd, array TableU(,,), ColNu )
    numeric r, c, l, value;
    if tblrow( TableW ) <> tblrow( TableU ) | tbllay( TableW ) <> tbllay( TableU ) then
      errmsg( "Weighted and un-weighted tables have different number of rows or layers for table: %s", TabName );
      exit;
    endif;
    do l = 0 while l <= tbllay( TableU )
      do r = 0 while r <= tblrow( TableU )
        value = 0;
        { check number of unweighted N's }
        if TableU(r,ColNu,l) < 25 then
          value = asterisk
        elseif TableU(r,ColNu,l) < 50 then
          value = -1;
        endif;
        if value <> 0 then
          do c = ColBeg while c <= ColEnd
            if value = asterisk then
              TableW(r,c,l) = value
            else
              if TableW(r,c,l) = 0 then TableW(r,c,l) = 0.000001 endif;  { to make sure that 0 gets in parentheses }
              TableW(r,c,l) = TableW(r,c,l) * value
            endif;
          enddo;
        endif;
      enddo;
    enddo;
  end;

  { function to check unweighted N's for three dimension tables where the N is in row RowNu    }
  { parameters:                                                                                }
  { TabName: the table name used to display error messages                                     }
  { TableW:  the three dimensions weighted table                                               }
  { RowBeg:  first row where the percentages in the weighted table affected by the N begins    }
  { RowEnd:  last row where the percentages in the weighted table affected by the N ends       }
  { TableU:  the three dimensions un-weighted table                                            }
  { RowNu:   row where the table's unweighted Ns are kept                                      }
  function Row3Dim( alpha(15) TabName, array TableW(,,), RowBeg, RowEnd, array TableU(,,), RowNu )
    numeric r, c, l, value;
    if tblcol( TableW ) <> tblcol( TableU ) | tbllay( TableW ) <> tbllay( TableU ) then
      errmsg( "Weighted and un-weighted tables have different number of columns or layers for table: %s", TabName );
      exit;
    endif;
    do l = 0 while l <= tbllay( TableU )
      do c = 0 while c <= tblcol( TableU )
        value = 0;
        { check number of unweighted N's }
        if TableU(RowNu,c,l) < 25 then
          value = asterisk
        elseif TableU(RowNu,c,l) < 50 then
          value = -1;
        endif;
        if value <> 0 then
          do r = RowBeg while r <= RowEnd
            if value = asterisk then
              TableW(r,c,l) = value
            else
              if TableW(r,c,l) = 0 then TableW(r,c,l) = 0.000001 endif;  { to make sure that 0 gets in parentheses }
              TableW(r,c,l) = TableW(r,c,l) * value
            endif;
          enddo;
        endif;
      enddo;
    enddo;
  end;

  { function to check unweighted N's cell by cell in a two dimension tables                  }
  { parameters:                                                                              }
  { TabName: the table name used to display error messages                                   }
  { TableW:  the two dimensions weighted table                                               }
  { TableU:  the two dimensions un-weighted table                                            }
  function CellUnw( alpha(15) TabName, array TableW(,), array TableU(,) )
    numeric r, c;
    if tblcol( TableW ) <> tblcol( TableU ) | tblrow( TableW ) <> tblrow( TableU ) then
      errmsg( "Weighted and un-weighted tables have different number of columns or rows for table: %s", TabName );
      exit;
    endif;
    do r = 0 while r <= tblrow( TableU )
      do c = 0 while c <= tblcol( TableU )
        { check number of unweighted N's }
        if TableU(r,c) < 25 then
          TableW(r,c) = asterisk;
        elseif TableU(r,c) < 50 then
          if TableW(r,c) = 0 then TableW(r,c) = 0.000001 endif;  { to make sure that 0 gets in parentheses }
          TableW(r,c) = TableW(r,c) * (-1)
        endif;
      enddo;
    enddo;
  end;

  { function to check unweighted N's for age specific and total fertitliy rates.               }
  { parameters:                                                                                }
  { TabName: the table name used to display error messages                                     }
  { TableW:  the weighted table with the final fertility rates                                 }
  { TableU:  the un-weighted table with years of exposure                                      }
  { RowEnd:  Row where the checking ends                                                       }
  { ColEnd:  Column where the checking ends                                                    }
  { WhatCol: Specifies columns where check will be applied: 0-several, 1-0, 2-1                }
  function FERTUnw( alpha(15) TabName, array TableW(,), array TableU(,), RowEnd, ColEnd, WhatCol )
    numeric r, c, value, colbeg = 0, col;
    if WhatCol then ColBeg = ColEnd endif;
    do r = 0 while r <= RowEnd
      do c = colbeg while c <= ColEnd
        value = 0;
        { check number of unweighted N's }
        if TableU(r,c) < 125 then
          value = asterisk
        elseif TableU(r,c) < 250 then
          value = -1;
        endif;
        recode Whatcol -> col;
                 0    -> c;
                 1    -> 0;
                 2    -> 1;
        endrecode;
        if value <> 0 then
          if value = asterisk then
            TableW(r,col) = value
          else
            if TableW(r,col) = 0 then TableW(r,col) = 0.000001 endif;  { to make sure that 0 gets in parentheses }
            TableW(r,col) = TableW(r,col) * value
          endif;
        endif;
      enddo;
    enddo;
  end;

  { function to check unweighted N's for median duration for current status                    }
  { parameters:                                                                                }
  { TabName: the table name used to display error messages                                     }
  { TableW:  the weighted table with the final median                                          }
  { TableU:  the un-weighted table with number of births                                       }
  { RowTab:  Row of the characteristic being checked                                           }
  { ColTab:  Column for the type of median                                                     }
  { ColMed:  Column (age group) where the median was identified                                }
  function MEDUnw( alpha(15) TabName, array TableW(,), array TableU(,), RowTab, ColTab, ColMed )
    numeric ncases = 0, value = 0;
    if tblrow( TableW ) <> tblrow( TableU ) then
      errmsg( "Weighted and un-weighted tables have different number of rows for table: %s", TabName );
      exit;
    endif;
    if ColMed >= 0 then                  // check if 50% falls above the first age group
      ncases = TableU(RowTab,ColMed);
      if ColMed = tblcol( TableU ) then
        ncases = ncases + TableU(RowTab,ColMed-1)
      elseif ColMed <> 0 then
        ncases = ncases + TableU(RowTab,ColMed-1)+TableU(RowTab,ColMed+1)
      endif;
    endif;
    { check number of unweighted N's }
    if ColMed < 0 then
      value = omitted
    elseif ncases < 25 then
      value = asterisk
    elseif ncases < 50 then
      value = -1;
    endif;
    if value = asterisk | value = omitted then
      TableW(RowTab,ColTab) = value
    elseif value = -1 then
      if TableW(RowTab,ColTab) = 0 then TableW(RowTab,ColTab) = 0.000001 endif;  { to make sure that 0 gets in parentheses }
      TableW(RowTab,ColTab) = TableW(RowTab,ColTab) * value
    endif;
  end;

  { function to check unweighted N's for mortality rates for five year periods                 }
  { parameters:                                                                                }
  { TabName: the table name used to display error messages                                     }
  { TableW:  the weighted table with mortality rates for total                                 }
  { TableU:  the un-weighted table with exposure for total                                     }
  function MORTUnw1( alpha(15) TabName, array TableW(,), array TableU(,) )
    numeric r, c, e, value, expbeg, expend;
    if tblrow( TableW ) <> tblrow( TableU ) then
      errmsg( "Weighted and un-weighted number of periods to check table: %s different", TabName );
      exit;
    endif;
    do r = 0 while r <= tblrow( TableU )       { for each 5 years period }
      do c = 0 while c <= 4                { for each rate 0-Neonatal, 1-Post neonatal, 2-Infant, 3-child, 4-under 5 }
        recode c -> expbeg;
              0 -> 0;           { neonatal - start at exposure 0 months }
              1 -> 1;           { post-neo - start at exposure 1-2 }
              2 -> 0;           { infant   - start at exposure 0 }
              3 -> 4;           { child    - start at exposure 12-23 }
              4 -> 0;           { under 5  - start at exposure 0 }
        endrecode;
        recode c -> expend;
              0 -> 0;           { neonatal - include exposure 0 months }
              1 -> 3;           { post-neo - include exposure 1-2, 3-5, 6-11 }
              2 -> 3;           { infant   - include exposure 0, 1-2, 3-5, 6-11 }
              3 -> 6;           { child    - include exposure 12-23, 24-35, 36-47 }
              4 -> 7;           { under 5  - include all groups of exposure }
        endrecode;
        { check number of unweighted N's in the exposures afecting the rate }
        value = 0;
        do e = expbeg while e <= expend
          if TableU(r,e) < 250 then
            value = 1
          elseif TableU(r,e) < 500 & value = 0 then
            value = 2
          endif;
        enddo;
        if value = 1 then
          TableW(r,c) = asterisk
        elseif value = 2 then
          if TableW(r,c) = 0 then TableW(r,c) = 0.000001 endif;  { to make sure that 0 gets in parentheses }
          TableW(r,c) = TableW(r,c) * (-1)
        endif;
      enddo;
    enddo;
  end;

  { check unweighted N's for mortality rates for tables by background characteristics          }
  { parameters:                                                                                }
  { TabName: the table name used to display error messages                                     }
  { TableW:  the weighted table with mortality rates by background charactstics                }
  { TableU:  the un-weighted table with exposure for an specific background characteristic     }
  function MORTUnw2( alpha(15) TabName, array TableW(,), array TableU(,) )
    numeric r, c, e, value, expbeg, expend;
    if tblrow( TableW ) <> tblrow( TableU ) then
      errmsg( "Weighted and un-weighted number of rows to check table: %s different", TabName );
      exit;
    endif;
    do r = 0 while r <= tblrow( TableU );
      do c = 0 while c <= 4                { for each rate 0-Neonatal, 1-Post neonatal, 2-Infant, 3-child, 4-under 5 }
        recode c -> expbeg;
              0 -> 0;           { neonatal - start at exposure 0 months }
              1 -> 1;           { post-neo - start at exposure 1-2 }
              2 -> 0;           { infant   - start at exposure 0 }
              3 -> 4;           { child    - start at exposure 12-23 }
              4 -> 0;           { under 5  - start at exposure 0 }
        endrecode;
        recode c -> expend;
              0 -> 0;           { neonatal - include exposure 0 months }
              1 -> 3;           { post-neo - include exposure 1-2, 3-5, 6-11 }
              2 -> 3;           { infant   - include exposure 0, 1-2, 3-5, 6-11 }
              3 -> 7;           { child    - include exposure 12-23, 24-35, 36-47, 48-59 }
              4 -> 7;           { under 5  - include all groups of exposure }
        endrecode;
        { check number of unweighted N's in the exposures afecting the rate }
        value = 0;
        do e = expbeg while e <= expend
          if TableU(r,e) < 250 then
            value = 1
          elseif TableU(r,e) < 500 & value = 0 then
            value = 2
          endif;
        enddo;
        if value = 1 then
          TableW(r,c) = asterisk
        elseif value = 2 then
          if TableW(r,c) = 0 then TableW(r,c) = 0.000001 endif;  { to make sure that 0 gets in parentheses }
          TableW(r,c) = TableW(r,c) * (-1)
        endif;
      enddo;
    enddo;
  end;

  { calculates the number of days since january 1, 1900 up to the date given in the parameters }
  { the function assumes that the day (zday) within month (zmonth) is consistent               }
  function CDCode( zyear, zmonth, zday )
    numeric z, zz, zdays1 = 0, zdays2 =0, leapday, totdays = 99999;
    if !zyear in 1900:2170 | !zmonth in 1:12 | !zday in 1:31 then
      errmsg( "Invalid date to calculate CDC Year=%04d, Month=%02d, day=%02d", zyear, zmonth, zday );
    else
      { number of days between 1900 and zyear }
      do z = 1900 while z < zyear
        zdays1 = zdays1 + 365 + (z % 4 = 0);
      enddo;
      { number of days up to the month in year zyear }
      leapday = (zyear % 4 = 0);
      do z = 1 while z < zmonth
        recode    z    -> zz;
          1,3,5,7,8,10 -> 31;
                    2 -> 28+leapday;
              4,6,9,11 -> 30;
        endrecode;
        zdays2 = zdays2 + zz;
      enddo;
      { total days }
      totdays = zdays1 + zdays2 + zday;
    endif;
    CDCode = totdays;
  end

  { write one file for each SDG indicator }
  function SDGIndicator( string Name, ValInd1, ValInd2, ValIndTot )
    SDGChapt = "..\tables\SDG" + Name + ".TXT";
    setfile( SDGFile, SDGChapt );
    if FileExist( SDGChapt ) then
      FileDelete( SDGFile );
    endif;
    Line = MakeText( "%-20s %10.1f %10.1f %10.1f", Name, ValInd1, ValInd2, ValIndTot );
    FileWrite( SDGFile, Line );
  end;

