# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'a_status', 'a_status'
  inflect.irregular 'a_tipo_unidade',        'a_tipos_unidades'
  inflect.irregular 'a_tipo_usuario',        'a_tipo_usuarios'
  inflect.irregular 'g_status',              'g_status'
  inflect.irregular 'g_tipo_veiculo',        'g_tipos_veiculos'
  inflect.irregular 'g_tipo_centro_custo',   'g_tipos_centros_custos'
  inflect.irregular 'o_status',              'o_status'
  inflect.irregular 'o_tipo_solicitacao',    'o_tipos_solicitacoes'
  inflect.irregular 'o_tipo_solicitacao',    'o_tipos_solicitacoes'
  inflect.irregular 'o_categoria_servico',   'o_categorias_servicos'
  inflect.irregular 'o_urgencia',            'o_urgencias'
  inflect.irregular 'o_visibilidade',        'o_visibilidades'
  
end
