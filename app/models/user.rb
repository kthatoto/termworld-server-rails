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
    return unless can_levelup?
    ActiveRecord::Base.transaction do
      while can_levelup? do
        self.exp -= next_level_exp
        self.level += 1
        self.max_hp += 1 + (self.level / 3)
        self.attack_power += 1 + (self.level / 5) + (self.level % 2)
        self.deffensive_power += 1 + (self.level / 5) + ((self.level + 1) % 2)
      end
      save!
    end
  end
end
