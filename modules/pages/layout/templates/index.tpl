{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
		{option:!currentUser}
			<section id="{$MODULE}" class="{$ACTION}">
				<div class="container">
					<div class="row-fluid">
						<div class="span7 hidden-phone">
							<div class="graphic">
								<a href="#">
									<!-- @todo link naar creative comment -->
									Creative comment
								</a>
							</div>
						</div>
						<div class="span5 intro">
							<header>
								<h2>Spice-up the conversation!</h2>
							</header>
							<p>Welcome to Creative Comments™, an out-of-the-ordinary commenting platform for Facebook&#174;.  We drive a more creative conversation among 1 billion socialnauts.</p>
							<p>With Creative Comments, you can be most imaginative and post lush comments that include your instant 20” video message, Dropbox&#174; files, Youtube&#174; movies, Slideshare&#174; decks,… whatever helps to bring your point across better.</p>
							<p><a href="#" class="btn btn-large facebookRegister">Sign in with <strong>Facebook</strong></a></p>
						</div>
					</div>
				</div>
			</section>
		{/option:!currentUser}
		<section id="grid" class="container">
			<div class="subMenu">
				<div class="row-fluid menu">
					<div class="span4 title">
						<h3>
							All comments
						</h3>
					</div>
					<div class="span4 category">
						<p>
							Sort by category
						</p>
						<div class="dropdown">
							<a class="dropdown-toggle btn" data-toggle="dropdown" href="#">Commodo Ridic<span class="icon"></span></a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<li>
									<a href="#">Lorem</a>
								</li>
								<li>
									<a href="#">Vulputate</a>
								</li>
								<li>
									<a href="#">Dolor</a>
								</li>
								<li>
									<a href="#">Consectetur</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="span4 emotion">
						<p>
							Sort by emotion
						</p>
						<ul>
							<li>
								<a href="#" class="sad">
									sad
								</a>
							</li>
							<li class="active">
								<a href="#" class="normal">
									normal
								</a>
							</li>
							<li>
								<a href="#" class="happy">
									happy
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- @todo tys drie items per row-fluid -->
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
						<!-- @todo tys add class for emotion icon -->
					<div class="user sad">
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
					<!-- @todo tys add class for emotion icon -->
					<div class="user happy">
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
					<!-- @todo tys add class for emotion icon -->
					<div class="user normal">
						<div class="avatar">
							<div class="top"></div>
							<!-- @todo avatar hier plaatsen -->
						</div>
						<div class="content">
							<a href="#">
								Niels De Paepe
							</a>
							<!-- @todo tys correcte tijd toevoegen in time tag -->
							<time>
								12 minutes ago
							</time>
						</div>
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
					<!-- @todo tys add class for emotion icon -->
					<div class="user sad">
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
					<!-- @todo tys add class for emotion icon -->
					<div class="user normal">
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
				<div class="span4 ads">
					<div class="addBlock">
						<a href="#">
							<img src="http://storage.googleapis.com/support-kms-prod/SNP_2665173_en_v0" alt="add">
						</a>
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
					<!-- @todo tys add class for emotion icon -->
					<div class="user happy">
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
					<!-- @todo tys add class for emotion icon -->
					<div class="user sad">
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
					<!-- @todo tys add class for emotion icon -->
					<div class="user normal">
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