class ApplicationController < ActionController::API

  def authenticate!
    email = request.headers['X-Termworld-Email']
    token = request.headers['X-Termworld-Token']
    @current_account = Account.find_by(email: email, token: token)
    return render json: {}, status: 404 if @current_account.nil?
  end
end
