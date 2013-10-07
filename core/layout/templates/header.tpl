<div id="header">
	<div class="container">
		<div class="row-fluid">
			<div class="span5">
				<h1>
					<a href="{$var|buildurl:'index':'pages'}" rel="home">{$SITE_DEFAULT_TITLE}</a>
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
							<span class="link">{$lblAboutUs|ucfirst}</span>
							<span class="icon"></span>
							</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<li><a href="{$var|buildurl:'team':'pages'}">Our team</a></li>
								<li><a href="{$var|buildurl:'terms-of-service':'pages'}">Terms of service</a></li>
								<li><a href="{$var|buildurl:'privacy-policy':'pages'}">Privacy policy</a></li>
							</ul>
						</div>
					</div>
					<div class="span6">
						{option:currentUser}
							<a href="{$var|buildurl:'dashboard':'users'}">
								{$currentUser.name}
							</a>
							<div class="avatar">
								<div class="top"></div>
								<img src="https://graph.facebook.com/{$currentUser.facebookId}/picture?type=square" width="40" height="40" alt="" />
							</div>
							<a href="#" class="facebookSignOff">
								{$lblSignOff}
							</a>
						{/option:currentUser}
						{option:!currentUser}
                            <div class="dropdown">
                                <a class="dropdown-toggle about" data-toggle="dropdown" href="#">
                                    <span class="link">{$lblSignIn|ucfirst}</span>
                                    <div class="avatar">
                                        <div class="top"></div>
                                    </div>
                                </a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                    <li><a href="#" class="twitterRegister">{$lblWith} Twitter</a></li>
                                    <li><a href="#" class="facebookRegister">{$lblWith} Facebook</a></li>
                                </ul>
                            </div>
						{/option:!currentUser}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
