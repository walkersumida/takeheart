class Maxim < ActiveRecord::Base
  attr_accessor :uploading_file

  validate -> {upload_file_ext ['jpg', 'jpeg', 'png']}, if: :exists_file?
  validates :word,
            presence: true,
            length: {maximum: 150}
  validates :author,
            presence: true,
            length: {maximum: 50}
  validates :uploading_file,
            presence: true

  before_create :upload_file

  def upload_file_ext white_list
    white_list.each do |ext|
      return true if File.extname(self.uploading_file.original_filename).downcase == ".#{ext}"
    end
    errors.add(:uploading_file, 'is invalid')
  rescue => e
    logger.error "Exception: #{e.message}"
    errors[:base] << "Validation failed"
    raise
  end

  def exists_file?
    !self.uploading_file.blank?
  end

  def upload_file
    upload_path = get_upload_path
    mkdir_upload_path IMAGES_DIR

    file_name = SecureRandom.uuid << File.extname(self.uploading_file.original_filename)
    full_path = upload_path << file_name

    File.open(full_path, 'wb') do |f|
      f.write self.uploading_file.read
    end

    self.img_path = file_name
  rescue => e
    logger.error "Exception: #{e.message}"
    raise
  end

  def get_upload_path
    "#{Rails.root.join(IMAGES_DIR).to_s}/"
  end

  def mkdir_upload_path upload_path
    FileUtils.mkdir_p(upload_path) unless FileTest.exist?(upload_path)
  end
end