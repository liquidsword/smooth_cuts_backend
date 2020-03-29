class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username
  has_many :posts, serializer: PostSerializer
end
