class Site < ApplicationRecord
    belongs_to :site_admin, class_name: 'User'
  
    validates :name, presence: true
    validates :address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zipcode, presence: true
    # Optional: Add validations for phone and email if there are specific formats or conditions
  end