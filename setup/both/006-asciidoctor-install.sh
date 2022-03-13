#install ruby from source

#check latest versions: https://rubygems.org/search?query=asciidoctor
ASCIIDOCTOR_VERSION=2.0.17
ASCIIDOCTOR_PDF_VERSION=1.6.2
ASCIIDOCTOR_DIAGRAM_VERSION=2.2.1
ASCIIDOCTOR_EPUB3_VERSION=1.5.1
ASCIIDOCTOR_REVEALJS_VERSION=4.1.0

INSTALL_DIR=asciidoctor-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

#create Gemfile
cat > Gemfile << EOF
source 'https://rubygems.org'
gem 'asciidoctor', '$ASCIIDOCTOR_VERSION'
gem 'asciidoctor-pdf', '$ASCIIDOCTOR_PDF_VERSION'
gem 'asciidoctor-diagram', '$ASCIIDOCTOR_DIAGRAM_VERSION'
gem 'asciidoctor-epub3', '$ASCIIDOCTOR_EPUB3_VERSION'
gem 'asciidoctor-revealjs', '$ASCIIDOCTOR_REVEALJS_VERSION'
EOF

#install gems in Gemfile
bundle

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
