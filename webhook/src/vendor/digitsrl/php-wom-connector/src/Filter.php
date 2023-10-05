<?php


namespace WOM;


class Filter implements \JsonSerializable
{

    public $aim;
    public $leftTop;
    public $rightBottom;
    public $maxAge;

    private function __construct(string $aim = null, array $leftTop = null, array $rightBottom = null, int $maxAge = 0)
    {
        $this->aim = $aim;
        $this->leftTop = $leftTop;
        $this->rightBottom = $rightBottom;
        $this->maxAge = $maxAge;
    }

    public static function Create(string $aim = null, array $leftTop = null, array $rightBottom = null, int $maxAge = 0){
        return new Filter($aim, $leftTop, $rightBottom, $maxAge);
    }

    public function jsonSerialize()
    {
        $obj = array("dum" => "my"); //HACK: needed to generate an associative array when all parameters are null

        if ($this->aim != null and !empty($this->aim))
            $obj['Aim'] = $this->aim;

        if ($this->maxAge > 0)
            $obj['MaxAge'] = $this->maxAge;

        if ($this->leftTop != null and is_array($this->leftTop) and count($this->leftTop) == 2
            and $this->rightBottom != null and is_array($this->rightBottom) and count($this->rightBottom) == 2)
            $obj['Bounds'] = array (
                'LeftTop' => $this->leftTop,
                'RightBottom' => $this->rightBottom);

        return $obj;
    }
}