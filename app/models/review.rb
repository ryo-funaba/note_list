class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :note
  attr_accessor :url
 
  before_validation :exists_url
  before_save :set_url
  
  private
  
  def exists_url
    # Noteレコードがあるかチェック
    note = Note.find_by(url: url)
    return if note.present?
    # なければスクレイピングして必要な情報が取れるかチェック
    if note.blak? 
      product = Scraping.get_products(url)
      p product
      # 情報が取れなければエラー
      if product.title.nil
        # errors.add(:base, '入力されたURLは存在しません。')
        puts "入力されたURLは存在しません。"
      end
    end
  end
  
  def set_url
    note = Note.find_by(url: url)
    if note.blank?
      # スクレイピング開始
      get_products(note)
      # スクレイピング成功した場合
        # Noteレコードを作成
        note = Note.create!() 
      
    end
    
    self.note = note
  end

end