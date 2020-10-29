class UserSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  attributes :max_hp
  attributes :level
  attributes :exp
  attributes :attack_power
  attributes :deffensive_power
end
