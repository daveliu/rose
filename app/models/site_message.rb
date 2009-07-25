class SiteMessage < ActiveRecord::Base
  belongs_to :receiver, :polymorphic => true
end
