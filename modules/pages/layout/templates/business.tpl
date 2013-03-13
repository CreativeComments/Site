{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
		{option:!currentUser}
			<section id="{$MODULE}" class="{$ACTION} lineBottom">
				<div class="container">
					<div class="row-fluid">
						<div class="span7 hidden-phone">
							<div class="graphic">
							</div>
						</div>
						<div class="span5 intro">
							<header>
								<h2>For business</h2>
							</header>
							<p>We are working to advance Creative Comments and drive a more creative conversation between community managers and over 1 billion socialnauts!</p>
							<p>
							We learned that community managers find existing Facebook commenting options too limiting.  With Creative Comments for Businesses™, community managers will be able to post more complete comments that include an instant 20” video message, Dropbox&#174; files (think “user guides”), Youtube&#174; movies (think “DIY videos”), Slideshare® decks (think “company pitches”), etc. whatever helps to better service your audience.
							</p>
						</div>
					</div>
				</div>
			</section>
		{/option:!currentUser}
		<section class="getStarted">
			<div class="container">
				<div class="row-fluid">
					<div class="span7">
						<p>
							Creative Comments is free for personal accounts.  Professional accounts will get a more feature rich solution and we are working on a price point.  In the meantime, may we suggest that you already register your personal account?
						</p>
					</div>
					<div class="span4 offset1">
						<a href="#" class="btn btn-large facebookRegister">Request your <strong>account</strong></a>
					</div>
				</div>
			</div>
		</section>
	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>