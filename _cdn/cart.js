function mc_fastAJAX (url, data, handler) {
    if(url === undefined){ url = ''; }
    if(data === undefined){ data = {}; }
    if(handler === undefined){ handler = function(response){console.log(response)} }

    $.ajax({
        method: "POST",
        url: url,
        data: data,
        success: handler
    })
}

function dropCart(id){
	mc_fastAJAX ('/_cdn/cart.php', {
		method: 'drop'
	}, function(response){
		console.log(JSON.parse(response));
	});
}

function addToCart(id){
	mc_fastAJAX ('/_cdn/cart.php', {
		method: 'add',
		id: id
	}, function(response){
		console.log(JSON.parse(response));
	});
}

function minus(id){
	mc_fastAJAX ('/_cdn/cart.php', {
		method: 'minus',
		id: id
	}, function(response){
		console.log(response);
	});
}

function deleteFromCart(id){
	mc_fastAJAX ('/_cdn/cart.php', {
		method: 'delete',
		id: id
	}, function(response){
		console.log(JSON.parse(response));
	});
}

function cartContents(){
	mc_fastAJAX ('/_cdn/cart.php', {
		method: 'contents'
	}, function(response){
		document.getElementById('lol').innerHTML=response;
	});
	
}

function cartCheck(){
	mc_fastAJAX ('/_cdn/cart.php', {
		method: 'check'
	}, function(response){
		document.getElementsByClassName('basket-link')[0].innerHTML=response;
	});
}

function cartJSON(){
	mc_fastAJAX ('/_cdn/cart.php', {
		method: 'json'
	}, function(response){
		document.getElementsByClassName('cart-json')[0].value=response;
	});
}

cartCheck();