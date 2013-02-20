<div id="header" class="container-fluid">
	<div class="row-fluid">
		<div class="span8">
			<h1>
				<a href="/" rel="home">
					{$SITE_DEFAULT_TITLE}
				</a>
				<span id="ajaxSpinner">
					{$lblLoading|ucfirst}…
				</span>
			</h1>
		</div>

		<div class="span4">
			{option:currentUser}
				<div id="user">
					<p>
						{* @todo avatar if needed in design *}
						{$msgUsersLoggedInAs|sprintf:{$currentUser.name}}
					</p>
				</div>
			{/option:currentUser}
			{option:!currentUser}
				<a href="#" class="btn btn-inverse facebookRegister">
					{$msgUsersSignUpWithFacebook}
				</a>
			{/option:!currentUser}
		</div>
	</div>
</div>
