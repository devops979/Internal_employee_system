const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public'),
    publicPath: '/'
  },
  devServer: {
    static: path.join(__dirname, 'public'),
    port: 3000,
    historyApiFallback: true,
    proxy: {
      '/api': 'http://localhost:5000'
    }
  },
  module: {
    rules: [
      { test: /\.jsx?$/, exclude: /node_modules/, loader: 'babel-loader' }
    ]
  },
  resolve: { extensions: ['.js', '.jsx'] }
};
