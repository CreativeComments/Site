{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
		{option:!currentUser}
			<section id="{$MODULE}" class="{$ACTION} lineBottom">
				<div class="container">
					<div class="row-fluid">
						<div class="span7 graphicHolder hidden-phone">
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
							<p class="light">With Creative Comments, you can be most imaginative and post lush comments that include your instant 20” video message, Dropbox&#174; files, Youtube&#174; movies, Slideshare&#174; decks,… whatever helps to bring your point across better.</p>
							<p><a href="http://signup.creativecomments.cc" class="btn btn-large facebookRegister">Sign-in with <strong>Facebook</strong></a></p>
						</div>
					</div>
				</div>
			</section>
		{/option:!currentUser}
		{option:currentUser}
			{option:items}
				<section id="grid" class="container">
					<div class="subMenu">
						<div class="row-fluid menu">
							<div class="span4 title">
								<h3>{$lblMostRecent|ucfirst}</h3>
							</div>
							<div class="span4 category">
		{*
									Disabled for now because there is no such thing as categories
								<p>Sort by category</p>
								<div class="dropdown">
									<a class="dropdown-toggle btn" data-toggle="dropdown" href="#">Commodo Ridic<span class="icon"></span></a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
										<li><a href="#">Lorem</a></li>
										<li><a href="#">Consectetur</a>	</li>
									</ul>
								</div>
		*}
							</div>
							<div class="span4 emotion">
								<p>{$lblShowByEmotion|ucfirst}</p>
								<ul id="emotionFilter">
									<li class="active"><a href="#" class="sad" data-value="sad">{$lblSad|ucfirst}</a></li>
									<li class="active"><a href="#" class="normal" data-value="neutral">{$lblNormal|ucfirst}</a></li>
									<li class="active"><a href="#" class="happy" data-value="happy">{$lblHappy|ucfirst}</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="row-fluid itemGrid">
						{iteration:items}
							<div class="span4 item">
								<div class="videoHolder">
									<a class="video" href="{$var|buildurl:'detail':'comments'}/{$items.id}">
										{option:items.videoId}
											<img src="http://api.nimbb.com/Live/Thumbnail.aspx?key={$NIMB_PUBLIC_KEY}&guid={$items.videoId}" width="278" height="170" />
										{/option:items.videoId}
									</a>
								</div>
								<div class="user {$items.emotion}">
									<div class="avatar">
										<div class="top"></div>
										<img src="https://graph.facebook.com/{$items.user.facebookId}/picture?type=square" width="40" height="40" alt="" />
									</div>
									<div class="content">
										<a href="{$var|buildurl:'detail':'comments'}/{$items.id}">
											{$items.user.name}
										</a>
										<time datetime="{$items.createdOn|date:"Y-m-d\TH:i:s"}">{$items.createdOn|timeago}</time>
									</div>
								</div>
							</div>
						{option:items.newRow}
					</div>
					<div class="row-fluid itemGrid">
							{/option:items.newRow}
						{/iteration:items}
					</div>
				</section>
			{/option:items}
		{/option:currentUser}
	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>