// https://tutorialzine.com/2016/07/learn-typescript-in-30-minutes

// 1. Primitives
const
	burger: string = 'hamburger',
	calories: number = 300,
	tasty: boolean = true

function speak(food: string, energy: number): void {
  console.log(`Our ${food} has ${energy} calories.`)
}

console.log('===== 1. Primitives =====')
speak(burger, calories)

// 2. Interface

interface Food {
    name: string
    calories: number
}

function speak2(food: Food): void {
  console.log(`Our ${food.name} has ${food.calories} calories.`);
}

const ice_cream = {
  name: 'ice cream',
  calories: 200,
}

console.log('===== 2. Interface =====')
speak2(ice_cream)

// 3. Class

class Menu {
	items: string[]
	pages: number

	constructor(items: string[], pages: number) {
		this.items = items
		this.pages = pages
	}

	show(): void {
		console.log('Our menu for today:')
		console.log(`${this.items.join(',')} in ${this.pages} page(s).`)
	}
}

const sundayMenu = new Menu(['pancakes', 'waffles', 'orange juice'], 1)

console.log('===== 3. Class =====')
sundayMenu.show()

class HappyMeal extends Menu {

	show(): void {
		console.log('Our special menu for children:')
		console.log(`${this.items.join(',')} in ${this.pages} page(s).`)
	}
}

const specialChildrenMenu = new HappyMeal(['candy', 'drink', 'toy'], 2)

specialChildrenMenu.show()


// 4. Generics

console.log('===== 4. Generics =====')

function genericFunc<T>(argument: T): T[] {
	const arrayOfT: T[] = []
	arrayOfT.push(argument)
	return arrayOfT
}

const arrayFromString = genericFunc<string>('beep')

console.log(arrayFromString)
console.log(typeof arrayFromString[0])

const arrayFromNumber = genericFunc(42)

console.log(arrayFromNumber)
console.log(typeof arrayFromNumber[0])

// 5. Modules

import { sayHi } from './module'

sayHi()
