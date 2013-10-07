<?php

use \TijsVerkoyen\Twitter\Twitter;

/**
 * UsersIndex
 *
 * @package        users
 * @subpackage     index
 *
 * @author         Tijs Verkoyen <tijs@sumocoders.be>
 * @since          1.0
 */
class UsersLoginWithTwitter extends SiteBaseAction
{
    /**
     * Form instance
     *
     * @var    SiteForm
     */
    private $frm;

    /**
     * Execute the action
     *
     * @return void
     */
    public function execute()
    {
        // redirect if a user is already logged in
        if ($this->currentUser != null) {
            // grab the url if provided
            $url = SpoonFilter::getGetValue('redirect', null, $this->url->buildUrl('dashboard', 'users'));

            // add a report
            if (substr_count($url, '?') > 0) {
                $url .= '&report=logged-in';
            } else {
                $url .= '?report=logged-in';
            }

            // redirect
            $this->redirect($url);
        }

        // do the oAuth dance
        $twitter  = new Twitter(TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET);
        $response = $twitter->oAuthRequestToken(
            SITE_URL . $this->url->buildUrl('login-with-twitter', 'users')
        );

        $oAuthToken    = SpoonFilter::getGetValue('oauth_token', null, '');
        $oAuthVerifier = SpoonFilter::getGetValue('oauth_verifier', null, '');
        if ($oAuthToken == '') {
            $response = $twitter->oAuthAuthorize($response['oauth_token']);
        }
        $response = $twitter->oAuthAccessToken($oAuthToken, $oAuthVerifier);

        $user = User::getByTwitterId($response['user_id']);
        $data = $twitter->usersShow($response['user_id']);

        if ($user === false) {
            // create a new user
            $user              = new User();
            $user->name        = $data['name'];
            $user->email       = $data['id'] . '@twitter.com';
            $user->type        = 'user';
            $user->secret      = md5(uniqid());
            $user->rawPassword = md5(uniqid());
            $user->twitterId   = $data['id'];

            // store the user
            $user->save();

            $user->setSetting('avatar', $data['profile_image_url_https']);
        } else {
            // save changes if there are changes
            $changed = false;

            if ($user->name != $data['name']) {
                $changed    = true;
                $user->name = $data['name'];
            }
            if ($user->email != $data['id'] . '@twitter.com') {
                $changed     = true;
                $user->email = $data['id'] . '@twitter.com';
            }

            if ($user->getSetting('avatar') != $data['profile_image_url_https']) {
                $changed = true;
                $user->setSetting('avatar', $data['profile_image_url_https']);
            }

            // store the user if needed
            if ($changed) {
                $user->save();
            }
        }

        // login the user
        Authentication::login($user);

        // recall
        Authentication::getLoggedInUser();

        // grab the url if provided
        $url = SpoonFilter::getGetValue('redirect', null, $this->url->buildUrl('dashboard', 'users'));

        // add a report
        if (substr_count($url, '?') > 0) {
            $url .= '&report=logged-in';
        } else {
            $url .= '?report=logged-in';
        }

        // redirect
        $this->redirect($url);
    }
}
