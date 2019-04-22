// This example throws ReferenceError because X is not defined.
// Variable hoisting does not happen with const keyword.
; (function () {
  try {
    // ReferenceError
    console.log('X:', X) // eslint-disable-line no-use-before-define
    const X = 10
  } catch (e) {
    console.log('e:', e.toString())
  }
})()
console.log()

// This example shows that variables declared with const have block scope.
; (function () {
  const X = 10
  console.log('block 0: X:', X) // 10

  {
    const X = 20
    console.log('block 2: X:', X) // 20
  }

  console.log('block 0: X:', X) // 10
})()
console.log()

// This example shows that a const cannot be redeclared or reassigned.
; (function () {
  const X = 10
  console.log('X:', X)

  // SyntaxError: Identifier 'X' has already been declared
  // const X = 10

  try {
    // TypeError
    X = 20 // eslint-disable-line no-const-assign
  } catch (e) {
    console.log('e:', e.toString())
  }
})()

// const must be assigned a value.
; (function () {
  // SyntaxError: Missing initializer in const declaration
  // const X
})()
