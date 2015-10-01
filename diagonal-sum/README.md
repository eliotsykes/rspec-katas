# Diagonal Sum

Given a "square" array of subarrays, find the sum of values from the first value of the first array, the second value of the second array, the third value of the third array, and so on...

```ruby
# Example 1
example_array = [[1, 0, 0, 0],
                [0, 1, 0, 0],
                [0, 0, 1, 0],
                [0, 0, 0, 1]]

diagonal_sum(example_array) # => 4

Example 2:

example_array = [[1, 0, 0, 0, 0],
                [0, 1, 0, 0, 0],
                [0, 0, 1, 0, 0],
                [0, 0, 0, 1, 0],
                [0, 0, 0, 0, 1]]

diagonal_sum(example_array) # => 5
```
