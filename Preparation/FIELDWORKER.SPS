DATA LIST FILE='C:\CC81\PREPARATION\FIELDWORKER.DAT' RECORDS=1
 /
 FW101       1-4   
 FW105       5-5   
 FW106       6-6   
 FW107       7-8   
 FW109       9-9   
.
VARIABLE LABELS
  FW101    "Codigo de trabajador de campo"
 /FW105    "Sexo del trabajador de campo"
 /FW106    "Estado civil del trabajador de campo"
 /FW107    "Numero de hijos vivos del trabajador de campo"
 /FW109    "Nivel de educacion alcanzado por trabajador de campo"
.
VALUE LABELS
  FW105   
     1 "Hombre"
     2 "Mujer"
 /FW106   
     1 "Casada(o)"
     2 "Union libre"
     3 "Viuda(o)"
     4 "Divorciada(o)"
     5 "Separada(o)"
     6 "Nunca casada(o)/unida(o)"
 /FW109   
     1 "Primaria"
     2 "Secundaria"
     3 "Superior"
.
EXECUTE.
