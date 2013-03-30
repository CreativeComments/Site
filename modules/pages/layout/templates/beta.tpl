{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
		{option:redirect}
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
		{/option:redirect}
		{option:!redirect}
			<section id="{$MODULE}" class="{$ACTION} lineBottom">
				<div class="container">
					<div class="row-fluid">
						<div class="span6 offset3 intro">
							{option:!correct}
								<header>
									<h2>Welcome to our secret page!</h2>
								</header>
								<p>Welcome to Creative Comments™, an out-of-the-ordinary commenting platform for Facebook&#174;.  We drive a more creative conversation among 1 billion socialnauts.</p>

								{form:beta}
									<div class="control-group{option:txtPasswordError} error{/option:txtPasswordError}">
										<label class="control-label hideText" for="inputPassword">Password</label>
										<div class="controls">
											{$txtPassword} {$txtPasswordError}
										</div>
									</div>

									<div class="control-group">
										<div class="controls">
											<button type="submit" class="btn">Ok, let me in</button>
										</div>
									</div>
								{/form:beta}
							{/option:!correct}
						</div>
					</div>
				</div>
			</section>
		{/option:!redirect}
	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>