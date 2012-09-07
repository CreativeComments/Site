/**
 * Frontend related objects
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */
var jsSite =
{
	debug: false,
	current:
	{
		module: null,
		action: null,
		language: null
	},

	init: function()
	{
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

		try
		{
			// build method
			var method = 'jsSite.'+ jsSite.current.module +'.init()';

			// try to call the method
			eval(method);
		}
		catch(e)
		{
			if(jsSite.debug) console.log(e);
		}
	},

	initAjax: function()
	{
		// set defaults for AJAX
		$.ajaxSetup(
		{
			cache: false,
			type: 'POST',
			dataType: 'json',
			timeout: 5000
		});

		// global error handler
		$(document).ajaxError(function(event, XMLHttpRequest, ajaxOptions)
		{
			// 403 means we aren't authenticated anymore, so reload the page
			if(XMLHttpRequest.status == 403) window.location.reload();

			// check if a custom errorhandler is used
			if(typeof ajaxOptions.error == 'undefined')
			{
				var textStatus = 'General error';

				// get errormessage for AJAX-call
				if(typeof XMLHttpRequest.responseText != 'undefined')
				{
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

jsSite.bugs =
{
	screenshot: null,

	init: function()
	{
		$('#reportBugModal').modal({ show: false, backdrop: false });
		$('#reportBug').on('click', jsSite.bugs.click);
		$('#reportBugNext').on('click', jsSite.bugs.next);
		$('#reportBugPrevious').on('click', jsSite.bugs.previous);
		$('#reportBugSubmit').on('click', jsSite.bugs.save);
		$('#reportBugBox a.close').on('click', jsSite.bugs.close);
	},

	click: function(e)
	{
		$('#reportBugBox .step1').show();
		$('#reportBugBox .step2').hide();
		$('#reportBugBox .step3').hide();
		$('#reportBugNext').show();

		$('#reportBugModal').modal('show');
		$('#reportBugDescription').focus();
	},

	close: function(e)
	{
		// prevent default behaviour
		e.preventDefault();

		// hide box
		$('#reportBugBox').fadeOut();
	},

	next: function(e)
	{
		// prevent default behaviour
		e.preventDefault();

		// hide previous errors
		$reportBugDescriptionError = $('#reportBugDescriptionError');
		$reportBugDescriptionError.hide();
		$reportBugDescriptionError.parents('.control-group').removeClass('error');

		// init var
		var noErrors = true;

		// validate
		if($('#reportBugDescription').val().length == 0)
		{
			noErrors = false;
			$reportBugDescriptionError.show();
			$reportBugDescriptionError.parents('.control-group').addClass('error');
		}

		// no errors
		if(noErrors)
		{
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
			html2canvas($('body'), {
				onrendered: jsSite.bugs.onCompletePreload
			});
		}
		else $('#reportBugSubmit').addClass('disabled').prop('disabled', true);

	},

	onCompletePreload: function(canvas)
	{
		if(typeof FlashCanvas != "undefined") {
			FlashCanvas.initElement(canvas);
		}

		try
		{
			jsSite.bugs.screenshot = canvas.toDataURL();
		}
		catch(e)
		{

		}

		$('#reportBugModal').show();
		$('#reportBugSubmitSpinner').hide();
		$('#reportBugSubmit').removeClass('disabled');

		// @later	enable highlight

	},

	previous: function(e)
	{
		// prevent default behaviour
		e.preventDefault();

		$('#reportBugBox .step1').show();
		$('#reportBugBox .step2').hide();
		$('#reportBugBox .step3').hide();
		$('#reportBugNext').show();
		$('#reportBugPrevious').hide();
		$('#reportBugSubmit').hide();
	},

	save: function(e)
	{
		// build data
		var data = {
			description: $('#reportBugDescription').val(),
			screenshot: jsSite.bugs.screenshot,
			currentUser: currentUser,
			data: {
				url: document.location.href
			}
		};

		$.ajax({
	       url: '/ajax.php?module=core&action=bug&language=' + jsSite.current.language,
	       data: data,
	       success: function(data, textStatus, jqXHR)
	       {
		       if(data.code == 200)
		       {
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

jsSite.forms =
{
	init: function() {}
}

jsSite.layout =
{
	init: function()
	{
		if(
			!(navigator.userAgent.match(/iPhone/i)) &&
			!(navigator.userAgent.match(/iPod/i)) &&
			!(navigator.userAgent.match(/iPad/i))
		)
		{
			$(document).on('scroll', jsSite.layout.onScroll);
		}
	},

	onScroll: function(e)
	{
		var $this = $(this);
		var $header = $('#header');
		var $navBar = $('#navBar');

		if($this.scrollTop() >= $header.height()) $navBar.addClass('fixed').css('width', ($('#header').width()));
		if($this.scrollTop() < $header.height()) $navBar.removeClass('fixed').css('width', 'auto');
	}
}

jsSite.links =
{
	init: function()
	{
		$('a.confirm').on('click', jsSite.links.confirm);
		$('#confirmModal').modal({ show: false, backdrop: false });
	},

	confirm: function(e)
	{
		e.preventDefault();

		var $this = $(this);

		$('#confirmModalOk').attr('href', $this.attr('href'));
		$('#confirmModalMessage').html($this.data('message'));
		$('#confirmModal').modal('show');
	}
}

$(jsSite.init);