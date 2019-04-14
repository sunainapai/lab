// This example throws ReferenceError because x is not defined yet.
; (function () {
  try {
    console.log('x:', x) // ReferenceError
  } catch (e) {
    console.log('e:', e.toString())
  }
})()
console.log()

// This example does not throw ReferenceError because x is defined due
// to variable hoisting.
; (function () {
  console.log('x:', x) // undefined
  var x = 10
  console.log('x:', x) // 10
})()
console.log()

// This example throws ReferenceError because x is not defined.
// Variable hoisting does not happen with let keyword.
; (function () {
  try {
    console.log('x:', x) // ReferenceError
    let x = 10
  } catch (e) {
    console.log('e:', e.toString())
  }
})()

// This example shows that variables declared with let have block scope.
// They can be reassigned but not redeclared in the same block.
; (function () {
  let x = 10
  console.log('block 0: x:', x) // 10

  {
    x = 20
    console.log('block 1: x:', x) // 20
  }

  {
    let x = 30
    console.log('block 2: x:', x) // 30

    // Variable declared with let cannot be redeclared.
    //
    // SyntaxError: Identifier 'x' has already been declared
    // let x = 40
  }

  console.log('block 0: x:', x) // 20
})()
console.log()

; (function () {
  let x
  console.log('x:', x) // undefined

  x = 10
  console.log('x:', x) // 10
})()
