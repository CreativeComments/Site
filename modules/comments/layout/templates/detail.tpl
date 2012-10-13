{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content" class="container-fluid">
		{option:report}
			<div class="row-fluid">
                <div class="span12 alert alert-success">
					{$report}
                </div>
			</div>
		{/option:report}

		<section id="{$MODULE}" class="{$ACTION} row-fluid">
			<div class="span12 well">
				{option:item.text}
					<blockquote>
						{$item.text}
					</blockquote>
				{/option:item.text}
			</div>
		</section>

		<section class="row-fluid">
            <div class="span12" style="text-align: center;">
				<a href="#">
					<img src="http://placehold.it/728x90&t=advertisments" alt="Ad-zone" width="780" height="90" />
				</a>
			</div>
		</section>

		<section class="row-fluid">
			<div class="span12">
				<p>
					<a href="{$var|buildurl:'report':'comments'}/{$item.id}">{$lblReportThis}</a>
				</p>
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>