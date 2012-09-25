{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content" class="container-fluid">
		<section id="{$MODULE}" class="{$ACTION}">
			<div class="row-fluid">
				<div class="span4 content well">
					<h2>Chrome</h2>
					<p>...</p>
					<p>
						<a href="/files/plugins/chrome_latest.crx" class="btn">Download</a>
					</p>
				</div>
                <div class="span4 content well">
                    <h2>Firefox</h2>
                    <p>...</p>
                    <p>
                        <a href="/files/plugins/firefox_latest.crx" class="btn">Download</a>
                    </p>
                </div>
                <div class="span4 content well">
                    <h2>Safari</h2>
                    <p>...</p>
                    <p>
                        <a href="/files/plugins/safari_latest.crx" class="btn">Download</a>
                    </p>
                </div>
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>