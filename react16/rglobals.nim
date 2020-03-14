import ../react16, react16/rtypes

when not defined(js):
  {.error: "React.nim is only available for the JS target".}

var
  React*{.importc, nodecl.}: ReactGlobal
  ReactDOM*{.importc, nodecl.}: ReactDOMGlobal

type
  Component*[P, S] = ref object of RootObj
    props*: P
    state*: S
    setState*{.importcpp.}: proc(s: S)
  StatelessComponent*[P] = Component[P, void]