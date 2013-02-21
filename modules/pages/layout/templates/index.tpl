{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content">
		<section id="{$MODULE}" class="{$ACTION}">
			<div class="container">
				<div class="row-fluid">
					<div class="span7 hidden-phone">
						<div class="graphic">
							<p>
								Hier komt illustratie
							</p>
						</div>
					</div>
					<div class="span5">
						{option:!currentUser}
						<header>
						<h2>
							Spice-up the conversation!
						</h2>
						</header>
						<p>
							Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Sed posuere consectetur est at lobortis. <br><br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis, est non commodo luctus, nisi erat porttitor.
						</p>
						<p>
							<a href="#" class="btn btn-large facebookRegister">
								Sign in with Facebook
							</a>
						</p>
						{/option:!currentUser}
					</div>
				</div>
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>