json.extract! user, :id, :login, :first, :last, :password, :email, :role, :phone, :description, :avatar_file_name, :birthdate, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)
