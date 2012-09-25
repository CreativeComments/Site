<!doctype html>
<html lang="{$LANGUAGE}">
<head>
	<meta charset="utf-8">

	<title>{$SITE_DEFAULT_TITLE}</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="SumoCoders">

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<link rel="stylesheet" href="/core/layout/css/style.css?m={$LAST_MODIFIED}">
	{option:css}
		{iteration:css}
			<link rel="stylesheet" href="{$css.url}">
		{/iteration:css}
	{/option:css}

	<!-- icon in the URL-bar -->
	<link rel="shortcut icon" href="/favicon.ico">

	<!-- icon used when saved as a bookmark on iPhone/iPad/Android/... -->
	<link rel="apple-touch-icon" href="/apple-touch-icon.png">

	<!--  icon for facebook -->
	<link rel="image_src" href="/image_src.png" />

	<script src="/core/js/lib.js?m={$LAST_MODIFIED}"></script>
	<script src="/core/js/script.js?m={$LAST_MODIFIED}"></script>
	{option:javascript}
		{iteration:javascript}
			<script src="{$javascript.url}"></script>
		{/iteration:javascript}
	{/option:javascript}
	<script>
		var currentUser = {};
		{option:currentUser}
		currentUser.name = '{$currentUser.name|addslashes}';
		currentUser.email = '{$currentUser.email|addslashes}';
		{/option:currentUser}
	</script>
</head>
<body>
	<div id="fb-root"></div>
	<script>
		window.fbAsyncInit = function() {
			FB.init({ appId: '{$FB_APP_ID}', channelUrl: '//{$SITE_DOMAIN}/channel.html', status: true, cookie: true, xfbml: true });
			jsSite.facebook.init();
		};

		// Load the SDK Asynchronously
		(function(d){
			var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
			if (d.getElementById(id)) {return;}
			js = d.createElement('script'); js.id = id; js.async = true;
			js.src = "//connect.facebook.net/en_US/all.js";
			ref.parentNode.insertBefore(js, ref);
		}(document));
	</script>
	<!--[if lt IE 8 ]>
		<div id="ie6" class="alert alert-block">
			<a href="#" class="close" data-dismiss="alert">x</a>
			{$msgOldBrowserWarning}
		</div>
	<![endif]-->
