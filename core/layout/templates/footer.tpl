<footer id="footer">
	<div class="container">
		<div class="row-fluid">
			<div class="span2 hidden-phone">
				<div class="logo">
					Creative Comments
				</div>
			</div>

			<div class="span3 list">
				<h5>{$lblGetStarted|ucfirst}</h5>
				<ul>
					<li><a href="{$var|buildurl:'plugins':'pages'}">{$msgPagesDownloadPlugin}</a></li>
				</ul>
			</div>

			<div class="span3 list">
				<h5>{$lblAboutUs|ucfirst}</h5>
				<ul>
					<li><a href="{$var|buildurl:'terms-of-service':'pages'}">Terms of service</a></li>
					<li><a href="{$var|buildurl:'privacy-policy':'pages'}">Privacy policy</a></li>
				</ul>
			</div>

			<div class="span4 social">
				<ul>
					<li><a href="https://plus.google.com/106412636178651998866" class="google">Google+</a></li>
					<li><a href="http://www.facebook.com/CreativeComments" class="facebook">Facebook</a></li>
					<li><a href="https://twitter.com/c_comments" class="twitter">Twitter</a></li>
				</ul>
				<p>
					Follow us elsewhere
				</p>
			</div>
		</div>
	</div>
</footer>
{include:'{$CORE_PATH}/layout/templates/dialogs.tpl'}
