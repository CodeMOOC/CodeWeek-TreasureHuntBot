<?php

namespace WOM;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\HandlerStack;
use GuzzleHttp\MessageFormatter;
use GuzzleHttp\Middleware;
use Monolog\Logger;

class RESTClient
{
    private $client;

    public function __construct($base_url)
    {
        $stack = HandlerStack::create();
        $stack->push(
            Middleware::log(
                \WOM\Logger::$Instance,
                new MessageFormatter('{req_body} - {res_body}')
            )
        );

        $this->client = new Client([
            'base_uri' => $base_url,
            'headers' => [ 'Content-Type' => 'application/json' ]
        ]);
    }


    public function VoucherCreate($payload){
        $path = "voucher/create";

        return $this->PostRequest($payload, $path);
    }

    public function VoucherVerify($payload){
        $path = "voucher/verify";

        $this->PostCommand($payload, $path);
    }

    public function PaymentRegister($payload){
        $path = "payment/register";

        return $this->PostRequest($payload, $path);
    }

    public function PaymentVerify($payload){
        $path = "payment/verify";

        $this->PostCommand($payload, $path);
    }


    private function PostRequest($payload, $url){
        try {

            $request =  $this->client->request('POST', $url, [
                'json' => \GuzzleHttp\json_decode($payload)
            ]);
            return json_decode($request->getBody(), true);

        } catch (ClientException $e) {
            \WOM\Logger::$Instance->debug("REQUEST URI: {$e->getRequest()->getUri()}");
            \WOM\Logger::$Instance->debug("REQUEST BODY: {$e->getRequest()->getBody()}");

            $response = $e->getResponse();
            $responseBodyAsString = $response->getBody()->getContents();
            \WOM\Logger::$Instance->debug("RESPONSE BODY: {$responseBodyAsString}");
            exit(1);

        } catch (GuzzleException $e) {
            $response = $e->getResponse();
            $responseBodyAsString = $response->getBody()->getContents();
            \WOM\Logger::$Instance->debug("RESPONSE BODY: {$responseBodyAsString}");
            exit(1);
        }
    }

    private function PostCommand($payload, $url){
        try {

            $request = $this->client->request('POST', $url, [
                'json' => \GuzzleHttp\json_decode($payload)
            ]);

            echo json_decode($request->getBody(), true);

        } catch (ClientException $e) {
            \WOM\Logger::$Instance->debug("REQUEST URI: {$e->getRequest()->getUri()}");
            \WOM\Logger::$Instance->debug("REQUEST BODY: {$e->getRequest()->getBody()}");

            $response = $e->getResponse();
            $responseBodyAsString = $response->getBody()->getContents();
            \WOM\Logger::$Instance->debug("RESPONSE BODY: {$responseBodyAsString}");
            exit(1);

        } catch (GuzzleException $e) {
            $response = $e->getResponse();
            $responseBodyAsString = $response->getBody()->getContents();
            \WOM\Logger::$Instance->debug("RESPONSE BODY: {$responseBodyAsString}");
            exit(1);
        }
    }

}