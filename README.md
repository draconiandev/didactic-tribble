**1. Latest Ruby**

```
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.3.1
rbenv global 2.3.1
ruby -v
# ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]
gem install bundler
```

**2. Stable Rails Version**
```
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
gem install rails -v 4.2.6
rbenv rehash
rails -v
# Rails 4.2.6
```

**3. ElasticSearch**
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install openjdk-9-jre
java -version
# java version "9-ea"
# Java(TM) SE Runtime Environment (build 9-ea+126)
# Java HotSpot(TM) 64-Bit Server VM (build 9-ea+126, mixed mode)

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java9-installer

cd ~
cd Downloads/
wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-2.3.4.deb
cd ~
sudo dpkg -i elasticsearch-2.3.4.deb
sudo update-rc.d elasticsearch defaults
```

**4. Edit ElasticSearch Configuration**
```
sudo subl /etc/elasticsearch/elasticsearch.yml
```
Uncomment node.name and cluster.name

Save and close

**5. Start ElasticSearch**
```
sudo service elasticsearch start
```
(Also, stop and restart are also available)

**6. Test ElasticSearch**
```
curl -X GET 'http://localhost:9200'
```
Output should be something like following

```
{
  "name" : "node-1",
  "cluster_name" : "graylog2",
  "version" : {
    "number" : "2.3.4",
    "build_hash" : "e455fd0c13dceca8dbbdbb1665d068ae55dabe3f",
    "build_timestamp" : "2016-06-30T11:24:31Z",
    "build_snapshot" : false,
    "lucene_version" : "5.5.0"
  },
  "tagline" : "You Know, for Search"
}
```

**7. Clone the app**
```
cd ~
cd Documents/website
git clone git@github.com:draconiandev/didactic-tribble.git
cd into the folder
```

**8. Start the app**
```
bundle install
bundle exec elastic search -q
rake db:setup
rake db:migrate ; rake db:rollback ; rake db:migrate ; rake db:test:prepare

rake elasticsearch:reindex

rails server
```

**9. Create an Admin Account**

Login through website

Go to rails console
```
rails console

p = Person.first
p.role = "admin"
p.save
```
