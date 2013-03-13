{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content">
		<div class="container">
			{option:report}
				<div class="row-fluid">
	                <div class="span12 alert alert-success">
						{$report}
	                </div>
				</div>
			{/option:report}
	
			<section id="{$MODULE}" class="{$ACTION} row-fluid">
				<div id="buttonsLeft" class="span1">
					<ul>
						<li>
							<!-- @todo tys -->
							{*option:item.text*}
								<a href="#" class="uiButton toggleElement">
										{*$item.text*}
										<span class="text"></span><span class="title">View text</span>
								</a>
							{*/option:item.text*}
						</li>
						<li>
							<!-- @todo tys -->
							{*option:item.youtube*}
								<a href="{$item.youtube}" class="uiButton toggleElement">
									<span class="youtube"></span>
									<span class="title">Watch movie</span>
								</a>
							{*/option:item.youtube*}
						</li>
						<li>
							<!-- @todo tys -->
							{*option:item.pintrest*}
								<a href="{$item.pintrest}" class="uiButton toggleElement">
									<span class="pinterest"></span>
									<span class="title">Pintrest</span>
								</a>
							{*/option:item.pintrest*}
						</li>
						<li>
							<!-- @todo tys -->
							{*option:item.slideshare*}
								<a href="{$item.slideshare}" class="uiButton toggleElement">
									<span class="slideshare"></span>
									<span class="title">View slide</span>
								</a>
							{*/option:item.slideshare*}
						</li>
						<li>
							<!-- @todo tys -->
							{*option:item.url*}
								<a href="{$item.url}" class="uiButton toggleElement">
									<span class="link"></span>
									<span class="title">View link</span>
								</a>
							{*/option:item.url*}
						</li>
					</ul>
				</div>
				<div id="creativeCommentsHolder" class="span10">

					{option:item.videoId}
						<div class="video">
							<object id="videoplayer" width="600" height="450">
								<param name="movie" value="http://player.nimbb.com/nimbb.swf?guid={$item.videoId}&lang=en&autoplay=1" />
								<param name="allowScriptAccess" value="always" />
								<embed name="nimbb" src="http://player.nimbb.com/nimbb.swf?guid={$item.videoId}&lang=en&autoplay=1" width="320" height="240" allowScriptAccess="always" type="application/x-shockwave-flash">
								</embed>
							</object>
						</div>
					{/option:item.videoId}
				</div>
				<div class="span1">
					<ul>
						<li>
							{option:item.dropbox}
								<a href="#" class="uiButton toggleElement">
									<a href="{$item.dropbox}">{$item.dropbox}</a>
								</a>
							{/option:item.dropbox}
						</li>
						<li>
							{option:item.file}
								<div class="well">
									<a href="{$item.fileUrl}">{$lblDownload|ucfirst}</a>
								</div>
							{/option:item.file}
						</li>
					</ul>
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
		</div>
	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>