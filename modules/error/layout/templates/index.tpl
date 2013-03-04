{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

	<div id="content" class="container">
		<section id="{$MODULE}" class="{$ACTION} row-fluid">
			<div class="span12">
				<div class="alert alert-error">
					{$error}
				</div>
			</div>
		</section>
	</div>
	{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>