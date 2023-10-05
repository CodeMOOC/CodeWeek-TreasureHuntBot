<?php


namespace WOM;

use WOM\config\Config;
use Endroid\QrCode\QrCode;

class WOMQRCodeGenerator
{
    public static function GetQRCode(string $url, int $size = 300, string $outputFilePath = "")
    {

        $qrCode = new QrCode(Config::GetVoucherBaseUrl().$url);
        $qrCode->setSize($size);
        if ($outputFilePath != "") {
            $qrCode->writeFile($outputFilePath);
        }

        return $qrCode->writeString();

    }
}