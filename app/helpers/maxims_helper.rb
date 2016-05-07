module MaximsHelper
  def output_img(menu_img_name, option = {})
    image_tag get_img_path(menu_img_name), option
  end
end
