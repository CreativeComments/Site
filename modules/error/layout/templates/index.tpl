{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
<!-- {include:'{$CORE_PATH}/layout/templates/nav.tpl'} -->

	<div id="content">
			<section id="{$MODULE}" class="{$ACTION} error lineBottom">
			<div class="container">
				<div class="row-fluid">
					<div class="span12">
							<div class="title">
								<h3>{$error}</h3>
							</div>
					</div>
				</div>
			</div>
			</section>
			<div id="erroricon"></div>
	</div>
	{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>