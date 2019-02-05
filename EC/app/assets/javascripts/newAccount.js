$(function(){
	$('form').submit(function(){
		$('#span').text("");
		var chkSubmit = true;
		var message = [];

		function mesg( text, element ) {
			$(element).css({'border-bottom':'solid 2px #FF4500'});
			
			$('#span').attr('class', 'span');
			message.push(text + "<br>");
			chkSubmit = false;
		}

		if($('#user_name').val() == ""){
			mesg("* [名前]を入力してください。", '#user_name');
		}
		if($('#user_kana_name').val() == ""){
			mesg("* [フリガナ]を入力してください。", '#user_kana_name');
		}
		if($('.tel').val() == ""){
			mesg("* [電話番号]を入力してください。", '.tel');
			$('#tel_note').css({'color':'#FF4500'});
		}
		if($('#zip').val() == ""){
			mesg("* [郵便番号]を入力してください。", '#zip');
			$('#zip_note').css({'color':'#FF4500'});
		}
		if($('#pref').val() == ""){
			mesg("* [都道府県]を入力してください。", '#pref');
		}
		if($('#addr01').val() == ""){
			mesg("* [市区町村・番地]を入力してください。", '#addr01');
		}
		if($('#addr02').val() == ""){
			mesg("* [建物名・部屋番号]を入力してください。", '#addr02');
		}
		if($('.email').val() == ""){
			mesg("* [メールアドレス]を入力してください。", '.email');
			$('#email_note').css({'color':'#FF4500'});
		}
		if($('#pass01').val() == ""){
			mesg("* [パスワード]を入力してください。", '#pass01');
			$('#pass_note').css({'color':'#FF4500'});
		}
		if($('.pass02').val() == ""){
			mesg("* [パスワード確認]を入力してください。", '.pass02');
		}

		// topまでスクロール
		if (chkSubmit == false){
			$('body,html').animate({scrollTop: 0}, 500);
		}

		for (var i = 0; i < message.length; i++) {
			$('#span').html(message);
		}
		return chkSubmit;
	});
});

function checkForm1($this) {
	var str = $this.value;
	while (str.match(/[^A-Z^a-z\d\-@_.]/)) {
		str = str.replace(/[^A-Z^a-z\d\-@_.]/, "");
	}
	$this.value = str;
}

function checkForm2($this) {
	var str = $this.value;
	while (str.match(/[^\d]/)) {
		str = str.replace(/[^\d]/, "");
	}
	$this.value = str;
}
function checkForm3($this) {
	var str = $this.value;
	while (str.match(/[^A-Z^a-z\d]/)) {
		str = str.replace(/[^A-Z^a-z\d]/, "");
	}
	$this.value = str;
}