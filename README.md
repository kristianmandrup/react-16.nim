# React.nim

This library provides [React.js](https://facebook.github.io/react) 16.x bindings for
Nim (Work In Progress - WIP). 

Note: This repo is a [fork of react.nim](https://github.com/andreaferretti/react.nim)

Please help out test these bindings and improve them... :)

## Status

Library has not been tested and might well contain errors. Please help make this library fully working and functional ;)

## Quick start

```nim
import dom, jsconsole, jsffi, strutils, sequtils, sugar
import react16
from react16/reactdom import ul, li, input, `div`
from react16/rhooks import useState # , useEffect, useContext

proc main(): ReactComponent =
  var state = useState(")
  var searchStr = state[0]
  var updateSearch = state[1]
  `div`(
    Attrs{style: react.Style{marginTop: 50}},
    `div`(Attrs{className: "row"},
      `div`(Attrs{className: "col-md-4"},
        searchComponent(ValueLink(
          value: searchStr,
          setValue: updateSearch
        ))
    ))
  )

proc startApp() {.exportc.} =
  console.log React.version
  let
    countries = Countries(countries: @[
      Country(name: "Italy", population: 59859996),
    ])
    content = document.getElementById("content")
    App = main(countries)
  ReactDOM.render(App, content)
```

You can `import react16/reacthooks` if you prefer to always operate on the React global object.

```nim
import react16/reacthooks

proc counter*(): Element =
  var state = React.useState(0)
  # ...
```

## Types

The fundamental building block exposed in React.nim is the type

```nim
type Component[P, S] = ...
```

where `P` are the props and `S` is the state, as well as the type alias

```nim
type StatelessComponent[P] = Component[P, void]
```

For your components, it is useful to define your own type aliases, such as in
the example app:

```nim
import react16

type
  ValueLink = ref object of RootObj
    value: string
    handler: proc(s: string)
  Search = ref object of StatelessComponent[ValueLink]
```

The type `Component[P, S]` exists only on the Nim side and serves the purpose
of checking types on the props and the state of a component. The actual JS
object that is created by defining a component has the type `ReactComponent`.

Once one has a `ReactComponent`, one can instantiate it with props and
obtain a `ReactNode`. Also, there are factory functions such as `p` or `span`
to create `ReactNode` instances for DOM elements.

## Defining a component

