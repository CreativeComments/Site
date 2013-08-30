/**
 * Frontend related objects
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */
var jsSite = {
	debug: false,
	current: {
		module: null,
		action: null,
		language: null
	},
	init: function() {
		// while there is no real detection for chrome, we implement our own,
		// see http://stackoverflow.com/questions/3303858/distinguish-chrome-from-safari-using-jquery-browser
		$.browser.chrome = /chrome/.test(navigator.userAgent.toLowerCase());
		if($.browser.chrome)
		{
			var userAgent = navigator.userAgent.toLowerCase();
			userAgent = userAgent.substring(userAgent.indexOf('chrome/') +7);
			userAgent = userAgent.substring(0,userAgent.indexOf('.'));
			$.browser.version = userAgent;
			$.browser.safari = false;
		}

		// get url and split into chunks
		var chunks = document.location.pathname.split('/');
		if(typeof chunks[1] == 'undefined') chunks[1] = 'en';
		if(typeof chunks[2] == 'undefined') chunks[2] = 'pages';
		if(typeof chunks[3] == 'undefined') chunks[3] = 'index';

		// set some properties
		jsSite.current.module = chunks[2];
		jsSite.current.action = chunks[3];
		jsSite.current.language = chunks[1];

		// init the ajax-configuration
		jsSite.initAjax();

		jsSite.bugs.init();
		jsSite.forms.init();
		jsSite.layout.init();
		jsSite.links.init();
		jsSite.search.init();
		jsSite.creativeComments.init();

		try {
			// build method
			var method = 'jsSite.'+ jsSite.current.module +'.init()';

			// try to call the method
			eval(method);
		} catch(e) {
			if(jsSite.debug) console.log(e);
		}
	},
	// set defaults for AJAX
	initAjax: function() {
		$.ajaxSetup({ cache: false, type: 'POST', dataType: 'json', timeout: 5000 });

		// global error handler
		$(document).ajaxError(function(event, XMLHttpRequest, ajaxOptions) {
			// 403 means we aren't authenticated anymore, so reload the page
			if(XMLHttpRequest.status == 403) window.location.reload();

			// check if a custom errorhandler is used
			if(typeof ajaxOptions.error == 'undefined') {
				var textStatus = 'General error';

				// get errormessage for AJAX-call
				if(typeof XMLHttpRequest.responseText != 'undefined') {
					var json = $.parseJSON(XMLHttpRequest.responseText);
					if(typeof json.message != 'undefined') textStatus = json.message;
					else textStatus = XMLHttpRequest.responseText;
				}
				$('body').prepend('<div class="alert alert-error noMargin"><a href="#" class="close" data-dismiss="alert">x</a>' + textStatus + '</div>');
			}
		});

		// spinner stuff
		$(document).ajaxStart(function() { $('#ajaxSpinner').show(); });
		$(document).ajaxStop(function() { $('#ajaxSpinner').hide(); });
	}
}

