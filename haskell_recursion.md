title: Haskell, Recursion, Orders of Growth buffet
author: Martino Visintin
output: presentation.html
controls: false

--

# Recursion in Haskell
## Haskell, Recursion, Orders of Growth, Tail Recursion, the Universe and Everything

--

### State
<!-- Haskell being a purely functional language.. -->

```haskell
x = 1
x = 2 -- ERROR: multiple declarations of x
```

So, this code:

```haskell
 -- some code
x = x + 1
```

... is **always** gonna be:

- a compiler error (if `some code` contains a previous declaration of x)
- an infinite loop (runtime exception on evaluation of x)

--

### OMG Factorials!

This sort of thing ain't gonna fly for shure:

```ruby
def factorial(n)
  result = 1
  while(n > 1) do   # no while loop in haskell
    result *= n     # state mutation
    n -= 1          # more state mutation
  end
  return result
end
```
<!-- so forget it, you're not gonna be able to change state (..well, you can
but it needs an M-word.. I don't wanna go there) -->

<!-- So we need a different approach. Recursion is the bread and butter of iteration
and looping in Haskell, as it is in most Lisps) -->

<!-- So back to recursion, I've promised I'd talk about that.
Let's give it a shot in Haskell. -->

So we write this instead:
```haskell
factorial 0 = 1
factorial n = n * factorial(n-1)
```

--

### Performance

```haskell
factorial 0 = 1
factorial n = n * factorial(n-1)
```

```haskell
  -- execution
λ ↦ factorial 4
  ↦ 4 * factorial 3
  ↦ 4 * 3 * factorial 2
  ↦ 4 * 3 * 2 * factorial 1
  ↦ 4 * 3 * 2 * 1 * factorial 0 -- BAM! base case
  ↦ 4 * 3 * 2 * 1 * 1
  ↦ 12 * 2 * 1 * 1
  ↦ 24 * 1 * 1
  ↦ 24
```

<!-- now if we consider the length as time and the
  width as memory.. -->

```
Performance:
  time:  2n + 1   ==>  O(n)
memory:  n + 1    ==>  O(n)
```

--

# Cool, we're done.
## `factorial` is always gonna be `O(n)` in time anyway.
## ... and we're not gonna bother with the constant factors.

--

### ~~Well actually...~~

```
Performance:
  time:  2n + 1   ==>  O(n)
memory:  n + 1    ==>  O(n)
```

Even if we don't care about the constant factor `2`, we still have a memory
usage of `O(n)`.

--

### Introducing the accumulator `factorial`

The accumulator factorial is sort of the dirtier, fouler
mouthed sibiling of `factorial`. In practice it is twice
as fast.

```haskell
facc 0 a = a
facc n a = facc (a*n) (n-1)
```

--

## Performance

```haskell
facc 0 a = a
facc n a = facc (a*n) (n-1)
```

```haskell
  -- execution (sort of.)
λ ↦ facc 4 1
  ↦ facc (1*4) (4-1)
  ↦ facc (4*3) (3-1)
  ↦ facc (12*2) (2-1)
  ↦ facc (24*1) (1-1)
  ↦ facc 24 0
  ↦ 24
```

```
Performance:
  time:  n + 1    ==>  O(n)
memory:  k        ==>  O(1)
```


