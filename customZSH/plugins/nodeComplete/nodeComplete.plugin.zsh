#!/usr/bin/env zsh

#
# generated from running `node --completion-bash` on node v10.12.0
#
_node_complete() {
  compadd --track-heap-objects --abort-on-uncaught-exception --napi-modules --redirect-warnings --max-old-space-size --perf-basic-prof --no-warnings --trace-event-file-pattern --check --preserve-symlinks --perf-prof  --print --trace-deprecation --inspect-brk --expose_http2 --trace-sync-io --tls-cipher-list --no-force-async-hooks-checks --inspect --eval --loader --pending-deprecation --experimental-worker --expose-http2 --use-bundled-ca --stack-trace-limit --title --experimental-repl-await --no-deprecation --prof-process --throw-deprecation [has_eval_string] --trace-warnings --expose-internals --use-openssl-ca --v8-options --preserve-symlinks-main --interactive --icu-data-dir --require --version --experimental-vm-modules --completion-bash --help --zero-fill-buffers --v8-pool-size [ssl_openssl_cert_store] --security-reverts --experimental-modules --openssl-config --trace-event-categories --prof-process -p -pe -v -i --print -e -c -h -r --trace-events-enabled
}

compdef _node_complete node
