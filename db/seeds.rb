if Rails.env.development?
  EMAIL = "test@example.com"
  PASSWORD = "password"

  User.find_or_create_by!(email: EMAIL) do |user|
    user.password = PASSWORD
    puts "初期ユーザーを作成しました"
  end
end
