class PictureUploader < ApplicationUploader
  process resize_to_limit: [600, 600]
end
