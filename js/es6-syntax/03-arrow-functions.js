let f
    
// The parameter list for a function with no parameters should be
// written with a pair of parentheses.
f = () => {console.log(10)}
f()
console.log()

// (param1, param2, ..., paramN) => { statements }
f = (a, b, c) => {
  console.log(a)
  console.log(b)
  console.log(c)
  console.log()
}
f(10, 20, 30)

// (param1, param2, ..., paramN) => expression
// equivalent to: => { return expression; }
f = (a, b, c) => {return a + b + c}
console.log('f(10, 20, 30):', f(10, 20, 30))

f = (a, b, c) => a + b + c
console.log('f(10, 20, 30):', f(10, 20, 30))
console.log()

// Parentheses are optional when there's only one parameter name
f = (a) => {console.log(a)}
f(10)

f = a => {console.log(a)}
f(10)

// This is equivalent to the above function.
f = a => console.log(a)
f(10)
console.log()

// This is not a function that returns object literal. Because braces
// after the arrow indicates function body.
//
// SyntaxError: Unexpected token :
// f = () => {'foo': 1, bar: 2}

// Parenthesize the body of function to return an object literal expression.
f = () => ({'foo': 1, bar: 2})
console.log(f())
console.log()

// Rest parameters are supported
f = (a, b, ...rest) => {
    console.log('a:', a)
    console.log('b:', b)
    console.log('rest:', rest)
}
f(10, 20, 30, 40, 50)
console.log()

// Default parameters are supported
f = (a, b, c = 100, d = 200) => {
    console.log('a:', a)
    console.log('b:', b)
    console.log('c:', c)
    console.log('d:', d)
}
f(10, 20, 30)
console.log()

// Destructuring within the parameter list is also supported
f = ([a, b] = [10, 20], {x: c} = {x: a + b}) => { console.log(a + b + c) }
f()
console.log()

let colors = [
    'red',
    'green',
    'blue'
]

// Example of how an anonymous function is simplified with arrow
// function expression.
let x = colors.map(function(color) {
    return color.length
})
console.log(x)

x = colors.map((color) => {
    return color.length
})
console.log(x)

x = colors.map(color => color.length)
console.log(x)
