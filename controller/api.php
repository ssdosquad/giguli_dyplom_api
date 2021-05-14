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
        $sessionkey = create_session(dbLastId());
        if( dbExecute("INSERT INTO account_session (account_id, session_key) VALUES ('{$query['id']}', '{$sessionkey}')") ){
            send_answer(["token" => $sessionkey], true);
        }
        send_answer(["Неизвестная ошибка записи новой сессии в базу"]);
    }
    send_answer(["Неизвестная ошибка записи пользователя в базу"]);
}

function logout(){
    if( dbExecute("UPDATE account_session SET active = 0 WHERE token = '{$_GET['token']}' LIMIT 1") ){
        send_answer([], true);
    }
    send_answer(["Неизвестная ошибка, Вы навеки тут"], true);
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
    global $currentOptions, $currentUser;

    $id = $currentOptions['id'];

    if( $query = dbQueryOne("SELECT * FROM car WHERE id = '{$id}' AND account_id = '{$currentUser['id']}'") ){
        $works = dbQuery("SELECT *, CASE WHEN type = 'to' THEN 'Тех. осмотр' ELSE 'Ремонт' END as type FROM work WHERE car_id = '{$id}'");
        send_answer(["car" => $query, "works" => $works], true);
    }
    send_answer(["Машины с таким ID не существует"]);
}

function getWorkInfo(){
    global $currentOptions, $currentUser;

    $id = $currentOptions['id'];

    if($work = dbQueryOne("SELECT work.*, CASE WHEN work.type = 'to' THEN 'Тех. осмотр' ELSE 'Ремонт' END as type FROM work, car WHERE work.id = '{$id}' AND car.id = work.car_id AND car.account_id = '{$currentUser['id']}'")){
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

function removeCar(){
    global $currentOptions, $currentUser;
    $car_id = $currentOptions['id'];

    if( dbExecute("DELETE FROM car WHERE account_id = '{$account_id}' AND id = '{$car_id}'") ){
        send_answer([], true);
    }

    send_answer(["Неизвестная ошибка удаления авто"]);
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

function getActions(){
    if( $query = dbQuery("SELECT * FROM actions") ){
        send_answer(["actions" => $query], true);
    }
    send_answer(["Акции отсутствуют"]);
}

function getArticles(){
    if( $query = dbQuery("SELECT id, title, cover, date FROM article") ){
        send_answer(["articles" => $query], true);
    }
    send_answer(["Акции отсутствуют"]);
}

function getArticle(){
    global $currentOptions;
    $article_id = $currentOptions['id'];

    if( $query = dbQueryOne("SELECT * FROM article WHERE id = '{$article_id}'") ){
        send_answer(["article" => $query], true);
    }
    send_answer(["Акции отсутствуют"]);
}

function requestWork(){
    global $currentOptions;

    $car_id = verify_field("ID машины", $currentOptions['id'], 1, 0);
    $type = (in_array($currentOptions['type'], ["to", "repair"])) ? $currentOptions['type'] : send_answer(["Неверный тип запроса"]);
    $text = verify_field("Текст", $currentOptions['text'], 0, 1200);

    if( dbExecute("INSERT INTO work_request (car_id, type, text) VALUES ('{$car_id}', '{$type}', '{$text}')") ){
        send_answer([], true);
    }
    send_answer(["Неизвестная ошибка записи нового запроса"]);
}

function getAccount(){
    global $currentUser;
    send_answer(["account" => $currentUser], true);
}