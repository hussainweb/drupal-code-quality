# drupal-code-quality
[Drupal Code Quality](https://hub.docker.com/r/hussainweb/drupal-code-quality/) is a Docker image designed to aid in static analysis for Drupal code bases. It is based off [Adam Culp's PHP Code Quality](https://hub.docker.com/r/adamculp/php-code-quality/) Docker image. Therefore, all tools present in adamculp/php-code-quality are also present here. See [README.md in that package](https://github.com/adamculp/php-code-quality/blob/master/README.md) for more details.

From a Drupal perspective, this Docker image adds:
- [drupal/coder](https://packagist.org/packages/drupal/coder)
- [drupalsecure sniffs](http://git.drupal.org/sandbox/coltrane/1921926)
- [PAReview.sh](https://github.com/klausi/pareviewsh)
- [codespell](https://github.com/lucasdemarchi/codespell)
- [eslint](https://github.com/eslint/eslint)
- [stylelint](https://github.com/stylelint/stylelint)

## Usage
Run these commands in your repository's root directory. The commands below assume that the Drupal site lives under the `docroot` directory.

### Get to a shell
This is the simplest command to get into a shell with your code mounted under `/app`.

```
docker run -it --rm -v "$PWD":/app -w /app hussainweb/drupal-code-quality:latest bash
```

### Run phpcs with Drupal coder sniffs

```
docker run -it --rm -v "$PWD":/app -w /app hussainweb/drupal-code-quality:latest phpcs --standard=Drupal --extensions=php,module,inc,install,test,profile,theme  docroot/modules/custom/ docroot/themes/custom/
```

Refer to [adamculp/php-code-quality's Usage](https://github.com/adamculp/php-code-quality/blob/master/README.md#usage) for more details.
