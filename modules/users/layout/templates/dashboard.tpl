{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

<div id="content" class="container-fluid">
    <div id="{$MODULE}" class="{$ACTION}">
		<section id="pluginNotInstalled" class="row-fluid">
            <div class="span12">
				<header>
					<h2>{$lblPluginNotInstalled}</h2>
				</header>
				{$msgPluginNotInstalled}

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
		</section>

		<section class="row-fluid">
			<header>
				<h2>{$msgUsersYourCreativeComments}</h2>
			</header>

			{option:dataGrid}
				{$dataGrid}
			{/option:dataGrid}
			{option:!dataGrid}
				<div class="alert">
					{$msgUsersNoCreativeComments}
				</div>
			{/option:!dataGrid}
		</section>
    </div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</div>
</body>
</html>