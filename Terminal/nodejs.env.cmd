@ECHO OFF

REM ----------- SETENV -----------

GOTO //////////////////////////////////////////////////

::  ECHO %~f0  -- complete path & filename of running script
::  ECHO %~dp0 -- complete path of running script

W:\>node -h
Usage: node [options] [ -e script | script.js | - ] [arguments]
       node inspect script.js [arguments]

Options:
  -                                         script read from stdin (default if no file name is provided, interactive mode if a tty)
  --                                        indicate the end of node options
  --abort-on-uncaught-exception             aborting instead of exiting causes a core file to be generated for analysis
  -c, --check                               syntax check script without executing
  --completion-bash                         print source-able bash completion script
  -e, --eval=...                            evaluate script
  --experimental-modules                    experimental ES Module support and caching modules
  --experimental-repl-await                 experimental await keyword support in REPL
  --experimental-vm-modules                 experimental ES Module support in vm module
  --experimental-worker                     experimental threaded Worker support
  -h, --help                                print node command line options (currently set)
  --icu-data-dir=...                        set ICU data load path to dir (overrides NODE_ICU_DATA)
  --inspect[=[host:]port]                   activate inspector on host:port (default: 127.0.0.1:9229)
  --inspect-brk[=[host:]port]               activate inspector on host:port and break at start of user script
  --debug-port, --inspect-port=[host:]port  set host:port for inspector
  -i, --interactive                         always enter the REPL even if stdin does not appear to be a terminal
  --loader=...                              (with --experimental-modules) use the specified file as a custom loader
  --max-http-header-size=...                set the maximum size of HTTP headers (default: 8KB)
  --no-deprecation                          silence deprecation warnings
  --no-force-async-hooks-checks             disable checks for async_hooks
  --no-warnings                             silence all process warnings
  --openssl-config=...                      load OpenSSL configuration from the specified file (overrides OPENSSL_CONF)
  --pending-deprecation                     emit pending deprecation warnings
  --preserve-symlinks                       preserve symbolic links when resolving
  --preserve-symlinks-main                  preserve symbolic links when resolving the main module
  -p, --print [...]                         evaluate script and print result
  --prof-process                            process V8 profiler output generated using --prof
  --redirect-warnings=...                   write warnings to file instead of stderr
  -r, --require=...                         module to preload (option can be repeated)
  --throw-deprecation                       throw an exception on deprecations
  --title=...                               the process title to use on startup
  --tls-cipher-list=...                     use an alternative default TLS cipher list
  --trace-deprecation                       show stack traces on deprecations
  --trace-event-categories=...              comma separated list of trace event categories to record
  --trace-event-file-pattern=...            Template string specifying the filepath for the trace-events data, it supports ${rotation} and
                                            ${pid}.
  --trace-sync-io                           show stack trace when use of sync IO is detected after the first tick
  --trace-warnings                          show stack traces on process warnings
  --track-heap-objects                      track heap object allocations for heap snapshots
  --use-bundled-ca                          use bundled CA store (default)
  --use-openssl-ca                          use OpenSSL's default CA store
  --v8-options                              print V8 command line options
  --v8-pool-size=...                        set V8's thread pool size
  -v, --version                             print Node.js version
  --zero-fill-buffers                       automatically zero-fill all newly allocated Buffer and SlowBuffer instances

Environment variables:
NODE_DEBUG                    ','-separated list of core modules that should print debug information
NODE_DEBUG_NATIVE             ','-separated list of C++ core debug categories that should print debug output
NODE_DISABLE_COLORS           set to 1 to disable colors in the REPL
NODE_EXTRA_CA_CERTS           path to additional CA certificates file
NODE_NO_WARNINGS              set to 1 to silence process warnings
NODE_OPTIONS                  set CLI options in the environment via a space-separated list
NODE_PATH                     ';'-separated list of directories prefixed to the module search path
NODE_PENDING_DEPRECATION      set to 1 to emit pending deprecation warnings
NODE_PRESERVE_SYMLINKS        set to 1 to preserve symbolic links when resolving and caching modules
NODE_REDIRECT_WARNINGS        write warnings to path instead of stderr
NODE_REPL_HISTORY             path to the persistent REPL history file
NODE_TLS_REJECT_UNAUTHORIZED  set to 0 to disable TLS certificate validation
NODE_V8_COVERAGE              directory to output v8 coverage JSON to
OPENSSL_CONF                  load OpenSSL configuration from file
SSL_CERT_DIR                  sets OpenSSL's directory of trusted certificates when used in conjunction with --use-openssl-ca
SSL_CERT_FILE                 sets OpenSSL's trusted certificate file when used in conjunction with --use-openssl-ca
UV_THREADPOOL_SIZE            sets the number of threads used in libuv's threadpool

Documentation can be found at https://nodejs.org/

::::::::::::::::::::

node -v
v10.16.2

://////////////////////////////////////////////////

SET NODEJS_HOME=C:\Apps\nodejs

SET PATH=%NODEJS_HOME%;%PATH%
