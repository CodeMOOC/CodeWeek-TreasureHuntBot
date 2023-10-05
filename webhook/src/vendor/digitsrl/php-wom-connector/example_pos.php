<?php

require __DIR__ . '/vendor/autoload.php';

DEFINE("POS_PRIVATE_KEY", "keys/pos1.pem");
DEFINE("POS_PRIVATE_KEY_PASSWORD", "");
DEFINE("POS_ID", "5e5e473700d98a60b7db92d8");

DEFINE("DEV", True);

date_default_timezone_set("UTC");


$POS = new \WOM\POS(POS_ID,POS_PRIVATE_KEY, POS_PRIVATE_KEY_PASSWORD);

//$filter = \WOM\Filter::Create('H', array(46.0, -17.0), array(12.0, 160.0), 14);
$filter = \WOM\Filter::Create();


// Request Vouchers
$otc = null;
$password = null;


try{
    $POS->RequestPayment(100,
        'http://google.it',
        $filter,
        'http://libero.it',
        False,
        null,
        $password,
        $otc);

    echo "Otc: {$otc} Password:{$password}";

    $QRCode = \WOM\WOMQRCodeGenerator::GetQRCode($otc, 300, "payment_request.png");
    echo $QRCode;

}catch(Exception $exception) {

    echo "No payment generated :(";
}

