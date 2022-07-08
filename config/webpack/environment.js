const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')


environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

// config/webpack/environment.js


environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        jquery: 'jquery',
        'window.jQuery': 'jquery',
        Popper: ['popper.js', 'default'],
    })
)

module.exports = environment
