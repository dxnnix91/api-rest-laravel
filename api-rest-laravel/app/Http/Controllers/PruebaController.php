<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\User;
use App\Category;

class PruebaController extends Controller
{
    public function prueba(){

        
        return 'Hola desde prueba controller';
    }

    public function testORM(){
        $posts = Post::All();

        foreach($posts as $post){
            echo "<h1>$post->title</h1>";
            echo "<p>$post->content</p>";
            echo "<small>Creado por: {$post->user->name}</small><br>";
            echo "<small>Categoria: {$post->category->name}</small>";
        }

        die();
    }

}
