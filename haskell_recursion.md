title: Recursion in Haskell
author: Martino Visintin
output: presentation.html
controls: false

--

# Silly Recursion Example
## a.k.a. Haskell, Recursion, Orders of Growth, Tail Recursion, Tail Call Optimisation, the Universe and Everything

--

### Mutable state in Haskell: Nope.
<!-- Haskell being a purely functional language.. -->

```haskell
x = 1
x = 2 -- ERROR: multiple declarations of x
```

And, this code, no matter where it is:

```haskell
 -- some code
x = x + 1
```

... is **always**, **always** gonna be either:

- a compiler error (... if `some code` already declared x)
- an infinite loop (~~well actually~~ a runtime exception on the evaluation of x)

--

### Factorials!

This sort of thing ain't gonna fly well with Haskell:

```ruby
def factorial(n)
  result = 1
  while(n > 1) do   # <~ no while/for loops in haskell
    result *= n     # <~ state mutation, definitely a no-no
    n -= 1          # <~ OH my! more state mutation!
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
  -- execution                            -- +-------> time
λ ↦ factorial 4                           -- |
  = 4 * factorial 3                       -- |
  = 4 * 3 * factorial 2                   -- v space
  = 4 * 3 * 2 * factorial 1
  = 4 * 3 * 2 * 1 * factorial 0 -- BAM! base case
  = 4 * 3 * 2 * 1 * 1
  = 24
```

<!-- now if we consider the length as time and the
  width as memory.. -->

```
# Performance:
  time: O(n)
memory: O(n)  <= ಠ_ಠ . Booo, we know this can be done in O(1)!
```

--

### Accumulator `factorial` to the rescue

The accumulator factorial is sort of the dirtier, fouler mouthed sibling of
`factorial`. But it works with `O(1)` memory:

```haskell
facc 0 a = a
facc n a = facc (n-1) (a*n)
```

--

### Performance

```haskell
facc 0 a = a
facc n a = facc (n-1) (a*n)
```

```haskell
  -- execution (sort of.)
λ ↦ facc 4 1
  = facc 3 4
  = facc 2 12
  = facc 1 24
  = facc 0 24
  = 24
```

```
# Performance:
  time:  O(n)
memory:  O(1) (^__^)
```

--

### Tail Recursion

--

### Tail Call optimisation

