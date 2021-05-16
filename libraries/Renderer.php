<?php

class Renderer
{
    /**
     * le paramètre $path permet d'accèder au chemin demandé dans la page concernée
     *
     * @param string $path
     * @param array $variables
     * @return void
     */
    public static function render(string $path, array $variables = []): void
    {
        // Sortir les données dans le tableau associatif $variables[] sous en forme des véritables variables. Cettes variables sont déclarées dans la page concernée
        extract($variables);

        ob_start();
        require('templates/' . $path . '.html.php');
        $pageContenu = ob_get_clean();

        require('templates/layout.html.php');
    }
}
