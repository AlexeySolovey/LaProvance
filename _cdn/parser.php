<?
	
	// Подключение функций и переменных NetCat
	require_once $_SERVER['DOCUMENT_ROOT'].'/netcat/connect_io.php';
	require_once 'mc_connect.php';
	
	// Отменяем прерывания
	ignore_user_abort(true); 
	set_time_limit(0);  
	
	// Строим DOM
	$doc = new DOMDocument();

	$fp = file('goods.txt');
	
	foreach($fp as $key => $link){

			// Строим DOM
	 		$doc->loadHTMLFile($link);
			$xpath = new DOMXPath($doc);
			
			// name
			$nodes = $xpath->query(".//*[@id='pb-left-column']/h1"); foreach($nodes as $node){ $name = $node->nodeValue; }
			// price
			$nodes = $xpath->query(".//*[@id='our_price_display']"); foreach($nodes as $node){ $price = $node->nodeValue; }
			// code
			$nodes = $xpath->query(".//*[@id='product_reference']/span"); foreach($nodes as $node){ $code = utf8_decode($node->nodeValue); }
			// vendor
			$nodes = $xpath->query(".//*[@class='manufacturer']"); foreach($nodes as $node){ $vendor = utf8_decode($node->nodeValue); $vendor = str_replace("Производитель: ", "", $vendor); }
			// link
			$link = $link;
			// img
			$nodes = $xpath->query(".//*[@id='view_full_size']/img/@src"); foreach($nodes as $node){ $img = utf8_decode($node->nodeValue); }
			$imgBig = str_replace("large","thickbox", $img);
			// description
			$nodes = $xpath->query(".//*[@id='description_content']"); foreach($nodes as $node){$description = utf8_decode($node->nodeValue); }
			
			if($img){
			    $row = new mc_Message(8);
			    $row->Name = $name;
			    $row->Code = $code;
			    $row->Price = $price;
			    $row->Link_OLD = $link;
			    $row->Subdivision_ID = 20;
			    $row->Sub_Class_ID = 6;
			    $row->Vendor = $vendor;
			    $row->Description = $description;

				foreach( array('Image' => $img, "ImageBig" => $imgBig) as $key=>$value){
					// copy
					$ch = curl_init($value);
					$fp = fopen('image.jpg', 'wb');
					curl_setopt($ch, CURLOPT_FILE, $fp);
					curl_setopt($ch, CURLOPT_HEADER, 0);
					curl_exec($ch);
					curl_close($ch);
					fclose($fp);
					// set
					$row->set_image('image.jpg', $key);
				}
				
		        $row->save();
			}
	
	}	
?>