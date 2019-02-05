$(function () {
	Calc();
});

function　Calc() {
	var total = 0;
	// tableの数繰り返す
	$('table').each(function (i) {
		var number = $('#cart_number' + i).val();
		var price = $('#cart_price' + i).val();
		var subtotal = number * price;
		$('#cart_subtotal' + i).val('¥' + subtotal + '-');
		total += subtotal
	});
	$('#total').val('¥' + total + '-');
}