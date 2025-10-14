# frozen_string_literal: true

WickedPdf.configure do |config|
  # Caminho para o executável do wkhtmltopdf
  config.exe_path = Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')

  # Permite acesso a arquivos locais (CSS/JS/Imagens)
  config.enable_local_file_access = true

  # Layout padrão para PDFs (pode ser substituído no render)
  config.layout = 'pdf.html'

  # Orientação e tamanho de página padrão
  config.orientation = 'Landscape'
  config.page_size = 'A4'
end
