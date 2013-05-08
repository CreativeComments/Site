{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
		<section id="{$MODULE}" class="{$ACTION}">
			<div class="container">
				<div class="row-fluid">
					<div class="span10 offset1 intro">
						{option:!correct}
							<header>
								<h2>Beta account registration</h2>
							</header>
							<p>Surely this must be your lucky day!<br> Fill out the passcode you received and click the Sign-in with Facebook button.</p>

							{form:beta}
								<div class="form-inline">
									<div class="control-group{option:txtPasswordError} error{/option:txtPasswordError}">
										<label class="control-label hidden" for="inputPassword">Password</label>
											<div class="controls row-fluid">
												<div class="span6 form">
												{$txtPassword}
												</div>
												<div class="span6">
												<a id="betaAccess" class="btn facebookRegisterLayout btn-large">Sign-in with Facebook</a>
												</div>
											</div>
											{$txtPasswordError}
									</div>
									</div>
								</div>
							{/form:beta}
						{/option:!correct}
					</div>
				</div>
			</div>
		</section>
	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>