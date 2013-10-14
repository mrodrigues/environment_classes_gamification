module LoginMacros
  def login
    user = FactoryGirl.create :user
    case example.metadata[:type]
      when :request
        post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
      when :controller
        request.env['warden'].stub authenticate!: user
        controller.stub(:current_user).and_return(user)
    end
  end
end
