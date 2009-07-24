class UpgradeLevelPrice < ActiveRecord::Base
  def description
    if self.min_day && self.max_day
      "#{self.min_day}-#{self.max_day}天"
    elsif self.min_day
      "#{self.min_day}以上"
    elsif self.max_day
      "小于#{self.max_day}"
    else
      raise "wrong upgrade_level_price data, id: #{self.id}"
    end
  end
end
