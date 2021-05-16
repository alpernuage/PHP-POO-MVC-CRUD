<?php

// Cette class s'occupe de tous qui est requête et la réponse

class Http
{
    /**
     * Redirige le visiteur vers $url
     *
     * @param string $url
     * @return void
     */
    public static function redirect(string $url): void
    {
        header("Location: $url");
        exit();
    }
}
