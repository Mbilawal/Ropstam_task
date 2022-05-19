<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
/** @noinspection PhpIncludeInspection */
require APPPATH . 'libraries/REST_Controller.php';

/**
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array
 *
 * @package         CodeIgniter
 * @subpackage      Rest Server
 * @category        Controller
 * @author          Phil Sturgeon, Chris Kacerguis
 * @license         MIT
 * @link            https://github.com/chriskacerguis/codeigniter-restserver
 */
class App_services extends REST_Controller {

    function __construct(){

        //Construct the parent class
        parent::__construct();

        // error_reporting(E_ALL);
        // ini_set("display_errors", E_ALL);

       	//Load Models
        $this->load->model("mod_app_services");

    }

	
	//fetch_products_post
	public function fetch_products_post(){

		$product_id 		= $this->post('product_id');

		$product_arr = $this->mod_app_services->get_product($product_id);

		if($product_arr){
		
			$message = array(
				'is_Success' =>	TRUE,
				'data' => $product_arr,
				'message' => 'Product Fetched successfully.'
			);
		
			$this->set_response($message, REST_Controller::HTTP_CREATED);
		
		}else{
		
			$message = array(
				'is_Success' =>	FALSE,
				'message' => 'No Product Record Found'
			);

			$this->set_response($message, REST_Controller::HTTP_NOT_FOUND);
			
		}


	
	}//end fetch_products_post



}
