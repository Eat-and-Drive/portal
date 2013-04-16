class Api::LoginController < Api::ApiController

  def new
    if user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
      respond_to do |format|
        format.json { render :json => user }
        format.xml  { render :xml  => user }
      end
    else
      render :nothing => true, :status => :unprocessable_entity
    end
  end

end
