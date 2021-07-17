<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    public function register(Request $request){
        $json = $request->input('json', null);
        
        return "El nombre es : $json";
    }
    public function login(){
        return 'hola desde pruebaUserController';
    }


}
