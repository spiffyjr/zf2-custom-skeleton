<?php
return array(
    'asset_manager' => array(
        'caching' => array(
            'default' => array(
                'cache' => 'FilePath',
                'options' => array(
                    'dir' => 'public'
                )
            ),
        ),

        'resolver_configs' => array(
            'collections' => array(
                'css/site.min.css' => array(
                    'css/bootstrap.min.css',
                    'css/bootstrap-theme.min.css',
                    'css/site.css'
                ),

                'js/site.min.js' => array(
                    'js/jquery.min.js',
                    'js/bootstrap.min.js',
                ),

                'js/ie9.min.js' => array(
                    'js/html5shiv.js',
                    'js/respond.min.js'
                )
            ),

            'map' => array(
                'css/bootstrap.min.css'       => 'module/Application/public/css/bootstrap.min.css',
                'css/bootstrap-theme.min.css' => 'module/Application/public/css/bootstrap-theme.min.css',
                'css/site.css'                => 'module/Application/public/css/site.css',

                'js/bootstrap.min.js' => 'module/Application/public/js/bootstrap.min.js',
                'js/jquery.min.js'    => 'module/Application/public/js/jquery.min.js'
            ),
        ),
    ),
);