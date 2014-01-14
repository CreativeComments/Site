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
					<li><a href="{$var|buildurl:'business':'pages'}">For business</a></li>
					<li><a href="http://creativecomments.uservoice.com/knowledgebase">Knowledge base</a></li>
				</ul>
			</div>

			<div class="span3 list">
				<h5>{$lblAboutUs|ucfirst}</h5>
				<ul>
					<li><a href="{$var|buildurl:'team':'pages'}">Our team</a></li>
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
		<div class="row-fluid madeBy">
			<div class="span8">
				<p>© {$timestamp|formatdate:'Y'} Creative Comments Media. All rights reserved.</p>
			</div>
			<div class="span4 sumo">
				<p><a href="http://www.sumocoders.be/?utm_source=creative_comments&amp;utm_medium=credits&amp;utm_campaign=client_sites" rel="external">SumoCoders</a> によって供給</p>
			</div>
		</div>
	</div>
</footer>
{include:'{$CORE_PATH}/layout/templates/dialogs.tpl'}

<!-- uservoice -->
<script type="text/javascript">
	var uvOptions = {};
	(function() {
		var uv = document.createElement('script'); uv.type = 'text/javascript'; uv.async = true;
		uv.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'widget.uservoice.com/L5m3jOM3XfG9t40AQo8dg.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(uv, s);
	})();
</script>