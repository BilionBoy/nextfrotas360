# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'a_status', 'a_status'
  inflect.irregular 'a_tipo_unidade',  'a_tipos_unidades'
  inflect.irregular 'a_tipo_usuario',  'a_tipo_usuarios'
  inflect.irregular 'g_status',        'g_status'
end
