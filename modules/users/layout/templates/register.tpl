{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

	<div id="content" class="container-fluid">
		<section id="{$MODULE}" class="{$ACTION} row-fluid">
			<div class="span12">
				<header class="header buttonHolderRight">
					<h2>{$lblRegister|ucfirst}</h2>
				</header>

				<a href="#" class="btn facebookRegister">
					Facebook
				</a>
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>