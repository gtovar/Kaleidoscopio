Dineromail.configure do |config|
  config.pay_methods = '' #All the available methods
  config.account_number = '1048078'
  config.password = 'ramirez2'
  config.logo_url = 'http://my-web.com/images/logo.png'
  config.return_url = 'http://kaleydoscopio.herokuapp.com/succes'
  config.error_url = 'http://kaleydoscopio.herokuapp.com/error'
  
  config.currency = Dineromail::Configuration::PESO
  config.ipn_webservice_url = 'https://mexico.dineromail.com/Vender/Consulta_IPN.asp'
  config.payment_url = 'https://checkout.dineromail.com/CheckOut'
  config.button_image_url = 'https://mexico.dineromail.com/imagenes/botones/pagar-medios_c.gif'
end
