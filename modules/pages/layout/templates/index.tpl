{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content">
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
								Sign in with <strong>Facebook</strong>
							</a>
						</p>
						{/option:!currentUser}
					</div>
				</div>
			</div>
		</section>
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
	
	<script type="text/javascript">
  var uvOptions = {};
  (function() {
    var uv = document.createElement('script'); uv.type = 'text/javascript'; uv.async = true;
    uv.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'widget.uservoice.com/L5m3jOM3XfG9t40AQo8dg.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(uv, s);
  })();
</script>
</body>
</html>