class Profile < ActiveRecord::Base
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  validate  :avatar_size

  private

    # 验证上传的图片大小
    def avatar_size
      if avatar.size > 3.megabytes
        errors.add(:avatar, "should be less than 3MB")
      end
    end

end
