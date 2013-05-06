{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}
	<div id="content">
			<section id="team" class="{$ACTION} lineBottom">
				<div class="container">
					<div class="row-fluid">
						<div class="span12 intro">
							<header>
								<blockquote>
									"More an experiment than a company, planning to be a movement rather than a community"
								</blockquote>
								{option:!currentUser}
									<a href="#" class="facebookRegister">
										Care to join?
									</a>
								{/option:!currentUser}
								{option:currentUser}
									<a href="mailto:careers@creativecomments.cc">
										Care to join?
									</a>
								{/option:currentUser}
								<h3>Here is who we are</h3>
							</header>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span3 item">
							<div class="avatarHolder filip">
							</div>
							<h4><a href="http://about.me/filiptack">Filip Tack</a></h4>
							<p>Chief Instigator</p>
						</div>
						<div class="span3 item">
							<div class="avatarHolder peter">
							</div>
							<h4><a href="http://about.me/pgeldhof">Peter Geldhof</a></h4>
							<p>Chief Engager</p>
						</div>
						<div class="span3 item">
							<div class="avatarHolder wanted">
							</div>
							<h4><a href="mailto:careers@creativecomments.cc">Nomen Nescio</a></h4>
							<p>Chief Marketeer</p>
						</div>
						<div class="span3 item">
							<div class="avatarHolder wanted">
							</div>
							<h4><a href="mailto:careers@creativecomments.cc">Nomen Nescio</a></h4>
							<p>Chief Developer</p>
						</div>
					</div>
				</div>
			</section>
			<section id="location">
				<div class="container">
					<div class="row-fluid">
						<div class="span12 intro">
							<header>
								<h3>
									Here is where we are
								</h3>
							</header>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span6 map">
							<iframe width="460" height="200" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.be/maps?f=q&amp;source=s_q&amp;hl=nl&amp;geocode=&amp;q=Hubert+Frere-Orbanlaan+33,+Gent&amp;aq=0&amp;oq=Hubert+Fr%C3%A8re-Orbanlaan+33&amp;sll=51.09623,4.227975&amp;sspn=1.019391,2.738342&amp;ie=UTF8&amp;hq=&amp;hnear=Hubert+Frere-Orbanlaan+33,+Gent+9000+Gent,+Oost-Vlaanderen,+Vlaams+Gewest&amp;ll=51.045949,3.732971&amp;spn=0.001003,0.002674&amp;t=m&amp;z=14&amp;output=embed"></iframe>
						</div>
						<div class="span5 offset1 info">
							<ul>
								<li>
									<strong>Creative Comments Media BVBA</strong>
								</li>
								<li>
									<address>Hubert Frère-Orbanlaan 33</address>
								</li>
								<li>
									<address>9000 Ghent, Belgium</address>
								</li>
								<li>
									<a href="mailto:info@creativecomments.cc">info@creativecomments.cc</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</section>

	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html