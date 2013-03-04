{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content" class="container">
		<section id="{$MODULE}" class="{$ACTION}">
			<div class="row-fluid">
				<div class="span4 content well">
					<h2>Chrome</h2>
					<p>...</p>
					<p>
						<a href="{$var|buildurl:'download':'plugins'}?browser=chrome&version=latest" class="btn">Download</a>
					</p>
				</div>
				<!-- @todo remove the strike-elements when other plugins are ready -->
				<div class="span4 content well">
					<strike>
						<h2>Firefox</h2>
						<p>not available yet</p>
						<p>
							<a href="{$var|buildurl:'download':'plugins'}?browser=firefox&version=latest" class="btn">Download</a>
						</p>
					</strike>
				</div>
				<div class="span4 content well">
					<strike>
						<h2>Safari</h2>
						<p>not available yet</p>
						<p>
							<a href="{$var|buildurl:'download':'plugins'}?browser=safari&version=latest" class="btn">Download</a>
						</p>
					</strike>
				</div>
			</div>
		</section>
	</div>
	{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>