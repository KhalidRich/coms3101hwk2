json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :pwd
  json.url user_url(user, format: :json)
end
