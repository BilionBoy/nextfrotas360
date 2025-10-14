WickedPdf.configure do |config|
  # Caminho para o executável do wkhtmltopdf instalado no sistema
  config.exe_path = '/usr/bin/wkhtmltopdf'  # <--- altere isso

  # Permite acesso a arquivos locais (CSS/JS/Imagens)
  config.enable_local_file_access = true

  # Layout padrão para PDFs (pode ser substituído no render)
  config.layout = 'pdf.html'

  # Orientação e tamanho de página padrão
  config.orientation = 'Landscape'
  config.page_size = 'A4'
end
