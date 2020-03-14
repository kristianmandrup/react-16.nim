import macros, dom, jsffi, react16/rtypes, react16/rglobals, react16/reactapi

{.experimental: "callOperator".}

when not defined(js):
  {.error: "React.nim is only available for the JS target".}

{.push importcpp.}
proc `()`*[P](c: ReactComponent, p: P): ReactNode =
  React.createElement(c, p)
{.pop.}