jsSite.api = {
	e: null,
	filename: null,

	init: function() {
		if($('body').hasClass('videoRecorder')) { jsSite.api.initRecorder(); }
		if($('body').hasClass('videoPlayer')) { jsSite.api.initPlayer(); }
		window.addEventListener("message", jsSite.api.receive, false);
	},

	initRecorder: function() {
		var flashvars = {
			debug: false,
			mirror: true,
			quality: 90,
			recordtime: 20,
			filename: data.videoId
		}
		var params = {};
		var attributes = {
			id: 'videorecorder',
			name: 'videorecorder'
		};
		swfobject.embedSWF(
			'/core/flash/recorder.swf',
			'flashContent',
			615, 350, '11.0.0', null,
			flashvars, params, attributes
		);
		setInterval(function() {
			var flash = document.getElementById('videorecorder');

			try {
				if(!flash.hasWebcam()) {
					$('#videorecorder').remove();
					$('body').html(
						'<div id="flashContent" style="visibility: visible;">' +
						'   <div id="noFlash">' +
						'	    <div id="erroricon"></div>' +
						'       We are sorry, Creative Comments needs a webcam and a microphone to get magic done...' +
						'   </div>' +
						'</div>'
					);
				}
			} catch(e) {
				$('#videorecorder').remove();
				$('body').html(
					'<div id="flashContent" style="visibility: visible;">' +
					'   <div id="noFlash">' +
					'	    <div id="erroricon"></div>' +
					'       We are sorry, Creative Comments needs a webcam and a microphone to get magic done...' +
					'   </div>' +
					'</div>'
				);
			}
		}, 700);
	},

	initPlayer: function() {
		var flashvars = {
			debug: false,
			mirror: true,
			quality: 90,
			recordtime: 20,
			filename: data.videoId,
			player: true
		}
		var params = {};
		var attributes = {
			id: 'videorecorder',
			name: 'videorecorder'
		};
		swfobject.embedSWF(
			'/core/flash/recorder.swf',
			'flashContent',
			615, 350, '11.0.0', null,
			flashvars, params, attributes
		);

		setTimeout(function() {
			var flash = document.getElementById('videorecorder');
			try {
				flash.startPlaying();
			} catch(e) {
				setTimeout(function() {
					var flash = document.getElementById('videorecorder');
					try {
						flash.startPlaying();
					} catch(e) {
						console.log(e)
					}
				}, 700);
			}
		}, 700);
	},

	receive: function(e) {
		var method = e.data.method;
		var flash = document.getElementById('videorecorder');
		if(typeof method == 'undefined') return;

		switch(method) {
			case 'videorecorder.startRecording':
				if(flash.isWebCamMuted()) {
					$('#videorecorder').remove();
					$('body').html(
						'<div id="flashContent" style="visibility: visible;">' +
						'   <div id="noFlash">' +
						'	    <div id="erroricon"></div>' +
						'       We are sorry, Creative Comments needs a webcam and a microphone to get magic done...' +
						'   </div>' +
						'</div>'
					);
				} else {
					flash.startRecording();
					e.source.postMessage({ method: 'videorecorder.startedRecording' }, e.origin);
				}
			break;
			case 'videorecorder.stopRecording':
				flash.stopRecording();
				e.source.postMessage({ method: 'videorecorder.stoppedRecording' }, e.origin);
			break;
			case 'videorecorder.saveRecording':
				flash.stopRecording();
				flash.getFilename();
				e.source.postMessage({ method: 'videorecorder.savedRecording' }, e.origin);
			break;
			case 'videorecorder.getStreamName':
				flash.getFilename();
				jsSite.api.e = e;
				break;
			default:
				console.log(e);
		}
	}
}

