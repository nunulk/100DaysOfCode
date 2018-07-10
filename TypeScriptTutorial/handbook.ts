//// http://www.typescriptlang.org/docs/handbook/basic-types.html

// 1. Basic Types

// skip boolean, string, number, array

// tuple

let t: [string, number] = ['Jan', 1]
// t = [1, 'Jan'] // error

console.log(t)

t[0] = 'Feb'
t[1] = 2

console.log(t)

// enum

enum Color { Red, Green, Blue }

const c: Color = Color.Green

console.log(c)

enum State { Ok = 0, Failed = 1 }

const s: string = State[0]

console.log(s)

// any

let notSure: any = 4

console.log(notSure)

notSure = 'maybe a string'

console.log(notSure)

// void

function show(...argument): void {
	console.log(argument)
}

show(4, 'hello', [0, 1, 2])

// object

