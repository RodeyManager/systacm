<?php

	function smarty_function_footer( $params )
	{
		if(isset($params['link']) && $params['link'] == 'yes'){
			return "Powered by <a href=\"http://www.systacm.com\" target=\"_blank\">SYSTacm</a>(盛艺设计)";
		}else{
			return "Powered by SYSTacm(盛艺设计)";
		}
	}

?>