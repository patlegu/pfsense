# Convert pfSense xml configfile to yaml file

bundle install --path=vendor/bundle
cat config.xml | bundle exec gorgeous -F xml -T yaml | less
