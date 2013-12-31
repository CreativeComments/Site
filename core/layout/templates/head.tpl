<!doctype html>
<!--[if lte IE 8 ]> <html lang="{$LANGUAGE}" class="ie8 ie"> <![endif]-->
<!--[if IE 9 ]> <html lang="{$LANGUAGE}" class="ie9 ie"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="{$LANGUAGE}"> <!--<![endif]-->
<head>
	<meta charset="utf-8">

	<title>
		{option:pageTitle}{$pageTitle} - {/option:pageTitle}
		{$SITE_DEFAULT_TITLE}
	</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="SumoCoders">
	{option:meta}{$meta}{/option:meta}

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
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js"></script>
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
		var data = {};
		{option:data.videoId}data.videoId = '{$data.videoId|addslashes}';{/option:data.videoId}
	</script>

	<!-- Google Analytics -->
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-35168025-1']);
		_gaq.push(['_trackPageview']);
		(function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
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
		<div id="ie6" class="alert alert-block" style="margin: 0;">
			<a href="#" class="close" data-dismiss="alert">x</a>
			{$msgOldBrowserWarning}
		</div>
	<![endif]-->
    <div id="upgradeBar" class="alert alert-block" style="margin: 0; display: none;">
        <a href="#" class="close" data-dismiss="alert">x</a>
		{$msgUpgradePlugin}
    </div>
