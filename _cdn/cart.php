<?
	

	
	session_start();
	
	if(empty($_SESSION['cart'])){
		$_SESSION['cart']=array();
	}
	
	// Подключение функций и переменных NetCat
	require_once $_SERVER['DOCUMENT_ROOT'].'/netcat/connect_io.php';	
	
	// Fast Getter
	foreach($_POST as $key => $value){
		$$key = $value;
	}

	if($method=='add'){
		if($_SESSION['cart'][$id]){
			$_SESSION['cart'][$id]++;
		} else {
			$_SESSION['cart'][$id] = 1;
		}
		echo json_encode($_SESSION['cart']);
		return;
	}
	
	if($method=='minus'){
		$_SESSION['cart'][$id]--;
		if($_SESSION['cart'][$id]==0){
			unset($_SESSION['cart'][$id]);			
		}
		echo json_encode($_SESSION['cart']);
		return;
	}
	
	if($method=='delete'){
		unset($_SESSION['cart'][$id]);
		echo json_encode($_SESSION['cart']);
		return;
	}
	
	if($method=='drop'){
		$_SESSION['cart'] = array();
		echo json_encode($_SESSION['cart']);
		return;
	}
	
	if($method=='json'){
		if(!empty($_SESSION['cart'])){
			echo json_encode($_SESSION['cart']);
		}
		return;
	}
	
	if($method=='check'){
		$price = 0;
		$count = count($_SESSION['cart']);
		echo "<span class='basket'>Корзина</span>";
		if(!$count){
			echo " пуста.";
			return;
		}
		
		$realcount=0;
		
		foreach($_SESSION['cart'] as $id => $val){
			$realcount += $val;
			$price += $val * intval($db->get_var("SELECT Price FROM Message8 WHERE Message_ID = '".$id."'"));
		}
		
		echo "<span class='count'>x".$realcount."</span><span class='sum'>".number_format($price,2,",","&nbsp;")." грн</span><button type='button' class='bag'></button>";
		
		return;
	}
	
	if($method=='contents'){
		$count = count($_SESSION['cart']);
		
		$total = 0;
		
		
		echo "<h5>Ваша корзина содержит: ".$count." ".plural_form($count,"товар","товара","товаров")."</h5>";
		
		echo "<table><tbody><tr><th width=''>Товар</th><th width=''>Описание</th><th width='48'>Код</th><th width='120'>Цена за шт.</th><th width='75'>Кол-во</th><th width='150'>Итого</th><th width='60'></th></tr>";
		
		foreach($_SESSION['cart'] as $key => $value){ 
			
			$row = $db->get_row("SELECT * FROM Message8 WHERE Message_ID = '".$key."'");

			echo "<tr>";
			echo "  <td><img src='/netcat_files/".explode(":", $row->Image)[3]."'></td>
                    <td class='discribe'>".$row->Name."</td>
                    <td>".$row->Code."</td>
                    <td>".number_format($row->Price,2,",","&nbsp;")." грн.</td>
                    <td>
                        <a href='javascript:void(0); minus(".$key."); document.location.reload();' class='left'></a>
                        <span>".$value."</span>
                        <a href='javascript:void(0); addToCart(".$key."); document.location.reload();' class='right'></a>
                    </td>
                    <td>".number_format($row->Price * $value,2,",","&nbsp;")." грн.</td>
                    <td><a href='javascript:void(0);' onclick='deleteFromCart(".$key."); document.location.reload();'>Х</a></td>";
			echo "</tr>";
			
			$total += $row->Price * $value;
			
		}
		
		echo "<tr><td colspan='4'></td><td>Итого:</td><td class='together'>".number_format($total,2,",","&nbsp;")." грн.</td></tr></tbody></table>";
		
		return;
	}
		
	
?>