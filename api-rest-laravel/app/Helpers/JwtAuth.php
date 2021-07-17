<?php
namespace App\Helpers;

use Firebase\JWT\JWT;
use Illuminate\Support\Facades\DB;
use App\User;

class JwtAuth{

    public $key;

    public function __construct(){
        $this->key = 'clave_secreta-98764654';
    }

    public function signup($email, $password, $getToken = null){

        //Buscar si existe el usurio con sus credenciales
        $user = User::where([
            'email'     => $email,
            'password'  => $password
        ])->first();

        //Comprobar si la busqueda es correcta
        $signup = false;

        if(is_object($user)){
            $signup = true;
        }

        //Generar el tocken
        if($signup){
            $token = array(
                'sub'       => $user->id,
                'email'     => $user->email,
                'name'      => $user->name,
                'surname'   => $user->surname,
                'iat'       => time(),
                'exp'       => time() + ( 7 * 24 * 60 )
            );

            $jwt = JWT::encode($token, $this->key, 'HS256');
            $decoded = JWT::decode($jwt, $this->key, ['HS256']);

            //Devolver el token
            if(is_null($getToken)){
                $data = $jwt;
            }else{
                $data = $decoded;
            }

        }else{
            $data = array(
                'status'    => 'error',
                'message'   => 'Login incorrecto'
            );
        }

        return $data;

    }

}