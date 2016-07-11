$(function() {
	$('#form').validate({
		errorPlacement: function(error, element) {
			$( element )
				.closest( "form" )
					.find( "div[class='message']" )
						.append( error );
		},
		errorElement: "span",
		rules: {
			email: {
				required: true,
				email: true
			},
			password: {
				required: true
			},
			password2:{
				required: true,
				equalTo: "#passId"
			}
		},
		messages: {
			email: {
				required: "! E-mail необходимо заполнить",
				email: "! E-mail введен некорректно"
			},
			password: {
				required: "! Пароль необходимо заполнить"
			},
			password2: {
				required: "! Подтвержение для пароля необходимо заполнить",
				equalTo: "! Пароли должны совпадать"
			}
		}
	});
	$('#cabinet').validate({
		errorPlacement: function(error, element) {
			$( element )
				.closest( "form" )
					.find( "div[class='message']" )
						.append( error );
		},
		errorElement: "span",
		rules: {
			email: {
				required: true,
				email: true
			},
			old_password: {
				required: true
			},
			password: {
				required: true
			},
			password2:{
				required: true,
				equalTo: "#passId"
			}
		},
		messages: {
			email: {
				required: "! E-mail необходимо заполнить",
				email: "! E-mail введен некорректно"
			},
			old_password: {
				required: "! Необходимо заполнить Старый пароль"
			},
			password: {
				required: "! Пароль необходимо заполнить"
			},
			password2: {
				required: "! Подтвержение для пароля необходимо заполнить",
				equalTo: "! Пароли должны совпадать"
			}
		}
	});
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
	$('#reg').validate({
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



