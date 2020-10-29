class User < ApplicationRecord
  belongs_to :account

  validates :name, presence: true

  def next_level_exp
    (10 * 1.2**(level - 1)).to_i
  end

  def can_levelup?
    exp >= next_level_exp
  end

  def levelup
    return unless can_levelup?
    exp -= next_level_exp
    level += 1
    attack_power += 1 + (level / 5) + (level % 2)
    deffensive_power += 1 + (level / 5) + ((level + 1) % 2)
    save!
  end
end
