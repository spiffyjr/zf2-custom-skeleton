<?php

// You can change this to `twig` if you use ZfcTwig.
$viewExtension = 'twig';

return array(
    'spiffy_config' => array(
        // Enables Runtime configuration - disable in production.
        'enabled' => true,

        // Resolvers locate files or information for builders to process.
        'resolvers' => array(
            'controller' => array(
                'type' => 'SpiffyConfig\Resolver\File',
                'options' => array(
                    'paths' => array(
                        'module/Application/src/Application/Controller'
                    ),
                    'name' => '*.php',
                ),
            ),

            $viewExtension => array(
                'type' => 'SpiffyConfig\Resolver\File',
                'options' => array(
                    'paths' => array(
                        'module/Application/view'
                    ),
                    'name' => '*.' . $viewExtension
                ),
            ),
        ),

        // Collections what resolvers and builders work together.
        'collections' => array(
            'default' => array(
                array(
                    'resolver' => 'controller',
                    'builders' => array(
                        'ControllerLoader',
                        'Router',
                    )
                ),
                array(
                    'resolver' => $viewExtension,
                    'builders' => array(
                        'TemplateMap'
                    )
                )
            )
        ),
    ),
);
