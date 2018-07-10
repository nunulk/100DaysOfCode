//// http://www.typescriptlang.org/docs/handbook/basic-types.html
// 1. Basic Types
// skip boolean, string, number, array
// tuple
var t = ['Jan', 1];
// t = [1, 'Jan'] // error
console.log(t);
t[0] = 'Feb';
t[1] = 2;
console.log(t);
// enum
var Color;
(function (Color) {
    Color[Color["Red"] = 0] = "Red";
    Color[Color["Green"] = 1] = "Green";
    Color[Color["Blue"] = 2] = "Blue";
})(Color || (Color = {}));
var c = Color.Green;
console.log(c);
var State;
(function (State) {
    State[State["Ok"] = 0] = "Ok";
    State[State["Failed"] = 1] = "Failed";
})(State || (State = {}));
var s = State[0];
console.log(s);
// any
var notSure = 4;
console.log(notSure);
notSure = 'maybe a string';
console.log(notSure);
// void
function show() {
    var argument = [];
    for (var _i = 0; _i < arguments.length; _i++) {
        argument[_i] = arguments[_i];
    }
    console.log(argument);
}
show(4, 'hello', [0, 1, 2]);
// object
var f = require('./module-functions');
create({ prop: 0 });
create(null);
//create(42)
//create('string')
//create(false)
create(undefined);
