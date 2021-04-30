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
    global $currentOptions, $currentUser;

    $account_id = $currentUser['id'];
    $sql = "SELECT * FROM car WHERE account_id = $account_id";

    if( $query = dbQuery($sql) ){
        send_answer(["cars" => $query], true);
    }
    send_answer(["К Вашему аккаунту не привязан ни один автомобиль"]);
}

function getCarInfo(){
    global $currentOptions;

    $id = $currentOptions['id'];

    if( $query = dbQueryOne("SELECT * FROM car WHERE id = '{$id}'") ){
        $works = dbQuery("SELECT * FROM work WHERE car_id = '{$id}'");
        send_answer(["car" => $query, "works" => $works], true);
    }
    send_answer(["Машины с таким ID не существует"]);
}

function getWorkInfo(){
    global $currentOptions;

    $id = $currentOptions['id'];

    if($work = dbQueryOne("SELECT * FROM work WHERE id = '{$id}'")){
        $work_acts = dbQuery("SELECT * FROM work_act WHERE work_id = '{$work['id']}'");
        $masters = dbQuery("SELECT master.* FROM master, work_master WHERE work_master.work_id = '{$work['id']}' AND master.id = work_master.master_id");
        send_answer(["work" => $work, "acts" => $work_acts, "masters" => $masters], true);
    }

    send_answer(["Работы с таким ID не существует"]);
}

function addCar(){
    global $currentOptions, $currentUser;

    $account_id = $currentUser['id'];
    $manufacturer = "Lada";
    $model = "Granta";
    $win = verify_field("WIN", $currentOptions['win'], 4, 120);
    $engine = "879847532788948";

    if( dbExecute("INSERT INTO car (account_id, manufacturer, model, win, engine) VALUES ('{$account_id}', '{$manufacturer}', '{$model}', '{$win}', '{$engine}')") ){
        send_answer([], true);
    }
    send_answer(["Неизвестная ошибка записи нового авто в базу"]);
}

function accountEdit(){
    global $currentOptions, $currentUser;

    $name = verify_field("Имя", $currentOptions['name'], 2, 60);
    $surname = verify_field("Фамилия", $currentOptions['surname'], 2, 60);
    $patronymic = verify_field("Отчество", $currentOptions['patronymic'], 2, 60);
    $date_born = verify_field("Дата рождения", $currentOptions['date_born'], 1, 120);
    $passport_series = verify_field("Серия паспорта", $currentOptions['passport_series'], 1, 120);
    $passport_id = verify_field("Номер паспорта", $currentOptions['passport_id'], 1, 120);
    $passport_issued = verify_field("Кем выдан", $currentOptions['passport_issued'], 2, 120);
    $passport_date = verify_field("Дата выдачи паспорта", $currentOptions['passport_date'], 1, 120);

    if( dbExecute("UPDATE account SET name = '{$name}', surname = '{$surname}', patronymic = '{$patronymic}', date_born = '{$date_born}', passport_series = '{$passport_series}', passport_id = '{$passport_id}', passport_issued = '{$passport_issued}', passport_date = '{$passport_date}'  WHERE id = '{$currentUser['id']}'") ){
        send_answer([], true);
    }
    send_answer(["Неизвестная ошибка обновления данных об аккаунте в базе"]);
}