class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  validate :avatar_size

  private

  def avatar_size
    errors.add(:avatar, 'should be less than 3MB') unless avatar.size < 3.megabytes
  end
end