jsSite.bugs = {
	screenshot: null,
	init: function() {
		$('#reportBugModal').modal({ show: false, backdrop: false });
		$('#reportBug').on('click', jsSite.bugs.click);
		$('#reportBugNext').on('click', jsSite.bugs.next);
		$('#reportBugPrevious').on('click', jsSite.bugs.previous);
		$('#reportBugSubmit').on('click', jsSite.bugs.save);
		$('#reportBugBox a.close').on('click', jsSite.bugs.close);
	},
	click: function(e) {
		$('#reportBugBox .step1').show();
		$('#reportBugBox .step2').hide();
		$('#reportBugBox .step3').hide();
		$('#reportBugNext').show();

		$('#reportBugModal').modal('show');
		$('#reportBugDescription').focus();
	},
	close: function(e) {
		e.preventDefault();
		$('#reportBugBox').fadeOut();
	},
	next: function(e) {
		e.preventDefault();

		// hide previous errors
		$reportBugDescriptionError = $('#reportBugDescriptionError');
		$reportBugDescriptionError.hide();
		$reportBugDescriptionError.parents('.control-group').removeClass('error');

		// init var
		var noErrors = true;

		// validate
		if($('#reportBugDescription').val().length == 0) {
			noErrors = false;
			$reportBugDescriptionError.show();
			$reportBugDescriptionError.parents('.control-group').addClass('error');
		}

		// no errors
		if(noErrors) {
			// enable submit
			$('#reportBugSubmit').removeClass('disabled').prop('disabled', false);

			// show spinner
			$('#reportBugSubmitSpinner').show();

			$('#reportBugBox .step1').hide();
			$('#reportBugBox .step2').show();
			$('#reportBugBox .step3').hide();
			$('#reportBugNext').hide();
			$('#reportBugPrevious').show();
			$('#reportBugSubmit').show().addClass('disabled');

			// create screen shot
			$('#reportBugModal').hide();
			html2canvas($('body'), { onrendered: jsSite.bugs.onCompletePreload });
		}
		else $('#reportBugSubmit').addClass('disabled').prop('disabled', true);
	},
	onCompletePreload: function(canvas) {
		if(typeof FlashCanvas != "undefined") { FlashCanvas.initElement(canvas); }

		try {
			jsSite.bugs.screenshot = canvas.toDataURL();
		} catch(e) { }

		$('#reportBugModal').show();
		$('#reportBugSubmitSpinner').hide();
		$('#reportBugSubmit').removeClass('disabled');
	},
	previous: function(e) {
		e.preventDefault();

		$('#reportBugBox .step1').show();
		$('#reportBugBox .step2').hide();
		$('#reportBugBox .step3').hide();
		$('#reportBugNext').show();
		$('#reportBugPrevious').hide();
		$('#reportBugSubmit').hide();
	},
	save: function(e) {
		// build data
		var data = {
			description: $('#reportBugDescription').val(),
			screenshot: jsSite.bugs.screenshot,
			currentUser: currentUser,
			data: { url: document.location.href }
		};

		$.ajax({
		   url: '/ajax.php?module=core&action=bug&language=' + jsSite.current.language,
		   data: data,
		   success: function(data, textStatus, jqXHR) {
			   if(data.code == 200) {
				   $('#reportBugBox .step1').hide();
				   $('#reportBugBox .step2').hide();
				   $('#reportBugBox .step3').show();
				   $('#reportBugNext').hide();
				   $('#reportBugPrevious').hide();
				   $('#reportBugSubmit').hide();
				   $('#reportBugClose').show();

			       // clear info
				   $('#reportBugDescription').val('');
			   }

			   else alert(data.message);
		   }
	   });
	}
}

jsSite.comments = {
	isPlaying: false,

	init: function() {
		if($('#flashContent').length > 0) {
			var flashvars = {
				debug: false,
				mirror: true,
				quality: 90,
				recordtime: 20,
				filename: data.videoId,
				player: true
			}
			var params = {};
			var attributes = {
				id: 'videorecorder',
				name: 'videorecorder'
			};
			swfobject.embedSWF(
				'/core/flash/recorder.swf',
				'flashContent',
				615, 350, '11.0.0', null,
				flashvars, params, attributes
			);

			var timer = setInterval(function() {
				var flash = document.getElementById('videorecorder');
				try {
					flash.startPlaying();
					clearInterval(timer);
				} catch(e) {
				}
			}, 700);

			$('#playButton').on('click', function(e) {
				e.preventDefault();

				if(jsSite.comments.isPlaying) document.getElementById('videorecorder').stopPlaying();
				else document.getElementById('videorecorder').startPlaying();
			});
		}
	}
}

