# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'a_status', 'a_status'
  inflect.irregular 'a_tipo_unidade', 'a_tipos_unidades'
  
end
