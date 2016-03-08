# Useful scripts for personal purposes

![](https://travis-ci.org/Pamplemousse/scripts.svg?branch=master)


## Use them

Note that I use zsh...

```
git clone git@github.com:Pamplemousse/scripts.git
mv scripts ~/scripts
source ~/scripts/lib/*
```

## Tests

You will need the [shunit2](https://shunit2.googlecode.com/svn/trunk/source/2.1/doc/shunit2.html) framework to write and run the tests.

```bash
# shunit2 is actually in the ubuntu repos
sudo apt-get install shunit2

# run all the tests
./spec/all.sh
```
