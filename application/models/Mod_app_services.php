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
        	$return = (array) $document->products->findOne($where_arr, array('projection' => array('_id' => 0,'name' => 1,'price' => 1,'size' => 1,'color' => 1,'images_arr' => 1), 'sort' => array('id'=> -1)));

			if ($return) :
				return $return;
			else :
				return false;
			endif;
		endif;
	}
	// END Validate Login Credentials...
}
?>
