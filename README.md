# usearchtree
Uninformed search trees - because ignorance is bliss

## Usage

### Dependencies

Install [Ruby](https://www.ruby-lang.org/en/).

Install [RubyGems](https://rubygems.org/) (requires Ruby).

Install [Rake](https://rubygems.org/gems/rake) (requires RubyGems):

```sh
gem install rake
```

Get the `usearchtree` project from:

```sh
git clone https://github.com/jleeothon/usearchtree
```

Optinally, generate documentation using [RDoc](http://docs.seattlerb.org/rdoc/). `cd` to the root folder, then run:

```sh
rdoc
```

Run the tests from the project's root folder using:

```sh
rake tests
```

Or run a single test using the following example command. The argument is a test case's name without the `test_` prefix and without the `.rb` extension.

```sh
rake test[mst_breadth]
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

## Disclaimer

The test fixtures are not of my authorship and are subject to a separate GNU LGPL license. They can be found [here](http://people.sc.fsu.edu/~jburkardt%20/data/graph_representation/graph_representation.html).
