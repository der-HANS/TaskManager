class Web::SessionsController < Web::ApplicationController
  def new
    @session = SessionForm.new
  end

  def create
    @session = SessionForm.new(session_params)

    if @session.valid?
      sign_in(@session.user)
      redirect_to(:board)
    else
      render(:new)
    end
  end

  def destroy
    sign_out
    redirect_to(:new_session)
  end

  private

  def session_params
    params.require(:session_form).permit(:email, :password)
  end

  def sign_in(login_session); end
  def sign_out; end
end
