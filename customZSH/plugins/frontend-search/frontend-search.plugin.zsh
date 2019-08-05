alias fes='frontend'

function _frontend_fallback() {
  local url
  if [[ "$FRONTEND_SEARCH_FALLBACK" == duckduckgo ]]; then
    url="https://duckduckgo.com/?sites=$1&q="
  else
    url="https://google.com/search?as_sitesearch=$1&as_q="
  fi

  echo "$url"
}

function frontend() {
  emulate -L zsh

  # define search context URLS
  typeset -A urls
  urls=(
    bundlephobia   'https://bundlephobia.com/result?p='
    caniuse        'https://caniuse.com/#search='
    codepen        'https://codepen.io/search?q='
    compassdoc     'http://compass-style.org/search?q='
    cssflow        'http://www.cssflow.com/search?q='
    dartlang       'https://api.dartlang.org/apidocs/channels/stable/dartdoc-viewer/dart:'
    ember          $(_frontend_fallback 'emberjs.com/')
    flowtype       $(_frontend_fallback 'flow.org/en/docs/')
    fontello       'http://fontello.com/#search='
    github         'https://github.com/search?q='
    html5please    'https://html5please.com/#'
    jest           $(_frontend_fallback 'jestjs.io')
    jquery         'https://api.jquery.com/?s='
    lodash         'https://devdocs.io/lodash/index#'
    mdn            'https://developer.mozilla.org/search?q='
    node           $(_frontend_fallback 'nodejs.org/en/docs/')
    npm            'https://www.npmjs.com/search?q='
    qunit          'https://api.qunitjs.com/?s='
    react          $(_frontend_fallback 'reactjs.org/')
    stackoverflow  'https://stackoverflow.com/search?q='
    typescript     $(_frontend_fallback 'www.typescriptlang.org/docs')
    unheap         'http://www.unheap.com/?s='
    vue            $(_frontend_fallback 'vuejs.org')
  )

  # show help for command list
  if [[ $# -lt 2 ]]
  then
      print -P "Usage: frontend %Ucontext%u %Uterm%u [...%Umore%u] (or just: %Ucontext%u %Uterm%u [...%Umore%u])"
      print -P ""
      print -P "%Uterm%u and what follows is what will be searched for in the %Ucontext%u website,"
      print -P "and %Ucontext%u is one of the following:"
      print -P ""
      print -P "  bundlephobia caniuse, codepen, compassdoc, cssflow,"
      print -P "  dartlang, ember, fontello, flowtype, github, html5please, jest, jquery, lodash,"
      print -P "  mdn, npm, node, qunit, react, stackoverflow, unheap, vue"
      print -P ""
      print -P "For example: frontend npm mocha"
      print -P ""
      return 1
  fi

  # check whether the search context is supported
  if [[ -z "$urls[$1]" ]]
  then
    echo "Search context \"$1\" currently not supported."
    echo ""
    echo "Valid contexts are:"
    echo ""
    echo "  bundlephobia, caniuse, codepen, compassdoc, cssflow,"
    echo "  dartlang, ember, fontello, github, html5please, jest, jquery, lodash,"
    echo "  mdn, npm, node, qunit, react, stackoverflow, unheap, vue"
    echo ""
    return 1
  fi

  # build search url:
  # join arguments passed with '%20', then append to search context URL
  # TODO substitute for proper urlencode method
  url="${urls[$1]}${(j:%20:)@[2,-1]}"

  echo "Opening $url ..."

  open_command "$url"
}
