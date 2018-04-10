/**
 * The settings hash defines configuration settings for server.js, the server
 * code executed by node. The available settings and their defaults are listed
 * below.
 *
 * scheme: 'http' or 'https'. This defines whether the node server should
 * contact the Drupal site using http or https. If https is used, the key and
 * cert must be set to valid files. Defaults to 'http'.
 *
 * port: Specify the TCP port that the node server should listen on. Defaults
 * to '8080'.
 *
 * host: Specify the host name or IP address that the node server should listen
 * on. Leave blank to listen for any host name. Otherwise, the server will only
 * respond to names that match the IP address given (or resolved from the given
 * name). Defaults to 'localhost'.
 *
 * resource: http path that the node server should respond to. This value needs
 * to match the Drupal node.js configuration. Defaults to '/socket.io'.
 *
 * serviceKey: An arbitrary string used as a secret between the node.js server
 * and the Drupal site.
 *
 * debug: Whether to write a bunch of debug information to the console. false
 * by default.
 *
 * baseAuthPath: base path for all requests from the backend. This is used to
 * set the authentication call for all requests from the backend. Defaults to
 * '/nodejs/'.
 *
 * sslKeyPath: File system path to a key used for https communication with
 * the server and clients.
 *
 * sslCertPath: File system path to a certificate used for https communication
 * with the server and clients.
 *
 * sslCAPath: File system path to a file containing trusted certificates.
 *
 * sslPassPhrase: SSL passphrase, will be passed in the passphrase key to the
 * https server if set.
 *
 * backend: An object with the following properties:
 *
 *  -- port: TCP port of the server running the Drupal site. Defaults to '80'.
 *
 *  -- host: Host name of the Drupal site. Defaults to 'localhost'.
 *
 *  -- messagePath: http path on which the Drupal node.js module listens for
 *  messages from the Node.js server process. Defaults to 'nodejs/message'.
 *
 *  -- basePath: the base path of your backend site, defaults to '/'.
 *
 *  -- scheme: either 'http' or 'https', defaults to 'http'.
 *
 *  -- httpAuth: a username and password in the form 'username:password'
 *
 *  -- strictSSL: boolean, whether to be strict with SSL cert, default false.
 *
 * extensions: An array of names of node.js modules that should be loaded as
 * extensions to the node.js server.
 *
 * clientsCanWriteToClients: global flag that allows all clients to be written
 * to by client sockets without going via the backend. Defaults to false. Be
 * careful when enabling this, it can be a security issue.
 *
 * transports: a list of transports to be used by Socket.Io, defaults to
 * ['websocket', 'polling'].
 *
 * jsMinification: whether to call io.enable('browser client minification'),
 * defaults to 'true'.
 *
 * jsEtag: whether to call io.enable('browser client etag').
 *
 * logLevel: the log level to be used by Socket.Io, defaults to '1'.
 */
settings = {
    scheme: '{{ getenv "NODE_SCHEME" "http" }}',
    port: 8080,
    host: '0.0.0.0',
    resource: '{{ getenv "NODE_RESOURCE" "/socket.io" }}',
    serviceKey: '{{ getenv "NODE_SERVICE_KEY" "" }}',
    backend: {
        port: '{{ getenv "NODE_BACKEND_PORT" "80" }}',
        host: '{{ getenv "NODE_BACKEND_HOST" "php" }}',
        scheme: '{{ getenv "NODE_BACKEND_SCHEME" "http" }}',
        basePath: '{{ getenv "NODE_BACKEND_BASE_PATH" "" }}',
        messagePath: '{{ getenv "NODE_MESSAGE_PATH" "/nodejs/message" }}'
    },
    debug: {{ getenv "NODE_DEBUG" "false" }},
    sslKeyPath: '{{ getenv "NODE_SSL_KEY_PATH" "" }}',
    sslCertPath: '{{ getenv "NODE_SSL_CERT_PATH" "" }}',
    sslCAPath: '{{ getenv "NODE_SSL_CA_PATH" "" }}',
    baseAuthPath: '{{ getenv "NODE_BASE_AUTH_PATH" "/nodejs/" }}',
    extensions: [],
    clientsCanWriteToChannels: {{ getenv "NODE_CLIENTS_CAN_WRITE_TO_CHANNELS" "false" }},
    clientsCanWriteToClients: {{ getenv "NODE_CLIENTS_CAN_WRITE_TO_CLIENTS" "false" }},
    transports: ['websocket', 'polling'],
    jsMinification: {{ getenv "NODE_JS_MINIFICATION" "true" }},
    jsEtag: {{ getenv "NODE_JS_ETAG" "true" }},
    logLevel: {{ getenv "NODE_LOG_LEVEL" "1" }}
};