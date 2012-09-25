{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content" class="container-fluid">
		<section id="{$MODULE}" class="{$ACTION}">
			{option:!currentUser}
				<div class="row-fluid">
					<div class="span12 content">
						<p>
							[uitleg]
						</p>
						<p>
							<a href="#" class="btn btn-large facebookRegister">
								Facebook
							</a>
						</p>
					</div>
				</div>
			{/option:!currentUser}
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>