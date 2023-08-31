WickedPdf.config = {
    # exe_path: '/home/gr/.rvm/gems/ruby-3.2.0/bin/wkhtmltopdf',
    # exe_path: '/usr/local/bundle/bin/wkhtmltopdf',
    exe_path: Gem.bin_path('wkhtmltopdf-binary','wkhtmltopdf'),
    margin: { top:    4,      bottom: 2,
              left:   1,      right:  1 },
      page_size: 'A4'
      # orientation: 'Landscape'
  }
  
