class UsersSerializer
  include JSONAPI::Serializer

  set_id :id 
  set_type :users 
  attributes :email
  attribute :api_key, &:token
end
