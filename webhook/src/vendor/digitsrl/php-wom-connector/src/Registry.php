<?php


namespace WOM;

define("REGISTRY_PUBLICK_KEY_PATH", 'registry.pub');


use Composer\Json\JsonValidationException;
use JsonSchema\Exception\JsonDecodingException;
use WOM\config\Config;

class Registry
{
    private $client = null;
    public $publicKey;
    private $logger;


    private static $Instance = null;

    private function __construct(string $baseUrl)
    {
        $this->client = new RESTClient($baseUrl);
        $this->publicKey = $pubKey = CryptoHelper::LoadPublicKey($this->RefreshPublicKey());
    }

    public static function GetInstance(string $baseUrl){
        if(Registry::$Instance == null){
            Registry::$Instance = new Registry($baseUrl);
        }

        return Registry::$Instance;
    }

    public function VoucherCreate(string $source_id, string $nonce, string $payload)
    {
        $request_payload = json_encode(array('SourceId' => $source_id, 'Nonce' => $nonce, 'Payload' => $payload));
        if($request_payload == false){
            $this->LogJSONError();
        }
        return $this->client->VoucherCreate($request_payload);
    }

    public function VoucherVerify(string $payload)
    {
        $request_payload = json_encode(array('Payload' => $payload));

        if($request_payload == false){
            $this->LogJSONError();
        }

        $this->client->VoucherVerify($request_payload);
    }

    public function PaymentRegister(string $pos_id, string $nonce, string $payload)
    {
        $request_payload = json_encode(array('PosId' => $pos_id, 'Nonce' => $nonce, 'Payload' => $payload));
        if($request_payload == false){
            $this->LogJSONError();
        }

        return $this->client->PaymentRegister($request_payload);
    }

    public function PaymentVerify(string $payload)
    {
        $request_payload = json_encode(array('Payload' => $payload));
        if($request_payload == false){
            $this->LogJSONError();
        }

        $this->client->PaymentVerify($request_payload);
    }


    private function LogJSONError(){
        switch (json_last_error()) {
            case JSON_ERROR_NONE:
                \WOM\Logger::$Instance->debug('No errors');
                break;
            case JSON_ERROR_DEPTH:
                \WOM\Logger::$Instance->error('Maximum stack depth exceeded');
                throw new JsonValidationException('Maximum stack depth exceeded');
                break;
            case JSON_ERROR_STATE_MISMATCH:
                \WOM\Logger::$Instance->error('Underflow or the modes mismatch');
                throw new JsonValidationException('Underflow or the modes mismatch');
                break;
            case JSON_ERROR_CTRL_CHAR:
                \WOM\Logger::$Instance->error('Unexpected control character found');
                throw new JsonValidationException('Unexpected control character found');
                break;
            case JSON_ERROR_SYNTAX:
                \WOM\Logger::$Instance->error('Syntax error, malformed JSON');
                throw new JsonValidationException('Syntax error, malformed JSON');
                break;
            case JSON_ERROR_UTF8:
                \WOM\Logger::$Instance->error('Malformed UTF-8 characters, possibly incorrectly encoded');
                throw new JsonValidationException('Malformed UTF-8 characters, possibly incorrectly encoded');
                break;
            default:
                \WOM\Logger::$Instance->error('Unknown error');
                throw new JsonValidationException('Unknown error');
                break;
        }
    }

    private function RefreshPublicKey()
    {
        if(file_exists(REGISTRY_PUBLICK_KEY_PATH)){
            unlink(REGISTRY_PUBLICK_KEY_PATH);
        }

        $content = file_get_contents(Config::GetRegistryPubKeyUrl());
        if(!$content) {
            throw new \Exception("Can't refresh Registry public key.");
        }
        file_put_contents(REGISTRY_PUBLICK_KEY_PATH, $content);

        return REGISTRY_PUBLICK_KEY_PATH;
    }
}