Once you have your component types, use the `defineComponent` macro. Inside
the body of `defineComponent` you can use any function in the
[component lifecycle](https://facebook.github.io/react/docs/component-specs.html).

The only mandatory one - which is used to infer the types of props and state -
is `renderComponent`. You can use any other lifecycle method such as
`componentWillMount` or `componentDidUpdate`. If the state `S` is not `void`,
`getInitialState(props: P): S` is also mandatory.

An example without state, from the example app, is

```nim
proc createInc(setNumber: proc(number: int), number: int) =
  proc() = setNumber(number + 1)

proc makeCounter(): ReactComponent =
  var [counter, setCounter] = useState(0)
  let increaseCounter = createInc(setCounter, counter)
  p(
    span(attrs(className = "number"), counter)
    button(attrs(onClick = increaseCounter))
    )

let counterC = makeCounter()
```

As shown above, once you have the definition, you want to export a single
instance of the React class - here we do that by `let counterC = makeCounter()`.
The value `counterC` is what is used in Javascript to represent a component,
hence calling `makeCounter()` two times will give rise to two
unrelated counter components.

### Passing props to component

In order to pass props to components, one can use the API

```nim
let node = React.createElement(myComponent, myProps)
```

To make this look more natural, as in JSX, the `()` operator is overloaded
on components, hence the above can be written as

```nim
let node = myComponent(myProps)
```

## Using the DOM

The `reactdom` module exports factory methods for all DOM elements supported by
React. These are just procs that can be called with a variable number of
children (up to 4 for now).

Children can be `string`, `cstring` or other React nodes, for instance

```nim
from react16/reactdom import p, span

let node = p(span("hello"), "world")
```

The module `reactdom` exports *a lot* of functions, hence it is more convenient
to cherry-pick the ones to import.

Notice that tags such as ``div`` and ``object`` have to be written with
backticks.

### `Attrs` and `attrs`

HTML attributes can be passed to factory functions such as `p`, by adding
a first argument of type `Attrs`, which is defined by

```nim
Attrs* = ref object
  # actually, there are many more fields...
  onClick* {.exportc.}, onChange* {.exportc.}: proc(e: Event)
  className* {.exportc.}, id* {.exportc.}, key* {.exportc.}, placeholder* {.exportc.},
    target* {.exportc.}, value* {.exportc.}: cstring
  checked* {.exportc.}, readOnly* {.exportc.}, required* {.exportc.}: bool
  style* {.exportc.}: Style
  # plenty of more atributes...
```

It is actually not convenient to instantiate `Attrs` directly, because it has
many fields, and even unused fields would end up in the generated JS object,
with a value of `null`.

The `attrs` macro takes care of constructing an instance of `Attrs` while
only populating the field that are passed in. Hence, in order to add a class,
say `warning`, to the `span` in the example above, one would write

```nim
let node = p(span(attrs(className = "warning"), "hello"), "world")
```

### `Style` and `style`

One of the possible attributes is `style`, which has the type `Style` and can
be used to style HTML elements. The type `Style` is defined by

```nim
Style* = ref object
  # actually, there are many more fields...
  color* {.exportc.}, backgroundColor* {.exportc.}: cstring
  marginTop* {.exportc.}, marginBottom* {.exportc.}, marginLeft* {.exportc.},
    marginRight* {.exportc.}: int
  # plenty of more style attributes...
```

A similar remark to `Attrs` applies: it is not convenient to create a `Style`
object directly - using the `style` macro will produce a JS object with only
the relevant fields populated.

Hence, to add a background color of red to the above example, one would write

```nim
let node = p(
  attrs(style = style(backgroundColor = "red")),
  span(attrs(className = "warning"), "hello"),
  "world")
```

### Using SVG

For SVG tags there is another module called `reactsvg`. It works the same as
`reactdom`, but functions defined in `reactsvg` accept a parameter of type
`SvgAttrs` instead of `Attrs`. This is defined by

```nim
import react16/reactsvg

SvgAttrs* = ref object
  # actually, there are many more fields...
  onClick* {.exportc.}: proc(e: Event)
  className* {.exportc.}, id* {.exportc.}, key* {.exportc.},
    stroke* {.exportc.}, fill* {.exportc.}, transform* {.exportc.}: cstring
```

It is more convenient to use the `svgAttrs` macro to generate
instances.

## The top level

To actually start an application, once you have defined a component, you can
call

```nim
import dom # from the Nim stdlib

let
  content = document.getElementById("some-id")
  ComponentInstance = myComponent(someProps)

ReactDOM.render(ComponentInstance, content)
```

To enable [React concurrent mode](https://reactjs.org/docs/concurrent-mode-reference.html) (aka Suspense)
use `ReactDOM.createRoot` instead of `ReactDOM.render`

```nim
const App = app(countries)
ReactDOM.createRoot(rootNode).render(App);
```

If you have the functions such as `createRoot` and `render` directly bound and available, you can 
instead `import react16/rapi` where these functions can be used directly as follows:

```nim
Main = topLevel(countries)
createRoot(rootNode).render(Main)
```

## Hooks

The following hooks are available via `react16/reacthooks` and `react16/rhooks`

- `useState(value: auto): seq[auto]`
- `useEffect(didUpdate: proc(), triggerDependencies: seq[auto])`
- `useReducer(reducer: proc(), initialArg: auto, init: proc())`
- `useContext(context: JsObject): Context`
- `useCallback(callback: proc(), triggerDependencies: seq[auto])`
- `useMemo(createFn: proc(), recomputeDependencies: seq[auto])`
- `useRef(): Reference`
- `useImperativeHandle(reference: Reference, createHandle: proc())`
- `useLayoutEffect(didUpdate: proc(), triggerDependencies: seq[auto])`
- `useDebugValue(initialState: auto)`

See usage in `example/app.nim` folder).

To use hooks on `React` global var, `import react16/reacthooks` as use as follows:

```nim
proc search(): ReactComponent =
  var (query, setQuery) = React.useState('')
  # ...
```

If you import or bind to the hook methods directly (f.ex via [esmodule](https://github.com/kristianmandrup/esmodule_nim))
you can use `import react16/rhooks` as follows:

```nim
import react16
import react16/rhooks

# injects and binds var useState (via ES module import)
esImportVar("useState", "react")

proc search(): ReactComponent =
  var (query, setQuery) = useState('')
  # ...
```

Concurrency mode hooks (aka Suspense) for async render mode

- `useTransition(suspenseConfig: JsObject)`
- `useDeferredValue(value: auto, suspenseConfig: JsObject)`

## Events

To be documented

## Example app

The example app uses

- Bootstrap 4.4.1
- React DOM 16.12.0
- React 16.12.0

## Todo

- Distinguish between keyboard and mouse events. Make sure that one
  has access to all relevant information in the event callbacks
- Add dedicated types, together with converters to string, to generate SVG
  transforms and CSS dimensions and colors in a typesafe way
