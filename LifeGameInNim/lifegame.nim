import unittest

proc main() =
  echo "Hello, World."

when isMainModule:
  main()

suite "Life Game":
  echo "test"

  test "test 1":
    check(1 == 1)