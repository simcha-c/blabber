json.user do
  json.partial! "api/users/user", user: @user
end

json.location do
  json.extract! @user.location, :id, :name
end