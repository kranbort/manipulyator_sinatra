#coding: UTF-8
class Message

  attr_accessor :tel, :extra_info, :name, :serv, :email

  def initialize(args ={})
    @tel        = args[:tel]
    @extra_info = args[:extra_info]
    @name       = args[:name]
    @serv       = args[:serv]
    @email      = args[:email]
  end

  def deliver
    Pony.mail(
      from: 'kranbortspb@gmail.com',
      to: 'kranbortspb@gmail.com',
      subject: "#{name} связался с вами",
      body: ,
      port: '587',
      via: :smtp,
      enable_starttls_auto: true,
      via_options: {
        address: 'smtp.gmail.com',
        port: '587',
        enable_starttls_auto: true,
        user_name: 'kranbortspb',
        password : 'qwedsa123',
        authentication: :plain,
        domain: 'localhost.localdomain'
    })
  end

  def message_body
    "Телефон: #{tel} \n Услуга: #{serv} \n Email: #{email} \n Дополнительная информация: #{extra_info}"
  end
end
