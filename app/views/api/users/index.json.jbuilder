# json.array! @users, :id, :username

@users.each do |user|
  json.set! user.id do
    json.partial! "api/users/user", user: user
  end
end