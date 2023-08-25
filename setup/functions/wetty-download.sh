#download file when using wetty
#https://butlerx.github.io/wetty/downloading-files
#
#usage: wetty-download <file> 
#or 
#cat file |wetty-download
#note: does not work inside tmux session
function wetty-download() {
  file=${1:-/dev/stdin}

  if [[ -f $file || $file == "/dev/stdin" ]]; then
    printf "\033[5i"$(cat $file | base64 -w 0)"\033[4i"
  else
    echo "$file does not appear to be a file"
  fi
}
