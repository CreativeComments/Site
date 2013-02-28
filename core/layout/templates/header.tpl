<div id="header">
	<div class="container">
		<div class="row-fluid">
			<div class="span5">
				<h1>
					<a href="/" rel="home">{$SITE_DEFAULT_TITLE}</a>
				</h1>
			</div>

			<div class="span7">
				<div class="row-fluid">
					<div class="span3">
{*
	Disabled this as there are no multiple languages yet
						<div class="dropdown">
							<a class="dropdown-toggle language" data-toggle="dropdown" href="#">
							<span class="world"></span>
							<span class="link">English</span>
							<span class="icon"></span>
							</a>
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
*}
					</div>
					<div class="span3">
						<div class="dropdown">
							<a class="dropdown-toggle about" data-toggle="dropdown" href="#">
							<span class="about"></span>
							<span class="link">{$lblAbout|ucfirst}</span>
							<span class="icon"></span>
							</a>
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
					<div class="span6">
						{option:currentUser}
							{* @todo link to own page *}
							<a href="#">
								{$currentUser.name}
							</a>
							<div class="avatar">
								<div class="top"></div>
								<img src="https://graph.facebook.com/{$currentUser.facebookId}/picture" />
							</div>
						{/option:currentUser}
						{option:!currentUser}
							<a href="#" class="btn btn-inverse facebookRegister">
								{$lblSignIn|ucfirst}
							</a>
						{/option:!currentUser}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
