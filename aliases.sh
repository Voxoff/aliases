# Get External IP / local IPs
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

# Quickly serve the current directory as HTTP
alias serve='ruby -run -e httpd . -p 8000'  # Or python -m SimpleHTTPServer :)

# GIT

#DATA SCIENCE
alias jn="jupyter notebook"

# n!s
#Rails

alias rs="rails server"
alias rsp="rails server -e production"
alias rr="rails routes"
alias rc="rails console"
alias next="next"

next() {
  STR="$(pwd | cut -d '/' -f 6 | cut -d '-' -f 1-4)"
  NXT="$(expr $STR[-1] + 1)"
  if [[ NXT == 10 ]]; then
    FNL="${STR:0:-2}${NXT}"
  else
    FNL="${STR:0:-1}${NXT}"
  fi
  cd ..

  DIR="$(ls | grep $FNL)"
  if [[ -n DIR ]]; then
    cd $DIR
  else
    # recursively call + 1
    if [[ expr( $FNL[-2] <= 2) ]]; then
      recurse(FNL)
    fi
  fi
  
}

recurse(IN) {
  NXT="$(expr $IN[-1] + 1)"
  if [[ NXT == 10 ]]; then
    FNL="${IN:0:-2}${NXT}"
  else
    FNL="${IN:0:-1}${NXT}"
  fi
  return FNL
}
