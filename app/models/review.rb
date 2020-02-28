class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :note
  attr_accessor :url
 
  before_validation :exists_url
  before_save :set_url
  
  private
  
  def exists_url
    # Noteレコードがあるかチェック
    # なければスクレイピングして必要な情報が取れるかチェック
      # 情報が取れなければエラー
      errors.add(:base, '入力されたURLは存在しません。')
  end
  def set_url
    note = Note.find_by(url: url)
    if note.blank?
      # スクレイピング開始
      
      # スクレイピング成功した場合
        # Noteレコードを作成
        note = Note.create!() 
      
    end
    
    self.note = note
  end

end