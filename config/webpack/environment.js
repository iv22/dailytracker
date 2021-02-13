const { environment } = require('@rails/webpacker');
const jquery = require('./plugins/jquery');

["css", "moduleCss"].forEach(loaderName => {
  const loader = environment.loaders.get(loaderName);

  loader.test = /\.(p?css)$/i;

  environment.loaders.insert(loaderName, loader);
});

environment.plugins.prepend('jquery', jquery);
module.exports = environment;
