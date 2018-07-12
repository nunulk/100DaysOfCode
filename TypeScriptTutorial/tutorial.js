"use strict";
// https://tutorialzine.com/2016/07/learn-typescript-in-30-minutes
var __extends = (this && this.__extends) || (function () {
    var extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
exports.__esModule = true;
// 1. Primitives
var burger = 'hamburger', calories = 300, tasty = true;
function speak(food, energy) {
    console.log("Our " + food + " has " + energy + " calories.");
}
console.log('===== 1. Primitives =====');
speak(burger, calories);
function speak2(food) {
    console.log("Our " + food.name + " has " + food.calories + " calories.");
}
var ice_cream = {
    name: 'ice cream',
    calories: 200
};
console.log('===== 2. Interface =====');
speak2(ice_cream);
// 3. Class
var Menu = /** @class */ (function () {
    function Menu(items, pages) {
        this.items = items;
        this.pages = pages;
    }
    Menu.prototype.show = function () {
        console.log('Our menu for today:');
        console.log(this.items.join(',') + " in " + this.pages + " page(s).");
    };
    return Menu;
}());
var sundayMenu = new Menu(['pancakes', 'waffles', 'orange juice'], 1);
console.log('===== 3. Class =====');
sundayMenu.show();
var HappyMeal = /** @class */ (function (_super) {
    __extends(HappyMeal, _super);
    function HappyMeal() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    HappyMeal.prototype.show = function () {
        console.log('Our special menu for children:');
        console.log(this.items.join(',') + " in " + this.pages + " page(s).");
    };
    return HappyMeal;
}(Menu));
var specialChildrenMenu = new HappyMeal(['candy', 'drink', 'toy'], 2);
specialChildrenMenu.show();
// 4. Generics
console.log('===== 4. Generics =====');
function genericFunc(argument) {
    var arrayOfT = [];
    arrayOfT.push(argument);
    return arrayOfT;
}
var arrayFromString = genericFunc('beep');
console.log(arrayFromString);
console.log(typeof arrayFromString[0]);
var arrayFromNumber = genericFunc(42);
console.log(arrayFromNumber);
console.log(typeof arrayFromNumber[0]);
// 5. Modules
var module_1 = require("./module");
module_1.sayHi();
// 6. Intersection Types
console.log('===== 6. Intersection Types =====');
function extend(first, second) {
    var result = {};
    for (var id in first) {
        result[id] = first[id];
    }
    for (var id in second) {
        if (!result.hasOwnProperty(id)) {
            result[id] = second[id];
        }
    }
    return result;
}
var Person = /** @class */ (function () {
    function Person(name) {
        this.name = name;
    }
    return Person;
}());
var ConsoleLogger = /** @class */ (function () {
    function ConsoleLogger() {
    }
    ConsoleLogger.prototype.log = function () {
        console.log('ConsoleLogger.log');
    };
    return ConsoleLogger;
}());
var jim = extend(new Person('Jim'), new ConsoleLogger());
jim.log();
