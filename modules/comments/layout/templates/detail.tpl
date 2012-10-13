{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content" class="container-fluid">
		<section id="{$MODULE}" class="{$ACTION} row">
			<div class="span6 well">
				{option:item.text}
					<blockquote>
						{$item.text}
					</blockquote>
				{/option:item.text}
			</div>
		</section>

		<section class="row-fluid">
			<div class="span12">
				<script type="text/javascript">
					<!--
						google_ad_client = "ca-pub-2874679990125867";
						google_ad_slot = "4854500296";
						google_ad_width = 728;
						google_ad_height = 90;
					//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
			</div>
		</section>

		<section class="row-fluid">
			<div class="span12">
				<p>
					<a href="{$var|buildurl:'report':'comments'}/{$item.id}">{$lblReportThis}</a>
				</p>
			</div>
		</section>

		{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
	</div>
</body>
</html>