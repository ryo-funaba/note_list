class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :note
  attr_accessor :url
  
  validates :url, presence: true
  validates :rate, presence: true, numericality: { only_integer: true }
  validates :review, presence: true, length: { maximum: 400 }
  
  before_validation :exists_url
  before_save :set_url
  
  private
  
  def exists_url
    # Noteレコードがあるかチェック
    note = Note.find_by(url: url)
    return if note.present?
    # なければスクレイピングして必要な情報が取れるかチェック
    product = Scraping.get_products(url)
    # 情報が取れなければエラー
    return errors.add(:url, 'が不正です') if product[:title].blank?
    # return "入力されたURLは不正です" if product[:title].blank?
  end
  
  def set_url
    note = Note.find_by(url: url)
    if note.blank?
      # スクレイピング開始
      Scraping.get_products(url)
      # スクレイピング成功した場合
        # Noteレコードを作成
      note = Note.create!() 
    end
    
    self.note = note
  end

end