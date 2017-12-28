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
        :password  => 'secondtest',
        :domain    => 'localhost:3000',
        :authentication => :plain,
        :address => 'smtp.amazon_ses.com'
      }
    ]
  }

  it 'wont deliver emails if error is raised twice' do
    allow_any_instance_of(Net::SMTP).to receive(:start).and_raise(Net::SMTPFatalError)

    expect{ FailoverSMTP::Mail.new({}).deliver!(mail) }.to raise_error(Net::SMTPFatalError)
  end

  it 'wont raise error if only first smtp settings fail' do
    allow_any_instance_of(Net::SMTP).to receive(:start).with("localhost:3000", "test", "testtest", :plain).and_raise(Net::SMTPFatalError)
    allow_any_instance_of(Net::SMTP).to receive(:start).with("localhost:3000", "test", "secondtest", :plain).and_return(true)

    expect{ FailoverSMTP::Mail.new({}).deliver!(mail) }.to_not raise_error
  end

  it 'wont raise error if second smtp settings are invalid' do
    allow_any_instance_of(Net::SMTP).to receive(:start).with("localhost:3000", "test", "testtest", :plain).and_return(true)
    allow_any_instance_of(Net::SMTP).to receive(:start).with("localhost:3000", "test", "secondtest", :plain).and_raise(Net::SMTPFatalError)

    expect{ FailoverSMTP::Mail.new({}).deliver!(mail) }.to_not raise_error
  end
end