jsSite.forms = {
	init: function() {
		$('form').on('submit', function(e) { $('#ajaxSpinner').show(); });
		jsSite.forms.datefields();
		jsSite.forms.placeholders();
	},
	datefields: function() {
		// the default, nothing special
		if($('.inputDatefieldNormal').length > 0) {
			$('.inputDatefieldNormal').each(function() {
				var data = $(this).data();
				$(this).datepicker({
					dateFormat: 'dd/mm/yy',
					dayNames: ['zondag', 'maandag', 'dinsdag', 'woensdag', 'donderdag', 'vrijdag', 'zaterdag'],
					dayNamesMin: ['zo', 'ma', 'di', 'wo', 'do', 'vr', 'za'],
					dayNamesShort: ['zon', 'maa', 'din', 'woe', 'don', 'vrij', 'zat'],
					firstDay: 1,
					hideIfNoPrevNext: true,
					monthNames: ['januari', 'februari', 'maart', 'april', 'mei', 'juni', 'juli', 'augustus', 'september', 'oktober', 'november', 'december'],
					monthNamesShort: ['jan', 'feb', 'maa', 'apr', 'mei', 'jun', 'jul', 'aug', 'sep', 'okt', 'nov', 'dec'],
					nextText: 'volgende',
					prevText: 'vorige',
					showAnim: 'slideDown'
				});
			});
		}

		// datefields that have a certain startdate
		if($('.inputDatefieldFrom').length > 0) {
			$('.inputDatefieldFrom').each(function() {
				var data = $(this).data();
				$(this).datepicker({
					dateFormat: 'dd/mm/yy',
					dayNames: ['zondag', 'maandag', 'dinsdag', 'woensdag', 'donderdag', 'vrijdag', 'zaterdag'],
					dayNamesMin: ['zo', 'ma', 'di', 'wo', 'do', 'vr', 'za'],
					dayNamesShort: ['zon', 'maa', 'din', 'woe', 'don', 'vrij', 'zat'],
					firstDay: 1,
					hideIfNoPrevNext: true,
					monthNames: ['januari', 'februari', 'maart', 'april', 'mei', 'juni', 'juli', 'augustus', 'september', 'oktober', 'november', 'december'],
					monthNamesShort: ['jan', 'feb', 'maa', 'apr', 'mei', 'jun', 'jul', 'aug', 'sep', 'okt', 'nov', 'dec'],
					nextText: 'volgende',
					prevText: 'vorige',
					minDate: new Date(parseInt(data.startdate.split('-')[0], 10), parseInt(data.startdate.split('-')[1], 10) - 1, parseInt(data.startdate.split('-')[2], 10)),
					showAnim: 'slideDown'
				});
			});
		}

		// datefields that have a certain enddate
		if($('.inputDatefieldTill').length > 0) {
			$('.inputDatefieldTill').each(function() {
				var data = $(this).data();
				$(this).datepicker({
					dateFormat: 'dd/mm/yy',
					dayNames: ['zondag', 'maandag', 'dinsdag', 'woensdag', 'donderdag', 'vrijdag', 'zaterdag'],
					dayNamesMin: ['zo', 'ma', 'di', 'wo', 'do', 'vr', 'za'],
					dayNamesShort: ['zon', 'maa', 'din', 'woe', 'don', 'vrij', 'zat'],
					firstDay: 1,
					hideIfNoPrevNext: true,
					monthNames: ['januari', 'februari', 'maart', 'april', 'mei', 'juni', 'juli', 'augustus', 'september', 'oktober', 'november', 'december'],
					monthNamesShort: ['jan', 'feb', 'maa', 'apr', 'mei', 'jun', 'jul', 'aug', 'sep', 'okt', 'nov', 'dec'],
					nextText: 'volgende',
					prevText: 'vorige',
					maxDate: new Date(parseInt(data.enddate.split('-')[0], 10), parseInt(data.enddate.split('-')[1], 10) -1, parseInt(data.enddate.split('-')[2], 10)),
					showAnim: 'slideDown'
				});
			});
		}

		// datefields that have a certain range
		if($('.inputDatefieldRange').length > 0) {
			$('.inputDatefieldRange').each(function() {
				var data = $(this).data();
				$(this).datepicker({
					dateFormat: 'dd/mm/yy',
					dayNames: ['zondag', 'maandag', 'dinsdag', 'woensdag', 'donderdag', 'vrijdag', 'zaterdag'],
					dayNamesMin: ['zo', 'ma', 'di', 'wo', 'do', 'vr', 'za'],
					dayNamesShort: ['zon', 'maa', 'din', 'woe', 'don', 'vrij', 'zat'],
					firstDay: 1,
					hideIfNoPrevNext: true,
					monthNames: ['januari', 'februari', 'maart', 'april', 'mei', 'juni', 'juli', 'augustus', 'september', 'oktober', 'november', 'december'],
					monthNamesShort: ['jan', 'feb', 'maa', 'apr', 'mei', 'jun', 'jul', 'aug', 'sep', 'okt', 'nov', 'dec'],
					nextText: 'volgende',
					prevText: 'vorige',
					minDate: new Date(parseInt(data.startdate.split('-')[0], 10), parseInt(data.startdate.split('-')[1], 10) - 1, parseInt(data.startdate.split('-')[2], 10), 0, 0, 0, 0),
					maxDate: new Date(parseInt(data.enddate.split('-')[0], 10), parseInt(data.enddate.split('-')[1], 10) - 1, parseInt(data.enddate.split('-')[2], 10), 23, 59, 59),
					showAnim: 'slideDown'
				});
			});
		}
	},
	placeholders: function() {
		// detect if placeholder-attribute is supported
		jQuery.support.placeholder = ('placeholder' in document.createElement('input'));
		if(!jQuery.support.placeholder) {
			// bind focus
			$('input[placeholder]').focus(function() {
				var input = $(this);
				if(input.val() == input.attr('placeholder')) {
					input.val('');
					input.removeClass('placeholder');
				}
			});
			$('input[placeholder]').blur(function() {
				var input = $(this);
				if(input.val() == '' || input.val() == input.attr('placeholder')) {
					input.val(input.attr('placeholder'));
					input.addClass('placeholder');
				}
			});
			$('input[placeholder]').blur();
			$('input[placeholder]').parents('form').submit(function() {
				$(this).find('input[placeholder]').each(function() {
					var input = $(this);
					if(input.val() == input.attr('placeholder')) input.val('');
				});
			});
		}
	}
}

