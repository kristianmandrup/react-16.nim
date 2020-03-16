import dom, react16/rtypes, react16/reactapi
from react16/rglobals import React

{.experimental: "callOperator".}

when not defined(js):
  {.error: "React.nim is only available for the JS target".}

{.push importcpp.}
proc `()`*[P](c: ReactComponent, p: P): ReactNode =
  React.createElem(c, p)
{.pop.}
