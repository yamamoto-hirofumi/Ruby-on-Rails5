class Task < ApplicationRecord
  belongs_to :user
  validates :name, length: { maximum: 30 }, presence: true
  validate :validate_name_not_including_comma
  
  
  def self.ransackable_attributes(auth_object = nil)
    %[name created_at]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
  
  private
    def validate_name_not_including_comma
      errors.add(:name, "にカンマを含めることはできません") if name&.include?(",")
    end
end
