json.array!(@microposts) do |micropost|
  json.id micropost.id
  json.text micropost.content
  json.created_at micropost.created_at
  json.user micropost.user.name
end
