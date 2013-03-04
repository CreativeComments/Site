{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
{include:'{$CORE_PATH}/layout/templates/nav.tpl'}

	<div id="content">
		<div class="container">
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
		</div>
	</div>
	{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>