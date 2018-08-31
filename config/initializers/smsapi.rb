SMS_API = YAML.load_file(Rails.root.join('config', 'smsapi.yml'))['api_key']

SmsapiRails.configure do |config|
  config.username = SMS_API['username']
  config.password = SMS_API['password']
  config.test = SMS_API['test']
  config.flash = SMS_API['flash']
end

module SmsapiRails  
  def self.client
    @client ||= Smsapi::Client.new(SMS_API['username'], SMS_API['password'])
  end
end
