<?php

$config = [
    'root' => $_SERVER['DOCUMENT_ROOT']. '/blog_projet/images',
    'baseurl' => $_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['SERVER_NAME'].'/blog_projet/images/',
    'maxFileSize' => '8mb',
    'createThumb' => false,
    'extensions' => ['jpg', 'png', 'gif', 'jpeg'],
];

return $config;