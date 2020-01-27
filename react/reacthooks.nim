import macros, jsffi
import react

type
  State* = JsObject
  Context* = JsObject
  Reference* = JsObject
    current*: auto

{.push importcpp.}
proc useState*(): seq[auto]
proc useState*(initialState: State): seq[auto]
proc useEffect*(didUpdate: proc())
proc useEffect*(didUpdate: proc(), triggerDependencies: seq[auto])
proc useContext*(context: JsObject): Context
proc useReducer*(reducer: proc())
proc useReducer*(reducer: proc(), initialArg: auto)
proc useReducer*(reducer: proc(), initialArg: auto, init: proc())
proc useCallback*(callback: proc())
proc useCallback*(callback: proc(), triggerDependencies: auto)
proc useMemo*(createFn: proc(), recomputeDependencies: auto)
proc useRef*(): Reference
proc useImperativeHandle*(reference: Reference, createHandle: proc())
proc useImperativeHandle*(reference: Reference, createHandle: proc(),
    dependencies: sea[auto])
proc useLayoutEffect*(didUpdate: proc())
proc useLayoutEffect*(didUpdate: proc(), triggerDependencies: seq[auto])
proc useDebugValue*(initialState: auto): auto

# concurrent mode hooks (experimental) - see https://reactjs.org/docs/concurrent-mode-reference.html
proc useTransition*(suspenseConfig: JsObject): auto
proc useDeferredValue*(value: auto): auto
proc useDeferredValue*(value: auto, suspenseConfig: JsObject): auto
{.pop.}
