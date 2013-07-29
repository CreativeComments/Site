{include:'{$CORE_PATH}/layout/templates/head.tpl'}
{include:'{$CORE_PATH}/layout/templates/header.tpl'}

	<div id="content" class="{$item.emotion}">
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
					<div class="span8 offset1 username">
						<h3>
							{$user.name}
						</h3>
						<time datetime="{$item.createdOn|date:"Y-m-d\TH:i:s"}">{$item.createdOn|timeago}</time>
						<h4>{$item.title}</h4>
					</div>
					<div class="span2">
						<div class="fb-like" data-href="{$SITE_URL}{$var|buildurl:'detail':'comments'}/{$item.id}" data-send="false" data-layout="button_count" data-width="90" data-show-faces="false"></div>
					</div>
				</div>
				<div class="visible-phone mobile alert">
					This Creative Comments can not be viewed on a mobile device. Please visit the link on a desktop computer.
				</div>
				{option:item.text}
					<div class="row-fluid">
						<div class="span10 offset1">
							<div id="textHolder" class="fakeElement">
								{$item.text}
							</div>
						</div>
					</div>
				{/option:item.text}
				<div id="creativeCommentsContent" class="hidden-phone">
					<div id="buttonsLeft">
						<ul>
							<li class="{option:!item.youtube}emptyUiButton{/option:!item.youtube} {option:item.youtube}borderTop{/option:item.youtube}">
								{option:item.youtube}
									<a href="#" class="uiButton toggleYoutube" data-id="youtubeHolder" data-yt-id="{$item.youtube}">
										<span class="youtube"></span>
										<span class="title">Watch movie</span>
									</a>
								{/option:item.youtube}
							</li>
	{*
							<li>
								<a href="#" class="uiButton toggleElement" data-id="pinterestHolder">
									<span class="pinterest"></span>
									<span class="title">Pintrest</span>
								</a>
							</li>
	*}
							<li class="{option:!item.slideshare}emptyUiButton{/option:!item.slideshare} {option:item.slideshare}{option:!item.youtube}borderTop{/option:!item.youtube}{/option:item.slideshare}">
								{option:item.slideshare}
									<a href="#" class="uiButton toggleElement" data-id="slideshareHolder">
										<span class="slideshare"></span>
										<span class="title">View SlideShare</span>
									</a>
								{/option:item.slideshare}
							</li>

							<li class="{option:!item.url}emptyUiButton{/option:!item.url} {option:item.url}{option:!item.slideshare}borderTop{/option:!item.slideshare}{/option:item.url}">
								{option:item.url}
									<a href="{$item.url}" target="_blank" class="uiButton">
										<span class="link"></span>
										<span class="title">View link</span>
									</a>
								{/option:item.url}
							</li>

							<li class="{option:!item.soundcloud}emptyUiButton{/option:!item.soundcloud} {option:item.soundcloud}{option:!item.url}borderTop{/option:!item.url}{/option:item.soundcloud}">
								{option:item.soundcloud}
									<a href="#" class="uiButton toggleSoundcloud" data-id="soundcloudHolder" data-soundcloud-id="{$item.soundcloud}">
										<span class="soundcloud"></span>
										<span class="title">View SoundCloud</span>
									</a>
								{/option:item.soundcloud}
							</li>
						</ul>
					</div>
					<div id="creativeCommentsHolderSite">
						<div class="video">
							{option:item.videoId}
								<div id="flashContent">
								</div>
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
							<li class="{option:!item.dropbox}emptyUiButton{/option:!item.dropbox} {option:item.dropbox}borderTop{/option:item.dropbox}">
								{option:item.dropbox}
									<a href="{$item.dropbox}" target="_blank" class="uiButton">
										<span class="dropbox"></span>
										<span class="title">Dropbox</span>
									</a>
								{/option:item.dropbox}
{*							</li>

							<li>
								<a href="#" class="uiButton toggleElement">
									<span class="pinterest"></span>
									<span class="title">Pintrest</span>
								</a>
							</li>
*}
							<li class="{option:!item.pictureUrl}emptyUiButton{/option:!item.pictureUrl} {option:item.pictureUrl}{option:!item.dropbox}borderTop{/option:!item.dropbox}{/option:item.pictureUrl}">
								{option:item.pictureUrl}
									<a href="#" class="uiButton toggleElement" data-id="pictureHolder">
										<span class="picture"></span>
										<span class="title">Picture</span>
									</a>
								{/option:item.pictureUrl}
							</li>
							<li class="{option:!item.fileUrl}emptyUiButton{/option:!item.fileUrl} {option:item.fileUrl}{option:!item.pictureUrl}borderTop{/option:!item.pictureUrl}{/option:item.fileUrl}">
								{option:item.fileUrl}
									<a href="{$item.fileUrl}" target="_blank" class="uiButton">
										<span class="file"></span>
										<span class="title">{$lblDownload|ucfirst}</span>
									</a>
								{/option:item.fileUrl}
							</li>
						</ul>
					</div>
				</div>
				<div id="creativeCommentsSub" class="row-fluid row-fluid hidden-phone">
					<div class="span10 offset1">
						{option:item.youtube}
							<div id="youtubeHolder" class="element" style="display: none;">
							</div>
						{/option:item.youtube}

						{option:item.slideshare}
							<div id="slideshareHolder" class="element" style="display: none;">
								{$item.slideshare}
							</div>
						{/option:item.slideshare}

						{option:item.soundcloud}
							<div id="soundcloudHolder" class="element" style="display: none;">
							</div>
						{/option:item.soundcloud}

						{option:item.pictureUrl}
							<div id="pictureHolder" class="element" style="display: none;">
								<a href="{$item.pictureUrl}" target="_blank">
									<img src="{$item.pictureUrl}" alt="" width="610" />
								</a>
							</div>
						{/option:item.pictureUrl}
					</div>
				</div>

				<div class="row-fluid">
					<div class="span6 offset1">
						<small class="muted">
							<a href="{$var|buildurl:'report':'comments'}/{$item.id}" class="report">{$lblReportThis}</a>
						</small>
					</div>
					<div class="span4">
						{option:!currentUser}
							<a href="http://creativecomments.cc" class="btn btn-mini signup" style="float: right">Request your account</a></p>
						{/option:!currentUser}
					</div>
				</div>
			</section>
		</div>
	</div>
{include:'{$CORE_PATH}/layout/templates/footer.tpl'}
</body>
</html>