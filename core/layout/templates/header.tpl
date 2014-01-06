<div id="header">
    <div class="container">
        <div class="row-fluid">
            <div class="span4 logoHeader">
                <h1>
                    <a href="{$var|buildurl:'index':'pages'}" rel="home">{$SITE_DEFAULT_TITLE}</a>
                </h1>
            </div>

            <div class="span8 headerMenu">
                <div class="row-fluid">
                    <div class="span4">
                        {option:currentUser}
                            <a href="{$var|buildurl:'plugins':'pages'}" class="btn">{lblCreateNow}</a>
                        {/option:currentUser}
                        {*
                            Disabled this as there are no multiple languages yet
                                                <div class="dropdown">
                                                    <a class="dropdown-toggle language" data-toggle="dropdown" href="#">
                                                    <span class="world"></span>
                                                    <span class="link">English</span>
                                                    <span class="icon"></span>
                                                    </a>
                                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                                        <li>
                                                            <a href="#">Lorem</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">Vulputate</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">Dolor</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">Consectetur</a>
                                                        </li>
                                                    </ul>
                                                </div>
                        *}
                    </div>
                    <div class="span3 dropdownMenu offset1">
                        <div class="dropdown">
                            <a class="dropdown-toggle about" data-toggle="dropdown" href="#">
                                <span class="about"></span>
                                <span class="link">{$lblAboutUs|ucfirst}</span>
                                <span class="icon"></span>
                            </a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                <li>
                                    <a href="http://creativecomments.uservoice.com/knowledgebase/topics/41499-how-to)">How to...</a>
                                </li>
                                <li><a href="{$var|buildurl:'team':'pages'}">Our team</a></li>
                                <li><a href="{$var|buildurl:'terms-of-service':'pages'}">Terms of service</a></li>
                                <li><a href="{$var|buildurl:'privacy-policy':'pages'}">Privacy policy</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="span4 Userblock {option:currentUser}loggedIn{/option:currentUser}">
                        {option:currentUser}
                            <div class="userLoggedIn">
                            <a href="{$var|buildurl:'dashboard':'users'}">
                                {$currentUser.name}
                            </a>
                            <a href="#" class="facebookSignOff">
                                {$lblSignOff}
                            </a>
                            </div>
                            <div class="avatar">
                                <div class="top"></div>
                                <img src="{$currentUser.settings.avatar}" width="40" height="40" alt="" />
                            </div>
                        {/option:currentUser}
                        {option:!currentUser}
                            <div class="dropdown user">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <span class="link">{$lblSignIn|ucfirst}</span>

                                    <div class="avatar">
                                        <div class="top"></div>
                                    </div>
                                </a>
                                <ul class="dropdown-menu loginBtns" role="menu" aria-labelledby="dLabel">
                                    <li>
                                        <a href="{$var|buildurl:'login-with-twitter':'users'}" class="twitterRegister btn">{$lblWith} Twitter</a>
                                    </li>
                                    <li><a href="#" class="facebookRegister btn">{$lblWith} Facebook</a></li>
                                </ul>
                            </div>
                        {/option:!currentUser}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
