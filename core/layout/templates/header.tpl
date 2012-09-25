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
						{$msgUsersLoggedInAs|sprintf:{$currentUser.name}} |
						<a href="{$var|buildurl:'logout':'users'}">{$lblSignOff}</a>
					</p>
				</div>
			{/option:currentUser}
			{option:!currentUser}
                <a href="#" class="btn btn-inverse facebookRegister">
                    Sign up with Facebook{* @todo locale *}
                </a>
			{/option:!currentUser}
		</div>
	</div>
</div>

