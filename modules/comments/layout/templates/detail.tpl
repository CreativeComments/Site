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

			<section id="{$MODULE}" class="{$ACTION}">
				<div class="row-fluid header">
					<div class="span10 offset1 username">
						<h3>
							{$user.name}
						</h3>
						<time datetime="{$item.createdOn|date:"Y-m-d\TH:i:s"}">{$item.createdOn|timeago}</time>
					</div>
				</div>
				<div class="visible-phone mobile alert">
					This Creative Comments can not be viewed on a mobile device. Please visit the link on a desktop computer.
				</div>
				<div id="creativeCommentsContent" class="hidden-phone">
					<div id="buttonsLeft">
						<ul>
							{option:item.text}
								<li>
									<a href="#" class="uiButton toggleElement" data-id="textHolder">
										<span class="text"></span><span class="title">View text</span>
									</a>
								</li>
							{/option:item.text}
							{option:item.youtube}
								<li>
									<a href="#" class="uiButton toggleYoutube" data-id="youtubeHolder" data-yt-id="{$item.youtube}">
										<span class="youtube"></span>
										<span class="title">Watch movie</span>
									</a>
								</li>
							{/option:item.youtube}
	{*
							<li>
								<a href="#" class="uiButton toggleElement" data-id="pinterestHolder">
									<span class="pinterest"></span>
									<span class="title">Pintrest</span>
								</a>
							</li>
	*}
							{option:item.slideshare}
								<li>
									<a href="#" class="uiButton toggleElement" data-id="slideshareHolder">
										<span class="slideshare"></span>
										<span class="title">View slide</span>
									</a>
								</li>
							{/option:item.slideshare}

							{option:item.url}
								<li>
									<a href="{$item.url}" target="_blank" class="uiButton">
										<span class="link"></span>
										<span class="title">View link</span>
									</a>
								</li>
							{/option:item.url}
						</ul>
					</div>
					<div id="creativeCommentsHolderSite">
						<div class="video">
							{option:item.videoId}
								<iframe id="videoRecorderHolder" src="/en/api/player/{$item.id}" width="620" height="330" border="0"></iframe>
							{/option:item.videoId}
						</div>
					</div>
					<div id="buttonsRight">
						<ul>
{*
							<li>
								<a href="#" class="uiButton toggleElement" data-id="evernoteHolder">
									<span class="evernote"></span>
									<span class="title">Evernote</span>
								</a>
							</li>
*}
							{option:item.dropbox}
								<li>
									<a href="{$item.dropbox}" target="_blank" class="uiButton">
										<span class="dropbox"></span>
										<span class="title">Dropbox</span>
									</a>
								</li>
							{/option:item.dropbox}
{*
							<li>
								<a href="#" class="uiButton toggleElement">
									<span class="pinterest"></span>
									<span class="title">Pintrest</span>
								</a>
							</li>
*}
							{option:item.pictureUrl}
								<li>
									<a href="#" class="uiButton toggleElement" data-id="pictureHolder">
										<span class="picture"></span>
										<span class="title">Picture</span>
									</a>
								</li>
							{/option:item.pictureUrl}
							{option:item.fileUrl}
								<li>
									<a href="{$item.fileUrl}" target="_blank" class="uiButton">
										<span class="file"></span>
										<span class="title">{$lblDownload|ucfirst}</span>
									</a>
								</li>
							{/option:item.fileUrl}
						</ul>
					</div>
				</div>
				<div id="creativeCommentsSub" class="row-fluid row-fluid hidden-phone">
					<div class="span10 offset1">
						{option:item.text}
							<div id="textHolder" class="element" style="display: none;">
								{$item.text}
							</div>
						{/option:item.text}

						{option:item.youtube}
							<div id="youtubeHolder" class="element" style="display: none;">
							</div>
						{/option:item.youtube}

						{option:item.slideshare}
							<div id="slideshareHolder" class="element" style="display: none;">
								{$item.slideshare}
							</div>
						{/option:item.slideshare}

						{option:item.pictureUrl}
							<div id="pictureHolder" class="element" style="display: none;">
								<a href="{$item.pictureUrl}" target="_blank">
									<img src="{$item.pictureUrl}" alt="" width="610" />
								</a>
							</div>
						{/option:item.pictureUrl}
					</div>
				</div>
			</section>

			<section class="row-fluid report">
				<div class="span12">
					{option:!currentUser}<p><a href="http://creativecomments.cc" class="btn signup">Request your account</a></p>{/option:!currentUser}
					<p><a href="{$var|buildurl:'report':'comments'}/{$item.id}">{$lblReportThis}</a></p>
				</div>
			</section>

			<section class="row-fluid">
	            <div class="span12" style="text-align: center;">
					<script type="text/javascript"><!--
						google_ad_client = "ca-pub-2874679990125867";
						/* Creative Comments - below comment */
						google_ad_slot = "3583138376";
						google_ad_width = 728;
						google_ad_height = 90;
						//-->
					</script>
					<script type="text/javascript"
						src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
					</script>
				</div>
			</section>
		</div>
	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>