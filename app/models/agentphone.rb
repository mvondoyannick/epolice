class Agentphone < ApplicationRecord
  before_commit :set_fingerprint
  has_many :agent

  private

  def set_fingerprint
    self.fingerprint = Base64.encode64(Date.today)
  end
end
