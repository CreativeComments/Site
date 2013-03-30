{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
		<section id="business" class="{$ACTION}">
			<div class="container">
				<div class="row-fluid lineBottom">
					<div class="span7 graphicHolder hidden-phone">
						<div class="graphic business">
						</div>
					</div>
					<div class="span5 intro">
						<header>
							<h2>For business</h2>
						</header>
						<p>We are working to advance Creative Comments and drive a more creative conversation between community managers and over 1 billion socialnauts!</p>
						<p class="light">
						We learned that community managers find existing Facebook commenting options too limiting.  With Creative Comments for Businesses™, community managers will be able to post more complete comments that include an instant 20” video message, Dropbox&#174; files (think “user guides”), Youtube&#174; movies (think “DIY videos”), Slideshare® decks (think “company pitches”), etc. whatever helps to better service your audience.
						</p>
					</div>
				</div>
				<div class="row-fluid info">
					<div class="span6">
						<p>
							Creative Comments is free for personal accounts.  Professional accounts will get a more feature rich solution and we are working on a price point.  In the meantime, may we suggest that you already register your personal account?
						</p>
					</div>
					<div class="span5 offset1">
						{option:!currentUser}
							<a href="#" class="btn btn-large facebookRegister">Sign-in with <strong>Facebook</strong></a>
						{/option:!currentUser}
						{option:currentUser}
							<div class="alert alert-success">
								Kudos! You are already part of the community!
							</div>
						{/option:currentUser}
					</div>
				</div>
			</div>
		</section>
	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>