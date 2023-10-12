function install-asciidoctor
{
  #install asciidoctor

  # local cdir=$(pwd)
  # local INSTALL_DIR=asciidoctor-install
  # mkdir -p $INSTALL_DIR
  # cd $INSTALL_DIR


  #check latest versions: https://rubygems.org/search?query=asciidoctor
  # local ASCIIDOCTOR_VERSION=2.0.20
  # local ASCIIDOCTOR_PDF_VERSION=2.3.9
  # local ASCIIDOCTOR_DIAGRAM_VERSION=2.2.14
  # local ASCIIDOCTOR_EPUB3_VERSION=1.5.1
  # local ASCIIDOCTOR_REVEALJS_VERSION=5.0.1

  #create Gemfile
#   cat > Gemfile << EOF
# source 'https://rubygems.org'
# gem 'asciidoctor', '$ASCIIDOCTOR_VERSION'
# gem 'asciidoctor-pdf', '$ASCIIDOCTOR_PDF_VERSION'
# gem 'asciidoctor-diagram', '$ASCIIDOCTOR_DIAGRAM_VERSION'
# gem 'asciidoctor-epub3', '$ASCIIDOCTOR_EPUB3_VERSION'
# gem 'asciidoctor-revealjs', '$ASCIIDOCTOR_REVEALJS_VERSION'
# EOF

#   cat > Gemfile << EOF
# source 'https://rubygems.org'
# gem 'asciidoctor'
# gem 'asciidoctor-pdf'
# gem 'asciidoctor-diagram'
# gem 'asciidoctor-epub3'
# gem 'asciidoctor-revealjs'
# EOF


sudo /usr/local/bin/gem install asciidoctor
sudo /usr/local/bin/gem install asciidoctor-pdf
sudo /usr/local/bin/gem install asciidoctor-diagram
sudo /usr/local/bin/gem install asciidoctor-epub3
sudo /usr/local/bin/gem install asciidoctor-revealjs

  #install gems in Gemfile
  #bundle

  #remove install dir
  # cd $cdir
  # rm -rf $INSTALL_DIR


}