jsSite.layout = {
	init: function() {
		if(
			!(navigator.userAgent.match(/iPhone/i)) &&
			!(navigator.userAgent.match(/iPod/i)) &&
			!(navigator.userAgent.match(/iPad/i))
		) {
			$(document).on('scroll', jsSite.layout.onScroll);
		}
	},
	onScroll: function(e) {
		var $this = $(this);
		var $header = $('#header');
		var $navBar = $('#navBar');

		if($this.scrollTop() >= $header.height()) $navBar.addClass('fixed').css('width', ($('#header').width()));
		if($this.scrollTop() < $header.height()) $navBar.removeClass('fixed').css('width', 'auto');
	}
}

jsSite.links = {
	init: function() {
		$('a.confirm').on('click', jsSite.links.confirm);
		$('#confirmModal').modal({ show: false, backdrop: false });
	},
	confirm: function(e) {
		e.preventDefault();
		var $this = $(this);
		$('#confirmModalOk').attr('href', $this.attr('href'));
		$('#confirmModalMessage').html($this.data('message'));
		$('#confirmModal').modal('show');
	}
}

jsSite.facebook = {
	isChecked: false,

	init: function()
	{
		$('#pages form').on('submit', function(e) {
			if(!jsSite.facebook.isChecked) {
				e.preventDefault();

				$('#passwordBox').removeClass('error');
				$('#passwordBox .formError').hide();
				var $form = $(this);

				if($('#password').val() == '') {
					$('#passwordBox').addClass('error');
					$('#passwordBox #required').show();
					return;
				}

				$.ajax({
					url: '/ajax.php?module=pages&action=beta&language=' + jsSite.current.language,
					data: { code: $('#password').val() },
					success: function(data, textStatus, jqXHR) {
						if(data.code == 200) {
							FB.login(
								function(response) {
									jsSite.facebook.isChecked = true;
									$form.submit();
								},
								{ scope: 'email' }
							);
						}
						else {
							$('#passwordBox').addClass('error');
							$('#passwordBox #wrong').show();
						}
					}
				});
			}
		});

		$('#betaAccess').on('click', function(e) {
			$(this).parents('form').submit();
		});

		$('a.facebookRegister').on('click', function(e) {
			e.preventDefault();
			FB.login(
				function(response)
				{
					if(response.status == 'not_authorized') {
						window.location = '/en/error/?message=not-authorized';
					}

					else window.location.reload();
				},
				{
					scope: 'email'
				}
			);
		});

		$('a.facebookSignOff').on('click', function(e) {
			e.preventDefault();

			FB.getLoginStatus(function(response) {
				if(response.authResponse) {
					FB.logout(function(response) {
						window.location = '/en/users/logout';
					});
				} else {
					window.location = '/en/users/logout';
				}
			});
		});
	}
}

