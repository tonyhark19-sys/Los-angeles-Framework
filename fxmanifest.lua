fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'LA Framework Team'
description 'framework-admin - Admin command and permission layer'
version '1.0.0'

dependencies {
    'framework-core',
    'framework-jobs',
    'framework-inventory',
    'framework-utils'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}
