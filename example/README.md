# Sample Nim React app

This sample Nim React app aims to demonstrate how to use React 16.x with Hooks using Nim 1.0.

## Build

`nim js app.nim`

## Run

Open `index.html` in the browser

`open index.html`

## USage

To use hooks on `React` global var, `import react16/reacthooks` as use as follows:

```nim
proc search(): ReactComponent =
  var (query, setQuery) = React.useState('')
  # ...
```

If you import or bind to the hook methods directly you can use `import react16/rhooks` as follows:

```nim
import react16
import react16/rhooks

var useState = React.useState

proc search(): ReactComponent =
  var (query, setQuery) = useState('')
  # ...
```


## Javascript libraries used

- Bootstrap 4.4.1
- React DOM 16.12.0
- React 16.12.0
