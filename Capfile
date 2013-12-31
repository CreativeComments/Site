load "deploy" if respond_to?(:namespace) # cap2 differentiator

# development information
set :client,  "tmc"					# eg: "dev"
set :project, "creativecomments"	# eg: "site"

# production information, ignore these items during development
set :production_url, "creativecomments.sumocoders.be"				# eg: "http://fork.sumocoders.be"
set :production_account, "cc"		# eg: "sumocoders"
set :production_hostname, "176.58.126.252"	# eg: "web01.crsolutions.be"
set :production_document_root, "/home/cc/creativecomments"	# eg: "/home/#{production_account}/#{production_url.gsub("http://","")}"
set :production_db, "creativecomments"		# eg: "sumocoders_site"
set :production_errbit_api_key, "af877688600f52016935c4339acb2e9a"	# eg: "7cb0894de51936c39d86b4f2ab4713f2"

# repo information
set :repository, "git@github.com:CreativeComments/Site.git"		# eg: "git@github.com:sumocoders/forkcms.git"

# stages
set :stages, %w{production staging}
set :default_stage, "staging"
set :stage_dir, "deployment"

require "capistrano/ext/multistage"
require "forkcms_deploy"
require "forkcms_deploy/defaults"
require "sumodev_deploy"
load "./deployment/overwrites"

# compile sass on deploy
after 'deploy:update_code', 'assets:precompile'
