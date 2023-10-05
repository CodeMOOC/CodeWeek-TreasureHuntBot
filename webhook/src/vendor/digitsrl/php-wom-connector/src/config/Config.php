<?php


namespace WOM\config;

class Config
{
    // PROD
    const PROD_BASE_URL = "http://wom.social/api/v1/";
    const PROD_VOUCHER_BASE_URL = "https://wom.social/vouchers/";
    const PROD_REGISTRY_PUB_KEY_URL = "https://wom.social/api/v1/auth/key";
    const PROD_DEBUG = False;
    const PROD_WARNING = False;

    // DEV
    const DEV_BASE_URL = "http://dev.wom.social/api/v1/";
    const DEV_VOUCHER_BASE_URL = "https://dev.wom.social/vouchers/";
    const DEV_REGISTRY_PUB_KEY_URL = "https://dev.wom.social/api/v1/auth/key";
    const DEV_DEBUG = True;
    const DEV_WARNING = True;


    public static function GetBaseUrl(){
        return defined("DEV")? self::DEV_BASE_URL: self::PROD_BASE_URL;
    }

    public static function GetVoucherBaseUrl(){
        return defined("DEV")? self::DEV_VOUCHER_BASE_URL: self::PROD_VOUCHER_BASE_URL;
    }

    public static function GetRegistryPubKeyUrl(){
        return defined("DEV")? self::DEV_REGISTRY_PUB_KEY_URL: self::PROD_REGISTRY_PUB_KEY_URL;
    }

    public static function ShowDebug(){
        return defined("DEV")? self::DEV_DEBUG: self::PROD_DEBUG;
    }

    public static function ShowWarning(){
        return defined("DEV")? self::DEV_WARNING: self::PROD_WARNING;
    }

}
