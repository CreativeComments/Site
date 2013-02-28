{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

<div id="content">
	<section id="{$MODULE}" class="{$ACTION}">
		<div class="container">
			<div class="row-fluid" id="pluginNotInstalled">
				<div class="span12">
					<header>
						<h2>{$lblPluginNotInstalled|ucfirst}</h2>
					</header>
					<div class="alert" id="noPluginAvailable">
						{$msgNoPluginAvailable}
					</div>
					<p>
						<a style="display: none;" id="browserPluginChrome" class="btn" href="{$var|buildurl:'download':'plugins'}?browser=chrome&version=latest">Download for Chrome</a>
						<!-- @todo remove the strike-elements when other plugins are ready -->
						<a style="display: none;" id="browserPluginFirefox" class="btn" href="{$var|buildurl:'download':'plugins'}?browser=firefox&version=latest"><strike>Download for Firefox</strike> <small>(not available yet)</small></a>
						<a style="display: none;" id="browserPluginSafari" class="btn" href="{$var|buildurl:'download':'plugins'}?browser=safari&version=latest"><strike>Download for Safari</strike> <small>(not available yet)</small></a>
						<small><br ><a href="{$var|buildurl:'plugins':'pages'}"><strike>{$lblOtherBrowsers|ucfirst}</strike> <small>(not available yet)</small></a></small>
					</p>
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
							<li class="active"><a href="#" class="normal" data-value="normal">{$lblNormal|ucfirst}</a></li>
							<li class="active"><a href="#" class="happy" data-value="happy">{$lblHappy|ucfirst}</a></li>
						</ul>
					</div>
				</div>
			</div>

		<div class="row-fluid itemGrid">
			{option:items}
				{iteration:items}
					<div class="span4 item">
						<div class="videoHolder">
							<div class="video">
							{* this should be a still instead of this tiny flash thingy *}
							{option:items.videoId}
								{$items.video_flash_278x135}
							{/option:items.videoId}
							</div>
						</div>
						<div class="user {$items.emotion}">
							<div class="avatar">
								<div class="top"></div>
								<img src="https://graph.facebook.com/{$items.user.facebookId}/picture?type=square" width="40" height="40" alt="" />
							</div>
							<div class="content">
								<a href="#">
									{$items.user.name}
								</a>
								<time datetime="{$items.createdOn|date:"Y-m-d\TH:i:s"}">{$items.createdOn|timeago}</time>
							</div>
						</div>
					</div>
					{option:items.newRow}
		</div>
		<div class="row-fluid itemGrid">
					{/option:items.newRow}
				{/iteration:items}
			{/option:items}
			{option:!items}
				<div class="alert">
					{$msgUsersNoCreativeComments}
				</div>
			{/option:!items}
		</div>
	</section>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</div>
</body>
</html>