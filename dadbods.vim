let g:dadbods = []
let db = {
		\"name": "Test AX",
		\"url": "jdbc:sqlserver://data.pmc.com;database=Test_AX;authenticationScheme=NTLM;integratedSecurity=true;domain=PMC"
		\}

call add(g:dadbods, db)


"\"url": "jdbc:sqlserver://test@data.pmc.com/Test_AX"
" if g:db and b:db is set up -- b:db will be used.
" so g:db would serve as a default database (first in the list)
let g:db = g:dadbods[0].url
