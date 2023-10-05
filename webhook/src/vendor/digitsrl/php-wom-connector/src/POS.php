<?php

namespace WOM;

use WOM\config\Config;
use Ramsey\Uuid\Uuid;


class POS
{
    private $log;
    private $id;
    private $registry;
    private $privKey;

    public function __construct(string $id, string $privKeyPath, string $privKeyPassword='')
    {
        \WOM\Logger::Initialize();

        $this->id = $id;
        $this->privKey = CryptoHelper::LoadPrivateKey($privKeyPath, $privKeyPassword);

        $this->registry = Registry::GetInstance(Config::GetBaseUrl());
    }


    public function RequestPayment(int $amount, string $pocketAckUrl, Filter $filter, string $posAckUrl = "", bool $persistent = False, string $nonce=null, string &$password=null, string &$otc=null){

        if($amount < 1){
            \WOM\Logger::$Instance->debug("Amount not valid. It must be greater than 0.");
            throw new \InvalidArgumentException("Amount not valid. It must be greater than 0.");
        }

        if($filter == null or !is_a($filter, '\WOM\Filter')){
            \WOM\Logger::$Instance->debug("Filter not valid");
            throw new \InvalidArgumentException("Filter not valid");
        }

        if($pocketAckUrl == null or empty($pocketAckUrl)){
            \WOM\Logger::$Instance->debug("PocketAckUrl not valid");
            throw new \InvalidArgumentException("PocketAckUrl not valid");
        }


        // call to voucher/create API
        $response_data = $this->PaymentRegister($amount, $pocketAckUrl, $filter, $posAckUrl, $persistent, $nonce, $password);

        // call to voucher/verify API
        $this->PaymentVerify($response_data['otc']);

        \WOM\Logger::$Instance->debug("Payment generated!");

        $otc = $response_data['otc'];
        $password = $response_data['password'];
    }

    private function PaymentRegister(int $amount, string $pocketAckUrl, Filter $filter, string $posAckUrl = "", bool $persistent = False, string $nonce=null, string $password=null)
    {
        // Generate a valid nonce if there is no one
        $effectiveNonce = Uuid::uuid4()->toString();

        $payload = json_encode(array(
            'PosId' => $this->id,
            'Nonce' => $effectiveNonce,
            'Password' => $password,
            'Amount' => $amount,
            'SimpleFilter' => $filter,
            'PocketAckUrl' => $pocketAckUrl,
            'PosAckUrl' => $posAckUrl,
            'Persistent' => $persistent
        ));

        // encrypt inner payload
        $encryptedPayload = CryptoHelper::Encrypt($payload, $this->registry->publicKey);

        // make registry request
        $jsonResponse = $this->registry->PaymentRegister($this->id, $effectiveNonce, base64_encode($encryptedPayload));

        // decode registry response
        $response = CryptoHelper::Decrypt($jsonResponse['payload'], $this->privKey);

        return json_decode($response, true);

    }

    private function PaymentVerify(string $otc)
    {
        $encryptedOtc = CryptoHelper::Encrypt(json_encode(array('Otc' =>$otc)), $this->registry->publicKey);

        $this->registry->PaymentVerify(base64_encode($encryptedOtc));
    }

}