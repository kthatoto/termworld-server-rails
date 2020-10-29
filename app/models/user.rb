class User < ApplicationRecord
  belongs_to :account

  validates :name, presence: true

  def next_level_exp
    (10 * 1.2**(level - 1)).to_i
  end

  def can_levelup?
    exp >= next_level_exp
  end

  def levelup!
    return false unless can_levelup?
    before_params = {
      level: self.level,
      max_hp: self.max_hp,
      attack_power: self.attack_power,
      defensive_power: self.defensive_power,
    }
    ActiveRecord::Base.transaction do
      while can_levelup? do
        self.exp -= next_level_exp
        self.level += 1
        self.max_hp += 1 + (self.level / 3)
        self.attack_power += 1 + (self.level / 5) + (self.level % 2)
        self.defensive_power += 1 + (self.level / 5) + ((self.level + 1) % 2)
      end
      save!
    end
    {
      level: self.level - before_params[:level],
      max_hp: self.max_hp - before_params[:max_hp],
      attack_power: self.attack_power - before_params[:attack_power],
      defensive_power: self.defensive_power - before_params[:defensive_power],
    }
  end
end
