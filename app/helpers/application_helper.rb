module ApplicationHelper
  def get_img_path(img_name)
    "/#{IMAGES_DIR}/#{img_name}"
  end
end
