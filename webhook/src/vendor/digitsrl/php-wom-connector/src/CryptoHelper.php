<?php


namespace WOM;

use phpseclib\Crypt\RSA;

class CryptoHelper
{

    public static function LoadPublicKey(string $keyPath){

        if(!file_exists($keyPath)){
            \WOM\Logger::$Instance->debug("{$keyPath} public key file does not exist");
            throw new \InvalidArgumentException("{$keyPath} public key file does not exist");
        }

        // load public key
        $rsa = new RSA();
        if(!$rsa->loadKey(file_get_contents($keyPath))){
            \WOM\Logger::$Instance->debug("{$keyPath} public key file is invalid");
            throw new \InvalidArgumentException("{$keyPath} public key file is invalid");
        }

        return $rsa;
    }

    public static function LoadPrivateKey(string $keyPath, string $passphrase='', $logger = null){

        if(!file_exists($keyPath)){
            \WOM\Logger::$Instance->debug("{$keyPath} private key file does not exist");
            throw new \InvalidArgumentException("{$keyPath} private key file does not exist");
        }

        // load private key
        $rsa = new RSA();
        if($passphrase != ''){
            $rsa->setPassword($passphrase);
        }
        if(!$rsa->loadKey(file_get_contents($keyPath))){
            \WOM\Logger::$Instance->debug("{$keyPath} private key file is invalid");
            throw new \InvalidArgumentException("{$keyPath} private key file is invalid");
        }

        return $rsa;
    }

    public static function Encrypt(string $payload, $key){

        $key->setEncryptionMode(RSA::ENCRYPTION_PKCS1);

        return $key->encrypt($payload);
    }

    public static function Decrypt(string $payload, $key){

        $key->setEncryptionMode(RSA::ENCRYPTION_PKCS1);

        return $key->decrypt(base64_decode($payload));
    }


}