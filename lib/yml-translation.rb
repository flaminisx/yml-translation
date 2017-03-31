require 'yandex-translator'
require 'yaml'

class YmlTranslation
  def initialize api_key
    @translator = Yandex::Translator.new api_key
    @default_options = { from: 'en', to: 'ru'}
  end

  def translate_hash data, options={}
    translate_every_value(data)
  end

  def translate_file
    file = YAML.load_file('tmp/input.yml')
    File.open('tmp/output.yml', 'w+') {|f| f.write translate_hash(file).to_yaml}
  end

private

  def translate value, options={}
    @translator.translate value, options
  end

  def translate_every_value(obj)
    temp = {}
    obj.each do |k, v|
      if v.is_a?(Hash)
        temp[k] = translate_every_value(v)
      else
        temp[k] = translate v, @default_options
      end
    end
    temp
  end
end
