const HtmlWebpackPlugin = require('html-webpack-plugin');
const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public'),
    clean: true,              // ← removes old bundles on rebuild
    publicPath: '/'
  },
  plugins: [
    //  ➜ recreates public/index.html and injects <script src="bundle.js">
    new HtmlWebpackPlugin({
      template: './public/index.html',
      inject: 'body'
    })
  ],

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
