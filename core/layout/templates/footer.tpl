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
			<div class="span4">
				<p>Webdesign by <a href="http://www.sumocoders.be/?utm_source=creative_comments&amp;utm_medium=credits&amp;utm_campaign=client_sites" rel="external">SumoCoders</a>
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

<!-- Google Analytics -->
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-35168025-1']);
	_gaq.push(['_trackPageview']);
	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
</script>