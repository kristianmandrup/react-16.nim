import dom, react16/rtypes, react16/reactapi
from react16/rglobals import React

{.experimental: "callOperator".}

when not defined(js):
  {.error: "React.nim is only available for the JS target".}

macro defineComponent*(body: untyped): auto =
  if body.kind == nnkStmtList:
    result = body
    for x in getAst(addMethods(result)):
      result.add(x)
  else:
    result = newStmtList(body)
    for x in getAst(addMethods(body)):
      result.add(x)

{.push importcpp.}
proc `()`*[P](c: ReactComponent, p: P): ReactNode =
  React.createElem(c, p)
{.pop.}
