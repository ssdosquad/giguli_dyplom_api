<?php

function auth(){
    global $currentOptions;

    $login = verify_field("Логин", $currentOptions['login'], 4, 60, ";,*&%#!@");
    $password = verify_field("Пароль", $currentOptions['password'], 4, 0);

    if( $query = dbQueryOne("SELECT id, password FROM account WHERE login = '{$login}'") ){
        if(password_verify($password, $query['password'])){
            $sessionkey = create_session($query['id']);
            if( dbExecute("INSERT INTO account_session (account_id, session_key) VALUES ('{$query['id']}', '{$sessionkey}')") ){
                send_answer(["token" => $sessionkey], true);
            }
            send_answer(["Неизвестная ошибка записи новой сессии в базу"]);
        }
        send_answer(["Неверный пароль"]);
    }
    send_answer(["Пользователь с таким логином не найден"]);
}

function reg(){
    global $currentOptions;

    $email = verify_field("Почта", $currentOptions['email'], 4, 120, ";,*&%#!");
    $password = password_hash(verify_field("Пароль", $currentOptions['password'], 4, 0), PASSWORD_DEFAULT);

    if( $query = dbQueryOne("SELECT id, password FROM account WHERE email = '{$email}'") ){
        send_answer(["Пользователь с такой почтой уже существует"]);
    }

    $login = generateRandomString(15);

    if( dbExecute("INSERT INTO account (login, email, password) VALUES ('{$login}', '{$email}', '{$password}')") ){
        send_answer([], true);
    }
    send_answer(["Неизвестная ошибка записи пользователя в базу"]);
}

function getCarList(){

}

function getCarInfo(){
    global $currentOptions;

    $id = $currentOptions['id'];

    if( $query = dbQueryOne("SELECT * FROM car WHERE id = '{$id}'") ){
        send_answer(["car" => $query], true);
    }
    send_answer(["Машины с таким ID не существует"]);
}

function getWorkInfo(){

}

function addCar(){
    global $currentOptions;

    $manufacturer = "Lada";
    $model = "Granta";
    $win = verify_field("WIN", $currentOptions['win'], 4, 120);
    $engine = "879847532788948";

    if( dbExecute("INSERT INTO car (manufacturer, model, win, engine) VALUES ('{$manufacturer}', '{$model}', '{$win}', '{$engine}')") ){
        send_answer([], true);
    }
    send_answer(["Неизвестная ошибка записи нового авто в базу"]);
}