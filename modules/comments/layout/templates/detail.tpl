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
						<!-- @todo tijs include username -->
						<h3>
							Username
						</h3>
						<!-- @todo tijs include date -->
						<time>
							12.06.2013
						</time>
					</div>
				</div>
				<!-- @todo tijs message for mobile -->
				<div class="visible-phone mobile">
					<p>
						This Creative Comments can not be viewed on a mobile device. Please visit the link on a desktop computer.
					</p>
				</div>
				<div id="creativeCommentsContent" class="hidden-phone">
					<div id="buttonsLeft">
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
							{*option:item.pinterest*}
								<a href="{$item.pinterest}" class="uiButton toggleElement">
									<span class="pinterest"></span>
									<span class="title">Pintrest</span>
								</a>
							{*/option:item.pinterest*}
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
					<div id="creativeCommentsHolder">

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
					<div id="buttonsRight">
					<ul>
						<li>
							<!-- @todo tys -->
							{*option:item.evernote*}
								<a href="{$item.evernote}" class="uiButton toggleElement">
									<span class="evernote"></span>
									<span class="title">Evernote</span>
								</a>
							{*/option:item.evernote*}
						</li>
						<li>
							<!-- @todo tys -->
							{*option:item.dropbox*}
								<a href="{$item.dropbox}" class="uiButton toggleElement">
									<span class="dropbox"></span>
									<span class="title">Dropbox</span>
								</a>
							{*/option:item.dropbox*}
						</li>
						<li>
							<!-- @todo tys -->
							{*option:item.pinterest*}
								<a href="{$item.pinterest}" class="uiButton toggleElement">
									<span class="pinterest"></span>
									<span class="title">Pintrest</span> 
								</a>
							{*/option:item.pinterest*}
						</li>
						<li>
							<!-- @todo tys -->
							{*option:item.picture*}
								<a href="{$item.picture}" class="uiButton toggleElement">
									<span class="picture"></span>
									<span class="title">Picture</span>
								</a>
							{*/option:item.picture*}
						</li>
						<li>
							<!-- @todo tys -->
							{*option:item.file*}
								<a href="{$item.fileUrl}" class="uiButton toggleElement">
									<span class="file"></span>
									<span class="title">{$lblDownload|ucfirst}</span>
								</a>
							{*/option:item.file*}
						</li>
					</ul>
				</div>
				</div>
				<div class="row-fluid content row-fluid hidden-phone">
					<div class="span10 offset1">
						<p>
							Hier komt tekst
						</p>
					</div>
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