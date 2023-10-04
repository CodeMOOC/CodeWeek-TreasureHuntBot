<?php
require_once(dirname(__FILE__) . '/vendor/autoload.php');

$root_path = realpath(dirname(__FILE__) . '/../');

use Dompdf\Dompdf;
use Dompdf\Options;

$input_file = dirname(__FILE__) . '/' . $argv[1];
$output_file = $argv[2];
$data_image = $argv[3];      //qr-code image path
$data_lat = $argv[4];        //latitude
$data_long = $argv[5];       //longitude
$data_name = $argv[6];       //name
$data_id = $argv[7];         //loc-id
$data_qr_content = $argv[8]; //qr-content

echo 'Rendering ' . $input_file . ' into ' . $output_file . PHP_EOL;

$content = file_get_contents($input_file);
$content = str_replace("%image%", $data_image, $content);
$content = str_replace("%loc-latitude%", $data_lat, $content);
$content = str_replace("%loc-longitude%", $data_long, $content);
$content = str_replace("%loc-name%", $data_name, $content);
$content = str_replace("%loc-id%", $data_id, $content);
$content = str_replace("%qr-content%", $data_qr_content, $content);

echo 'Loaded ' . mb_strlen($content) . ' characters of HTML' . PHP_EOL;

$dompdf = new Dompdf();

$options = new Options();
$options->setDefaultFont('sans-serif');
$options->setChroot([$root_path]);
$options->set('isRemoteEnabled', TRUE);
$dompdf->setOptions($options);

$dompdf->setProtocol('file://');
$dompdf->setPaper('A4', 'landscape');

$dompdf->loadHtml($content, 'UTF-8');

$dompdf->render();

$pdf_gen = $dompdf->output();

if(!file_put_contents($output_file, $pdf_gen)){
    echo 'Not OK!' . PHP_EOL;
    exit(1);
}
else{
    echo 'OK' . PHP_EOL;
}

exit(0);
