{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
		<section id="{$MODULE}" class="{$ACTION} lineBottom">
			<div class="container">
				<div class="row-fluid">
					<div class="span6 offset3 intro">
						<header>
							<h2>We are still in closed beta</h2>
						</header>
						<p>You require a passcode to complete the registration. We will redirect you to our request page shortly.</p>
						<p><a href="http://signup.creativecomments.cc" class="btn">Redirect now</a></p>

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