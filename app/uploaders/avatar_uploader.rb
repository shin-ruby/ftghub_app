class AvatarUploader < ApplicationUploader
  process resize_to_limit: [200, 200]
end
