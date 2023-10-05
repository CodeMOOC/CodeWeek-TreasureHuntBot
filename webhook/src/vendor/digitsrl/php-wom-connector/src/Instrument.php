<?php

namespace WOM;

use WOM\config\Config;
use Ramsey\Uuid\Uuid;



class Instrument
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

    public function RequestVouchers(array $vouchers, string $nonce="", string &$password=null, string &$otc=null){

        if(!is_array($vouchers) or !count($vouchers) > 0 or !is_a($vouchers[0], '\WOM\Voucher')){
            \WOM\Logger::$Instance->debug("Voucher list not valid or empty");
            throw new \InvalidArgumentException("Voucher list not valid or empty");
        }

        // call to voucher/create API
        $response_data = $this->VoucherCreate($vouchers, $nonce, $password);

        // call to voucher/verify API
        $this->VoucherVerify($response_data['otc']);
        
        \WOM\Logger::$Instance->debug("Voucher generated!");

        $otc = $response_data['otc'];
        $password = $response_data['password'];
    }

    private function VoucherCreate(array $vouchers, string $nonce="", string $password=null)
    {
        // Generate a valid nonce if there is no one
        $effectiveNonce = Uuid::uuid4()->toString();

        $payload = json_encode(array(
                        'SourceId' => $this->id,
                        'Nonce' => $effectiveNonce,
                        'Password' => $password,
                        'Vouchers' => $vouchers
        ));

        // encrypt inner payload
        $encryptedPayload = CryptoHelper::Encrypt($payload, $this->registry->publicKey);

        // make registry request
        $jsonResponse = $this->registry->VoucherCreate($this->id, $effectiveNonce, base64_encode($encryptedPayload));

        // decode registry response
        $response = CryptoHelper::Decrypt($jsonResponse['payload'], $this->privKey);

        return json_decode($response, true);

    }

    private function VoucherVerify(string $otc)
    {
        $encryptedOtc = CryptoHelper::Encrypt(json_encode(array('Otc' =>$otc)), $this->registry->publicKey);

        $this->registry->VoucherVerify(base64_encode($encryptedOtc));
    }

}