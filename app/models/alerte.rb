class Alerte < ApplicationRecord
  before_save :init

  belongs_to :type
  belongs_to :agent
  belongs_to :statu
  validates_presence_of :titre, presence: true
  validates_presence_of :description, presence: true
  validates_presence_of :type, presence: true
  validates_presence_of :agent, presence: true
  validates_presence_of :longitude, presence: true
  validates_presence_of :latitude, presence: true

  #ajout de active storage pour les fichiers
  has_one_attached :alertes

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |alerte|
        csv << alerte.attributes.values_at(*column_names)
      end
    end
  end

  #pour importer les alertes provenant d'une source xls
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      alerte = find_by_id(row["id"]) || new
      alerte.attributes = row.to_hash.slice(*accessible_attributes)
      alerte.save
    end
    CSV.foreach(file.path, headers: true) do |row|
      Alerte.create! row.to_hash
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when '.xls' then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Type de fichier inconnu : #{file.original_filename}"
    end
  end


  private
  def init
    self.statu_id = Statu.last.id
    self.action = "Aucune action pour le moment"
    self.date = Date.today
    self.longitude = Base64.decode64(self.longitude)
    self.latitude = Base64.decode64(self.latitude)
    #self.description = Base64.decode64(self.description)
    #self.alertes.attach(Base64.encode64("public/assets/homework-3235100_1280.jpeg"))
  end
end
