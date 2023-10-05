<?php


namespace WOM;


use Monolog\Handler\StreamHandler;
use WOM\config\Config;

class Logger
{

    public static $Instance = null;

    public static function Initialize(){
        if(Logger::$Instance == null){
            Logger::$Instance = new \Monolog\Logger("WOM Connector");
            Logger::$Instance->pushHandler(new StreamHandler('warning.log', \Monolog\Logger::WARNING));
            Logger::$Instance->pushHandler(new StreamHandler('error.log', \Monolog\Logger::ERROR));
            Logger::$Instance->pushHandler(new StreamHandler('php://stderr', \Monolog\Logger::ERROR));

            if(Config::ShowDebug()){
                Logger::$Instance->pushHandler(new StreamHandler('php://stdout', \Monolog\Logger::DEBUG));
            }

            if(Config::ShowWarning()){
                Logger::$Instance->pushHandler(new StreamHandler('php://stdout', \Monolog\Logger::WARNING));
            }
        }
    }

}