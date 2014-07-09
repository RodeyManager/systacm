<?php

	function smarty_function_powerby( $params )
	{
		if(isset($params['link'])){
			if($params['link'] == 'yes'){
				return "Powered by <a href=\"http://www.systacm.com\" target=\"_blank\">SYSTacm</a>(盛艺设计)";
			}elseif($params['link'] == 'copyright'){
				return "Copyright © 2012 - 2022 Tencent. All Rights Reserved. <br />盛艺设计工作室 版权所有  Powered by <a href=\"http://www.systacm.com\" target=\"_blank\">SYSTacm</a>(盛艺设计)";
			}elseif($params['link'] == 'icp'){
				return "<a href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">". get_cfgs('site_icp') ."</a>";
			}elseif($params['link'] == 'cnzz'){
				return $cnzz = get_cfgs('cnzz');
			}else{
				return "Powered by SYSTacm(盛艺设计)";
			}
		}else{
			return "Powered by SYSTacm(盛艺设计)";
		}
	}

?>