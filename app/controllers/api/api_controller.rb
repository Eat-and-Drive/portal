class Api::ApiController < ApplicationController

  skip_before_filter :require_login

end
