<?php

$cfg['blowfish_secret'] = '1234567890fngoc1234567890_1234567890fngoc1234567890';

$i = 1;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['host'] = 'mysql-svc';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

 $cfg['Servers'][$i]['port'] = '3306';
 $cfg['Servers'][$i]['controluser'] = 'root';
 $cfg['Servers'][$i]['controlpass'] = 'pass';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';