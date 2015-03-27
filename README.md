# usearchtree

Uninformed search trees - because ignorance is bliss

[![Build Status](https://travis-ci.org/jleeothon/usearchtree.svg?branch=master)](https://travis-ci.org/jleeothon/usearchtree)

## Usage

### Dependencies

Install [Ruby](https://www.ruby-lang.org/en/). Has only been tested with Ruby 2.1.5.

Install [RubyGems](https://rubygems.org/) (requires Ruby).

Install [Rake](https://rubygems.org/gems/rake) (requires RubyGems):

```sh
gem install rake
```

Install the gem using:

```shell
gem install usearchtree
```

Or get the latest version with:

```shell
git clone https://github.com/jleeothon/usearchtree
```

## Documentation

### Documentation for the installed gem

To read the documentation for the gem installed, use `gem server`. Then open your browser in `http://localhost:8808/`.

### Documentation for a repository clone

1. Install `rdoc`: `gem install rdoc`.
2. `cd` to the root of the project.
3. Run `rdoc`.
4. Open the `docs` folder and open any HTML file.

## Testing

**Warning: test files have been deleted. This section is broken.**

Run the tests from the project's root folder using:

```sh
rake tests
```

Or run a single test using the following example command. The argument is a test case's name without the `test_` prefix and without the `.rb` extension.

```sh
rake test[1_breadth]
```

To run a console loaded with `usearchtree`, run:

```sh
rake console
```

Then run your own commands, for example:

```Ruby
g = Graph.new
load_node_lables g, "path/to/labels.txt"
load_distance_matrix g, "path/to/distance/matrix.txt"
b = BreadthFirstSearch g, "A", "Z"
puts b.path # this is the solution to the search
# [A, B, D, Z]
puts b.tree # this are the nodes and their parents
# [A => nil, B => A, C => A, D => B, E => B, F => C, G => C, Z => D]
puts b.traversal
# [A, B, C, D, E, F, G, Z]
puts b.cost
# 99

```
