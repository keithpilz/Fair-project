require "mail"

module FailoverSMTP
  def self.smtp_settings_array=(smtp_settings_array)
    @smtp_settings_array = smtp_settings_array
  end

  def self.smtp_settings_array
    @smtp_settings_array
  end

  class Mail < ::Mail::SMTP
    def deliver!(message)
      smtp_settings_array.each_with_index do |smtp_settings, index|
        self.settings = settings.merge(smtp_settings)

        begin
          super(message)
          break
        rescue => e
          puts e
          next unless (smtp_settings_array.size - 1) == index
          raise e
        end
      end
    end

    def smtp_settings_array
      @smtp_settings_array || ::FailoverSMTP.smtp_settings_array
    end
  end
end

if defined?(Rails)
  ActionMailer::Base.add_delivery_method(:failover_smtp, FailoverSMTP::Mail)
end