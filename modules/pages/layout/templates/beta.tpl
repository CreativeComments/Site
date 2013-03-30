{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
		<section id="{$MODULE}" class="{$ACTION} lineBottom">
			<div class="container">
				<div class="row-fluid">
					<div class="span6 offset3 intro">
						{option:!correct}
							<header>
								<h2>Beta account registration</h2>
							</header>
							<p>Surely this must be your lucky day! Fill out the passcode you received and click the Sign in button.</p>

							{form:beta}
								<div class="form-inline">
									<div class="control-group{option:txtPasswordError} error{/option:txtPasswordError}">
										<label class="control-label hidden" for="inputPassword">Password</label>
										<div class="controls">
											{$txtPassword}
											<button type="submit" class="btn">Sign in</button>
										</div>
										{$txtPasswordError}
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