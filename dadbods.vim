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
      \ "prod_ax": "jdbc:sqlserver://megatron.pmc.com;database=prod_ax;authenticationScheme=NTLM;integratedSecurity=true;domain=PMC",
      \ "test_ax": "jdbc:sqlserver://data.pmc.com;database=test_ax;authenticationScheme=NTLM;integratedSecurity=true;domain=PMC",
      \ "ReportServer": "jdbc:sqlserver://pm-db-02.pmc.com;database=ReportServer;authenticationScheme=NTLM;integratedSecurity=true;domain=PMC",
      \ }
