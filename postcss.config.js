module.exports = {
  parser: 'postcss-scss',
  plugins: [
    require('postcss-advanced-variables'),
    require('postcss-import'),
    require('postcss-nested'),
    require('autoprefixer'),
  ],
}
