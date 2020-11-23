<?php
require_once(dirname(__FILE__) . '/vendor/autoload.php');

// reference the Dompdf namespace
use Dompdf\Dompdf;

$output_file = $argv[2]; //output PDF path
$data_participants = $argv[3];
$data_team_name = $argv[4];
$data_avatar_filename = $argv[5];
$data_game_name = $argv[6];
$data_identifier = $argv[7];
$data_elapsed_mins = ($argv[8]) ? $argv[8] : 0;

$dompdf = new Dompdf();

$input_file = dirname(__FILE__) . '/' . $argv[1];
$content = file_get_contents($input_file);
$content = str_replace("%root%", realpath(dirname(__FILE__) . '/../'), $content);
$content = str_replace("%NUMBER%", $data_participants, $content);
$content = str_replace("%TEAM_NAME%", $data_team_name, $content);
$content = str_replace("%AVATAR_NAME%", $data_avatar_filename, $content);
$content = str_replace("%GAME_NAME%", $data_game_name, $content);
$content = str_replace("%BASE_GEN_FILE%", $data_identifier, $content);
$content = str_replace("%DATE%", date('d/m/Y'), $content);
$content = str_replace("%ELAPSED_MINS%", $data_elapsed_mins, $content);

$dompdf->loadHtml($content, 'UTF-8');

// (Optional) Setup the paper size and orientation
$dompdf->setPaper('A4', 'landscape');

// Render the HTML as PDF
$dompdf->render();

$pdf_gen = $dompdf->output();

if(!file_put_contents($output_file, $pdf_gen)) {
    echo 'Not OK!';
    exit(1);
}
else {
    echo 'OK';
}

exit(0);
