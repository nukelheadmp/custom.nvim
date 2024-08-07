"let g:dadbods = []
"let db = {
"		\"name": "ReportServer",
"		\"url": ""
"		\}
"
"call add(g:dadbods, db)

""\"url": "jdbc:sqlserver://test@data.pmc.com/Test_AX"
"" if g:db and b:db is set up -- b:db will be used.
"" so g:db would serve as a default database (first in the list)
"let g:db = g:dadbods[0].url

let g:dbs = {
      \ "prod_ax": "jdbc:sqlserver://pm-db-01.PMC.COM;database=prod_ax;authenticationScheme=JavaKerberos;integratedSecurity=true",
      \ "data": "jdbc:sqlserver://data.PMC.COM;authenticationScheme=JavaKerberos;integratedSecurity=true;domain=PMC",
      \ "pm-db-02": "jdbc:sqlserver://pm-db-02.PMC.COM;database=master;authenticationScheme=JavaKerberos;integratedSecurity=true;domain=PMC",
      \ }
