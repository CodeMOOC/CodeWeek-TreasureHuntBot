<?php
require(dirname(__FILE__) . '/vendor/autoload.php');

use Endroid\QrCode\QrCode;
use Endroid\QrCode\Writer\PngWriter;

$url = $argv[1];
$output_file = $argv[2];

$qrCode = QrCode::create($url)
    ->setMargin(15)
    ->setSize(1000)
;

// Save it to a file
$writer = new PngWriter();
$output = $writer->write($qrCode);

$output->saveToFile($output_file);
