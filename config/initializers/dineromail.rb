Dineromail.configure do |config|
  config.pay_methods = '' #All the available methods
  config.account_number = 'clases@kaleidoscopio.com'
  config.password = 'ramirez2'
  config.logo_url = 'http://my-web.com/images/logo.png'
  config.return_url = 'http://my-web.com/success'
  config.error_url = 'http://my-web.com/error'
  
  config.currency = Dineromail::Configuration::PESO
  config.ipn_webservice_url = 'https://mexico.dineromail.com/Vender/Consulta_IPN.asp'
  config.payment_url = 'https://checkout.dineromail.com/CheckOut'
  config.button_image_url = 'https://argentina.dineromail.com/imagenes/vender/boton/comprar-gris.gif'
end