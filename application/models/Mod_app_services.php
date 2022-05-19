<?php
class Mod_app_services extends CI_Model
{
    function __construct()
    {
        parent::__construct();
	}

	// get_product...
	public function get_product($product_id = '') {
		

		if (empty($product_id)) :
			return false;
		else :

			$where_arr = array();
			$where_arr['$and'][] = array('id' => $product_id);

			$document = $this->mongo_db->customQuery();
        	$return = (array) $document->products->findOne($where_arr, array('projection' => array('_id' => 0,'name' => 1,'price' => 1,'size' => 1,'color' => 1,'images_arr' => 1,'review_arr' => 1,'rating_arr' => 1), 'sort' => array('id'=> -1)));

			if ($return) :

				if($return['rating_arr']){
					$rating_arr = (array) $return['rating_arr'];
					$return['t_rating'] = count($rating_arr);
					unset($return['rating_arr']);
				}

				if($return['review_arr']){
					$review_arr = (array) $return['review_arr'];
					$return['t_review'] = count($review_arr);
					unset($return['review_arr']);
				}				

				return $return;
			else :
				return false;
			endif;
		endif;
	}
	// END Validate Login Credentials...
}
?>
