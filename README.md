# usearchtree
Uninformed search trees

## Usage

Install [Ruby](https://www.ruby-lang.org/en/).

Install [RubyGems](https://rubygems.org/).

Install [Rake](https://rubygems.org/gems/rake):

```
gem install rake
```

Get the `usearchtree` project from:

```
git clone https://github.com/jleeothon/usearchtree
```

Generate documentation using [RDoc](http://docs.seattlerb.org/rdoc/). `cd` to the root folder, then run:

```
rdoc
```

Run the tests from the project's root folder using:

```
rake tests
```

Or run a single test using the following example command. The argument is a test case's name without the `test_` prefix and without the `.rb` extension.

```
rake test[mst_breadth]
```
