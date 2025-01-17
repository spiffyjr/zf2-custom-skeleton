<?php

return array(
    'console' => array(
        'router' => array(
            'routes' => array(
            ),
        ),
    ),

    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',

        'template_map' => array(
            'error/index' => __DIR__ . '/../view/error/index.phtml',
            'error/404'   => __DIR__ . '/../view/error/404.phtml',
        )
    ),
);
