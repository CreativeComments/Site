{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content">
		<div class="container">
			<section id="{$MODULE}" class="{$ACTION}">
				<div class="row-fluid">
					<div class="span4 plugin">
						<div class="icon chrome"></div>
						<h2>Chrome</h2>
						<p>Download the plugin.</p>
						<p>
							<a href="https://chrome.google.com/webstore/detail/creative-comments/helhdkbppnbmifdjhhiecciflfneoedj" class="btn">Download</a>
						</p>
					</div>
					<div class="span4 plugin notReady">
						<div class="icon firefox"></div>
						<h2>Firefox</h2>
						<p>not available yet</p>
						<p>
							<a href="{$var|buildurl:'download':'plugins'}?browser=firefox&version=latest" class="btn disabled">Download</a>
						</p>
					</div>
					<div class="span4 plugin notReady">
						<div class="icon safari"></div>
						<h2>Safari</h2>
						<p>not available yet</p>
						<p>
							<a href="{$var|buildurl:'download':'plugins'}?browser=safari&version=latest" class="btn disabled">Download</a>
						</p>
					</div>
				</div>
			</section>
		</div>
	</div>
	{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>