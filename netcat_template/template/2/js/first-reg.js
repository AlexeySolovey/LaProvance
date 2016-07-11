$(function() {
	$('#mail').validate({
		rules: {
			mail: {
				required: true,
				email: true
			}
		},
		messages: {
			mail: {
				required: "! E-mail необходимо заполнить",
				email: "! E-mail введен некорректно"
			}
		}
	});
	$('#enter').validate({
		rules: {
			email: {
				required: true,
				email: true
			},
			password: {
				required: true
			}
		},
		messages: {
			email: {
				required: "! E-mail необходимо заполнить",
				email: "! E-mail введен некорректно"
			},
			password: {
				required: "! Пароль необходимо заполнить"
			}
		}
	});
	$('#coll-me').validate({
		rules: {
			name: {
				required: true
			},
			phone: {
				required: true,
				minlength: 8,
				maxlength: 13
			}
		},
		messages: {
			name: {
				required: "! Имя необходимо заполнить",
			},
			phone: {
				required: "! Телефон необходимо заполнить",
				minlength:"! Необходимо минимум {0} символов",
				maxlength:"! Неоходимо не больше {0} символов"
			}
		}
	});
});
