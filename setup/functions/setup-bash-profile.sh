#function to set up .bash_profile
#with environment variables etc


function setupBashProfile
{
  #setup for Ruby
  local RUBY_GEMS_DIR=${DEVCON_USER_HOME}/.gems
  mkdir -p ${RUBY_GEMS_DIR}
  echo "export BUNDLE_PATH=${RUBY_GEMS_DIR}" >> ${DEVCON_USER_HOME}/.bash_profile
 
}