function Nimbb_videoSaved(idPlayer)
{
	CC.instance.video.saved(document.getElementById(idPlayer).getGuid());
}

function Nimbb_recordingStopped(idPlayer)
{
	document.getElementById(idPlayer).saveVideo();
}

function Nimbb_stateChanged(idPlayer, state)
{
	CC.instance.video.stateChange(state);
}

