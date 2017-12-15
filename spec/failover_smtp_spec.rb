require 'spec_helper'
require_relative '../lib/failover_smtp'

describe FailoverSMTP, '.smtp_settings_array' do
  it 'returns an array of settings' do
    FailoverSMTP.smtp_settings_array = [:settings, :settings2]

    result = FailoverSMTP.smtp_settings_array

    expect(result).to eq [:settings, :settings2]
  end
end

describe FailoverSMTP::Mail, 'deliver' do
  let!(:mail) {
    FailoverSMTP::Mail.new({
      from: 'test@hi.com',
      to: 'coolemail@aol.com',
      subject: 'WOW we\'re testing something'
    })
  }


  let!(:smtp_settings_array)  {
    FailoverSMTP.smtp_settings_array = [
      {
        :user_name => 'test',
        :password  => 'testtest',
        :domain    => 'localhost:3000',
        :authentication => :plain,
        :address => 'smtp.sendgrid.net'
      },
      {
        :user_name => 'test',
        :password  => 'testtest',
        :domain    => 'localhost:3000',
        :authentication => :plain,
        :address => 'smtp.amazaon_ses.com'
      }
    ]
  }

  it 'can deliver emails' do
    allow_any_instance_of(Net::SMTP).to receive(:start).and_return(true)
    # allow_any_instance_of(Net::SMTP).to receive(:start).with(smtp_settings_array[0]).and_return(true)
    # allow(Net::SMTP).to receive(:start).with(smtp_settings_array[1]).and_return(true)

    p FailoverSMTP::Mail.new({}).deliver!(mail)
    # expect(FailoverSMTP::Mail.new({}).deliver!(mail)).to_not raise(Net::SMTPFatalError)
  end
end