jsSite.users = {
	init: function()
	{
	}
}

jsSite.search = {
	results: [],
	init: function() {
		$('#searchQuery').typeahead({
			source: jsSite.search.autocomplete,
			matcher: function(item) { return true },
			updater: jsSite.search.updater,
			highlighter: function(items) { return items; }
		});
	},
	autocomplete: function(query, process) {
		$.ajax({
			url: '/ajax.php?module=core&action=search&language=' + jsSite.current.language,
			data: { q: query },
			success: function(data, textStatus, jqXHR) {
				jsSite.search.results = [];
				if(data.code == 200) {
					var items = [];
					for(var i in data.data) {
						var key = data.data[i].label + ' <small class="muted">(' + data.data[i].module + ')</small>';
						items.push(key);
						jsSite.search.results[key] = data.data[i]
					}
					process(items);
				}
				else alert(data.message);
			}
		});
	},
	updater: function(item) {
		if(typeof jsSite.search.results[item].url != 'undefined') {
			document.location = jsSite.search.results[item].url;
		} else if(typeof jsSite.search.results[item].value != 'undefined') {
			return jsSite.search.results[item].value;
		} else {
			return item;
		}
	}
}

jsSite.creativeComments =
{
	fixNoMargin: function()
	{
		$('.item.noMargin').removeClass('noMargin');
		var i = 1;
		$('.item:visible').each(function() {
			if(i % 4 == 0 || i == 1) {
				$(this).addClass('noMargin');
				i = 1;
			}
			i++;
		});
	},

	showElement: function($parent) {
		$('#creativeCommentsSub:hidden').show();
		$parent.slideDown();
		$('html, body').stop().animate({
			scrollTop: $parent.offset().top - 20
		}, 1000);
	},
	closeElement: function($parent) {
		$parent.slideUp(
			function() {
				if($('#creativeCommentsSub .row-fluid:visible').length == 0) {
					$('#creativeCommentsSub').hide();
				}
			}
		);
		$('html, body').stop().animate({
			scrollTop: $('#comments').offset().top
		}, 1000);
	},

	init: function()
	{
		$pluginNotInstalled = $('#pluginNotInstalled');
		$noPluginAvailable = $('#noPluginAvailable');

		if($pluginNotInstalled.length > 0)
		{
			$pluginNotInstalled.show();

			// detect browser
			if($.browser.chrome) $('#browserPluginChrome').show();
			if($.browser.mozilla) $('#browserPluginFirefox').show();
			if($.browser.safari) $('#browserPluginSafari').show();
			if($.browser.chrome || $.browser.mozilla || $.browser.safari) $('#noPluginAvailable').hide();
		}

		$(window).on('cco:loaded', function(e) {
			$pluginNotInstalled.hide();

			/* For some reason CC isn't registered anymore on the window, so we cant chck the version...
			$.ajax({
				url: '/ajax.php?module=plugins&action=versions&language=' + jsSite.current.language,
				success: function(data, textStatus, jqXHR)
				{
					if($.browser.chrome && data.data.chrome.latest.version != window.CC.data.version) $('#upgradeBar').show();
					if($.browser.mozilla && data.data.mozilla.latest.version != window.CC.data.version) $('#upgradeBar').show();
					if($.browser.safari && data.data.safari.latest.version != window.CC.data.version) $('#upgradeBar').show();
				}
			});*/
		});

		$('#emotionFilter').on('click', 'a', function(e) {
			e.preventDefault();

			var emotion = $(this).data('value');
			var $items = $('.item:has(.' + emotion + ')');

			if($($items[0]).is(':visible')) {
				$items.hide();
			} else {
				$items.show();
			}
			jsSite.creativeComments.fixNoMargin();
			$(this).parent('li').toggleClass('active');
		});
		$(document).on('click', '.itemGrid .item', function(e) {
			e.preventDefault();
			document.location = $(this).find('a:first').attr('href');
		});
		$(document).on('click', 'a.disabled', function(e) {
			e.preventDefault();
		});

		$(document).on('click', 'a.toggleElement', function(e) {
			e.preventDefault();
			var $element = $('#' + $(this).data('id'));
			var $parent = $($element.parents('.row-fluid:first'));

			if($parent.is(':visible')) {
				jsSite.creativeComments.closeElement($parent);
			} else {
				jsSite.creativeComments.showElement($parent);
			}
		});

		$(document).on('click', 'a.toggleYoutube', function(e) {
			e.preventDefault();
			var $element = $('#' + $(this).data('id'));
			var $parent = $($element.parents('.row-fluid:first'));

			if($parent.is(':visible')) {
				$element.html('');
				jsSite.creativeComments.closeElement($parent);
			} else {
				var youtubeId = $(this).data('ytId');
				$element.html('<a class="closeBtn toggleYoutube" data-id="youtubeHolder" href="#">{$lblClose|ucfirst}</a>' +
				              '<iframe width="610" height="450" src="http://www.youtube.com/embed/' + youtubeId + '?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>');
				jsSite.creativeComments.showElement($parent);
			}
		});
		$(document).on('click', 'a.toggleSoundcloud', function(e) {
			e.preventDefault();
			var $element = $('#' + $(this).data('id'));
			var $parent = $($element.parents('.row-fluid:first'));

			if($parent.is(':visible')) {
				jsSite.creativeComments.closeElement($parent);
				$element.html('');
			} else {
				var soundcloudData = $(this).data('soundcloudId').split('|');
				var html = '<a class="closeBtn toggleSoundcloud" data-id="soundcloudHolder" href="#">{$lblClose|ucfirst}</a>';

				if(soundcloudData[0] == 'user') {
					html += '<iframe id="soundcloudFrame" width="610" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http://api.soundcloud.com/users/' + soundcloudData[1] + '?auto_play=true"></iframe>';
				}
				if(soundcloudData[0] == 'track') {
					html += '<iframe id="soundcloudFrame" width="610" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http://api.soundcloud.com/tracks/' + soundcloudData[1] + '?auto_play=true"></iframe>';
				}

				$element.html(html);
				jsSite.creativeComments.showElement($parent);
			}
		});
	}
}

$(jsSite.init);

function showRecorderFilename(filename){
	jsSite.api.file = filename;
	jsSite.api.e.source.postMessage({ method: 'videorecorder.updateStreamName', name: filename }, e.origin);
}

function recorderStatus(status){
	var $playButton = $('#playButton');
	if($playButton.length > 0) {
		if(status == 'play.start') {
			jsSite.comments.isPlaying = true;
			$playButton.addClass('pause').removeClass('play');
		}
		if(status == 'play.stop') {
			jsSite.comments.isPlaying = false;
			$playButton.addClass('play').removeClass('pause');
		}
	}
}