<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
    public function register(Request $request){

        $json = $request->input('json', null);
        $params = json_decode($json); //objeto
        $params_array = json_decode($json, true);//array

        if(!empty($params) && !empty($params_array)){
        //Limpiar datos para evitar espacios
        $params_array = array_map('trim',  $params_array);
        
        $validate = \Validator::make($params_array, [
            'name'      => 'required|alpha',
            'surname'   => 'required|alpha',
            'email'     => 'required|email|unique:users',
            'password'  => 'required'
        ]);

        if($validate->fails()){
            $data = array(
                'status'    => 'error',
                'code'      => 404,
                'message'   => 'El usuario no se a podido crear',
                'errors'    => $validate->errors()
            );
            
        }else{

            //Cifrar la contraseña

            $pwd = hash('sha256', $params->password);

            $user = new User();

            $user->name = $params_array['name'];
            $user->surname = $params_array['surname'];
            $user->email = $params_array['email'];
            $user->password = $pwd;
            $user->role = 'ROLE_USER';
            //guardar el usurio
            $user->save();



            $data = array(
                'status'    => 'success',
                'code'      => 200,
                'message'   => 'El usuario creado correctamente',
                'data'      => $user
            );
        }

    }else{
        $data = array(
            'status'    => 'error',
            'code'      => 404,
            'message'   => 'El usuario no se a podido crear faltan datos'
        );
    }

        return response()->json($data, $data['code']);
       
    }

    public function login(Request $request){
            
        

            $jwtAuth = new \JwtAuth();
            $json = $request->input('json', null);
            $params = json_decode($json); //objeto
            $params_array = json_decode($json, true);//array

            $validate = \Validator::make($params_array, [
                'email'     => 'required|email',
                'password'  => 'required'
            ]);
    
            if($validate->fails()){
                $signup = array(
                    'status'    => 'error',
                    'code'      => 404,
                    'message'   => 'El usuario no se a podido loguear',
                    'errors'    => $validate->errors()
                );
                
            }else{
                //sifrar la contraseña
                $pwd = hash('sha256', $params->password);
                //Devolver el token
                $signup = $jwtAuth->signup($params->email, $pwd);
                if(!empty($params->gettoken)){
                    $signup = $jwtAuth->signup($params->email, $pwd, true);
                }
            }


            return response()->json(($signup), 200);
        
    }


}
