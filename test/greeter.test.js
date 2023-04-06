const test = require('ava')
const Greeter = require('../src/greeter.js')

test('says hello', t => {
    t.is('hello world', Greeter.greet())
})

test('greets by name', t => {
    t.is('hello bob', Greeter.greet('bob'))
})
