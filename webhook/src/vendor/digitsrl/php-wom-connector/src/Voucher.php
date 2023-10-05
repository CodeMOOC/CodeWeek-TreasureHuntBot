<?php


namespace WOM;


class Voucher implements \JsonSerializable
{

    public $aim;
    public $latitude;
    public $longitude;
    public $datetime;
    public $count;

    private function __construct(string $aim, float $latitude, float $longitude, \DateTime $datetime, int $count)
    {
        $this->aim = $aim;
        $this->latitude = $latitude;
        $this->longitude = $longitude;
        $this->datetime = $datetime;
        $this->count = $count;
    }

    public static function Create(string $aim, float $latitude, float $longitude, \DateTime $datetime, int $count = 1){
        return new Voucher($aim, $latitude, $longitude, $datetime, $count);
    }

    public function jsonSerialize()
    {
        return array(
            'Aim' => $this->aim,
            'Latitude' => $this->latitude,
            'Longitude' => $this->longitude,
            'Timestamp' => $this->datetime->format(DATE_ATOM),
            'Count' => $this->count
        );
    }
}