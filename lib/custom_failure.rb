class CustomFailure < Devise::FailureApp
  def redirect_url
    posts_path
  end
end
