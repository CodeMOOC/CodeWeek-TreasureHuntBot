<?php

require __DIR__ . '/vendor/autoload.php';

DEFINE("INSTRUMENT_PRIVATE_KEY", "keys/instrument1.pem");
DEFINE("INSTRUMENT_PRIVATE_KEY_PASSWORD", "");
DEFINE("INSTRUMENT_ID", "5e737fba9036edb02d61ef6d");

DEFINE("DEV", True); // This enables DEV configuration. Delete it for production configuration.

date_default_timezone_set("UTC");

//
function random_float($min, $max) {
    return random_int($min, $max - 1) + (random_int(0, PHP_INT_MAX - 1) / PHP_INT_MAX );
}

// VOUCHER GENERATION
// Generate 10 random Vouchers
$vouchers = array();
for($i=0; $i < 10; $i++){
    $vouchers[] = \WOM\Voucher::Create('H', random_float(40,52), random_float(10,15), new DateTime('NOW'));
}

// or, if they have identical aim, coordinates, and timestamp, you can generate them using the $count optional parameter
$vouchers[] = \WOM\Voucher::Create('H', random_float(40,52), random_float(10,15), new DateTime('NOW'), 10);


// INSTRUMENT CREATION
// Instantiate the Instrument with its ID, Private Key, and (optionally) the private key's password

$Instrument = new \WOM\Instrument(INSTRUMENT_ID, INSTRUMENT_PRIVATE_KEY, INSTRUMENT_PRIVATE_KEY_PASSWORD);

// Request Vouchers
$otc = null;
$pin = null;

try{
    $Instrument->RequestVouchers($vouchers,  "", $pin, $otc);
    echo "Otc: {$otc} Password:{$pin}";

    $QRCode = \WOM\WOMQRCodeGenerator::GetQRCode($otc, 300, "vouchers.png");
    echo $QRCode;

}catch(Exception $exception) {

    echo "No voucher generated :(";
}

