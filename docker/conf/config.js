const CONFIG = {
  baseURI: '/shell',
  dbCleanInterval: 1000 * 60 * 60,
  dbPath: './server/db/',
  floodServerPort: 445,
  maxHistoryStates: 30,
  pollInterval: 1000 * 5,
  secret: 'flood',
  scgi: {
    host: '127.0.0.1',
    port: 5000,
    socket: false,
    socketPath: '/tmp/rtorrent.sock'
  },
  ssl: false,
  sslKey: '/absolute/path/to/key/',
  sslCert: '/absolute/path/to/certificate/'
};

module.exports = CONFIG;
