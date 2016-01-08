# Useful scripts for personal purposes

Note that I use zsh...

## Use them
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
