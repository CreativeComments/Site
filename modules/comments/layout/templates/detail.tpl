{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content" class="container-fluid">
		{option:report}
			<div class="row-fluid">
                <div class="span12 alert alert-success">
					{$report}
                </div>
			</div>
		{/option:report}

		<section id="{$MODULE}" class="{$ACTION} row-fluid">
			<div class="span12">
				{option:item.videoId}
					<div class="well">
						<object id="videoplayer" width="600" height="450">
							<param name="movie" value="http://player.nimbb.com/nimbb.swf?guid={$item.videoId}&lang=en&autoplay=1" />
							<param name="allowScriptAccess" value="always" />
							<embed name="nimbb" src="http://player.nimbb.com/nimbb.swf?guid={$item.videoId}&lang=en&autoplay=1" width="320" height="240" allowScriptAccess="always" type="application/x-shockwave-flash">
							</embed>
						</object>
					</div>
				{/option:item.videoId}
				{option:item.text}
					<div class="well">
						<blockquote>
							{$item.text}
						</blockquote>
					</div>
				{/option:item.text}
				{option:item.youtube}
					<div class="well">
						{$item.youtube}
					</div>
				{/option:item.youtube}
				{option:item.slideshare}
					<div class="well">
						{$item.slideshare}
					</div>
				{/option:item.slideshare}
			</div>
		</section>

		<section class="row-fluid">
            <div class="span12" style="text-align: center;">
				<a href="#">
					<img src="http://placehold.it/728x90&t=advertisments" alt="Ad-zone" width="780" height="90" />
				</a>
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