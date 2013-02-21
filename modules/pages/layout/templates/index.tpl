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
		<section id="grid" class="container">
			<div class="subMenu">
				<div class="row-fluid">
					<div class="span3">
						<h3>
							All comments
						</h3>
					</div>
					<div class="span3 offset2">
						<p>
							Sort by category
							<a href="#" class="btn">
								All
							</a>
						</p>
					</div>
					<div class="span4">
						<p>
							Sort by emotion
						</p>
						<ul>
							<li>
								<a href="#">
									sad
								</a>
							</li>
							<li>
								<a href="#">
									glad
								</a>
							</li>
							<li>
								<a href="#">
									happy
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row-fluid itemGrid">
				<div class="span4 item">
					<div class="videoHolder">
						<div class="video">
							<p>
								@todo Tys video
							</p>
						</div>
					</div>
					<header>
						<h4>
							Ullamcorper Ornare Fringilla
						</h4>
					</header>
					<div class="user">
						<div class="avatar">
							<div class="top"></div>
							<!-- @todo avatar hier plaatsen -->
							<img src="https://si0.twimg.com/profile_images/1354981961/icon_08_01.png" alt="avatar">
						</div>
						<div class="content">
							<a href="#">
								Niels De Paepe
							</a>
							<time>
								12 minutes ago
							</time>
						</div>
					</div>
				</div>
				<div class="span4 item">
					<div class="videoHolder">
						<div class="video">
							<p>
								@todo Tys video
							</p>
						</div>
					</div>
					<header>
						<h4>
							Ullamcorper Ornare Fringilla
						</h4>
					</header>
					<div class="user">
						<div class="avatar">
							<div class="top"></div>
							<!-- @todo avatar hier plaatsen -->
							<img src="https://si0.twimg.com/profile_images/1354981961/icon_08_01.png" alt="avatar">
						</div>
						<div class="content">
							<a href="#">
								Niels De Paepe
							</a>
							<time>
								12 minutes ago
							</time>
						</div>
					</div>
				</div>
				<div class="span4 item">
					<div class="videoHolder">
						<div class="video">
							<p>
								@todo Tys video
							</p>
						</div>
					</div>
					<header>
						<h4>
							Ullamcorper Ornare Fringilla
						</h4>
					</header>
					<div class="user">
						<div class="avatar">
							<div class="top"></div>
							<!-- @todo avatar hier plaatsen -->
						</div>
						<div class="content">
							<a href="#">
								Niels De Paepe
							</a>
							<time>
								12 minutes ago
							</time>
						</div>
					</div>
				</div>
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>