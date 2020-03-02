class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :note
  attr_accessor :url
  
  validates :url, presence: true
  validates :rate, presence: true
  validates :review, presence: true, length: { maximum: 400 }
  
  before_validation :exists_url
  before_save :set_url
  
  private
  
  def exists_url
    # Noteレコードがあるかチェック
    note = Note.find_by(url: "https://note.com/info/n/n5249d17f")
    return if note.present?
    # なければスクレイピングして必要な情報が取れるかチェック
    product = Scraping.get_products("https://note.com/info/n1b2349d17f")
    # 情報が取れなければエラー
    # return errors.add(:base, '入力されたURLは不正です') if product[:title].blank?
    return "入力されたURLは不正です" if product[:title].blank?
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