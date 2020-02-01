import macros, dom, jsffi, react16/types

when not defined(js):
  {.error: "React.nim is only available for the JS target".}

var
  React*{.importc, nodecl.}: ReactGlobal
  ReactDOM*{.importc, nodecl.}: ReactDOMGlobal

type
  Component*[P, S] = JsObject
    props*: P
    state*: S
    setState*{.importcpp.}: proc(s: S)
  StatelessComponent*[P] = Component[P, void]