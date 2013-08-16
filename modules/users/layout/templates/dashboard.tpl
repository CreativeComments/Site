{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

<div id="content">
	<section id="{$MODULE}" class="{$ACTION}">
		<div class="container">
			<div id="pluginNotInstalled" class="row-fluid plugins">
				<div class="span12">
					<h2>{$lblPluginNotInstalled|ucfirst}</h2>
				</div>
				<div class="row-fluid">
					<div id="browserPluginChrome" class="span4 plugin hide">
						<div class="icon chrome"></div>
						<h2>Chrome</h2>
						<p>Download the plugin.</p>
						<p>
							<a href="https://chrome.google.com/webstore/detail/creative-comments/helhdkbppnbmifdjhhiecciflfneoedj" class="btn">Download</a>
						</p>
					</div>
					<div id="browserPluginFirefox" class="span4 plugin hide notReady">
						<div class="icon firefox"></div>
						<h2>Firefox</h2>
						<p>not available yet</p>
						<p>
							<a href="{$var|buildurl:'download':'plugins'}?browser=firefox&version=latest" class="btn disabled">Download</a>
						</p>
					</div>
					<div id="browserPluginSafari" class="span4 plugin hide notReady">
						<div class="icon safari"></div>
						<h2>Safari</h2>
						<p>not available yet</p>
						<p>
							<a href="{$var|buildurl:'download':'plugins'}?browser=safari&version=latest" class="btn disabled">Download</a>
						</p>
					</div>

					<div class="span7 download">
						<header>
							<h3>Two simple steps towards success!</h3>
							<ol>
								<li>
									We support the Google Chrome browser. Please <a href="https://www.google.com/chrome">download and install</a> the browser first - it's free!
								</li>
								<li>
									Install the <a href="https://chrome.google.com/webstore/detail/creative-comments/helhdkbppnbmifdjhhiecciflfneoedj?hl=en">Google Chrome plug-in</a> to start creating your Creative Comments - easy enough!
								</li>
							</ol>
						</header>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="grid" class="container">
			<div class="subMenu">
				<div class="row-fluid menu">
					<div class="span4 title">
						<h3>{$lblYourComments|ucfirst}</h3>
					</div>
					<div class="span4 category">
{*
								Disabled for now because there is no such thing as categories
							<p>Sort by category</p>
							<div class="dropdown">
								<a class="dropdown-toggle btn" data-toggle="dropdown" href="#">Commodo Ridic<span class="icon"></span></a>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
									<li><a href="#">Lorem</a></li>
									<li><a href="#">Consectetur</a>	</li>
								</ul>
							</div>
*}
					</div>
					<div class="span4 emotion">
						<p>{$lblShowByEmotion|ucfirst}</p>
						<ul id="emotionFilter">
							<li class="active"><a href="#" class="sad" data-value="sad">{$lblSad|ucfirst}</a></li>
							<li class="active"><a href="#" class="normal" data-value="neutral">{$lblNormal|ucfirst}</a></li>
							<li class="active"><a href="#" class="happy" data-value="happy">{$lblHappy|ucfirst}</a></li>
						</ul>
					</div>
				</div>
			</div>

		<div class="row-fluid itemGrid">
			{option:items}
				{iteration:items}
					<div class="span4 item{option:items.newRow} noMargin{/option:items.newRow}">
						<div class="videoHolder">
							<a class="video" href="{$var|buildurl:'detail':'comments'}/{$items.id}">
								{option:items.videoStillUrl}
									<img src="{$items.videoStillUrl}" width="278" />
								{/option:items.videoStillUrl}
							</a>
						</div>
						<header>
							<h4>
								<a href="{$var|buildurl:'detail':'comments'}/{$items.id}">
									{$items.title}
								</a>
							</h4>
						</header>
						<div class="user {$items.emotion}">
							<div class="avatar">
								<div class="top"></div>
								<img src="https://graph.facebook.com/{$items.user.facebookId}/picture?type=square" width="40" height="40" alt="" />
							</div>
							<div class="content">
								<a href="{$var|buildurl:'detail':'comments'}/{$items.id}">
									{$items.user.name}
								</a>
								<time datetime="{$items.createdOn|date:"Y-m-d\TH:i:s"}">{$items.createdOn|timeago}</time>
							</div>
						</div>
					</div>
				{/iteration:items}
			{/option:items}
			{option:!items}
				<div class="alert">
					{$msgUsersNoCreativeComments}
				</div>
			{/option:!items}
		</div>
	</section>
</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>