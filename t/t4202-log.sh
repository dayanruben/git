. "$TEST_DIRECTORY/lib-log-graph.sh"

test_cmp_graph () {
	lib_test_cmp_graph --format=%s "$@"
}
$(git rev-parse --short :/sixth  ) sixth
$(git rev-parse --short :/fifth  ) fifth
$(git rev-parse --short :/fourth ) fourth
$(git rev-parse --short :/third  ) third
$(git rev-parse --short :/second ) second
$(git rev-parse --short :/initial) initial
# Note that these commits are intentionally listed out of order.
last_three="$(git rev-parse :/fourth :/sixth :/fifth)"
$(git rev-parse --short :/sixth ) sixth
$(git rev-parse --short :/fifth ) fifth
$(git rev-parse --short :/fourth) fourth
	git log --no-walk --oneline $last_three > actual &&
	git log --no-walk=sorted --oneline $last_three > actual &&
=== $(git rev-parse --short :/sixth ) sixth
=== $(git rev-parse --short :/fifth ) fifth
=== $(git rev-parse --short :/fourth) fourth
	git log --line-prefix="=== " --no-walk --oneline $last_three > actual &&
$(git rev-parse --short :/fourth) fourth
$(git rev-parse --short :/sixth ) sixth
$(git rev-parse --short :/fifth ) fifth
	git log --no-walk=unsorted --oneline $last_three > actual &&
	git show --oneline -s $last_three > actual &&
	test_cmp_graph
	test_cmp_graph --line-prefix="123 "
	test_cmp_graph --date-order
	test_cmp_graph --line-prefix="| | | " --date-order
	lib_test_cmp_colored_graph --date-order --format=%s
	test_cmp_graph --date-order
| | index BEFORE..AFTER
| | |   index BEFORE..AFTER
| |   index BEFORE..AFTER
|   index BEFORE..AFTER
| | | | index BEFORE..AFTER
| | | |   index BEFORE..AFTER
| | | | index BEFORE..AFTER
| | | | index BEFORE..AFTER
| | |   index BEFORE..AFTER
| | | index BEFORE..AFTER
| |   index BEFORE..AFTER
|   index BEFORE..AFTER
|   index BEFORE..AFTER
| index BEFORE..AFTER 100644