{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

<div id="content" class="container-fluid">
    <div id="{$MODULE}" class="{$ACTION}">
		<section id="pluginNotInstalled">
			<header>
				<h2>{$lblPluginNotInstalled}</h2>
			</header>
			{$msgPluginNotInstalled}

            <div class="alert" id="noPluginAvailable">
				{$msgNoPluginAvailable}
			</div>

			<p>
				<a style="display: none;" id="browserPluginChrome" class="btn" href="/files/plugins/chrome_latest.crx">Download for Chrome</a>
				<a style="display: none;" id="browserPluginFirefox" class="btn" href="/files/plugins/firefox_latest.crx">Download for Firefox</a>
				<a style="display: none;" id="browserPluginSafari" class="btn" href="/files/plugins/safari_latest.crx">Download for Safari</a>
				<small><br ><a id="" href="{$var|buildurl:'plugins':'pages'}">{$lblOtherBrowsers|ucfirst}</a></small>
			</p>
		</section>
    </div>

{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</div>
</body>
</html>