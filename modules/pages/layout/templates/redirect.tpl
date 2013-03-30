{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
		<section id="{$MODULE}" class="{$ACTION} lineBottom">
			<div class="container">
				<div class="row-fluid">
					<div class="span6 offset3 intro">
						<header>
							<h2>We are in Beta!</h2>
						</header>
						<p>For now you need an invite. You will be redirected in an instant to the invite-page. Or if you can't wait use the button below.</p>
						<p><a href="http://signup.creativecomments.cc" class="btn">Request an invite</a></p>

						<script>
							setTimeout(function() {
								document.location = 'http://signup.creativecomments.cc';
							}, 5000);
						</script>

					</div>
				</div>
			</div>
		</section>
	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>