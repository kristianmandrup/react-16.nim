import macros, jsffi
import react

type
  State* = ref object
  Context* = ref object
  Reference* = ref object
    current*: auto

{.push importcpp.}
proc useState*(): auto
proc useState*(initialState: State): auto
proc useEffect*(didUpdate: proc()): auto
proc useEffect*(didUpdate: proc(), triggerDependencies: auto): auto
proc useContext(context: ref object): Context
proc useReducer(reducer: proc()): auto
proc useReducer(reducer: proc(), initialArg: auto): auto
proc useReducer(reducer: proc(), initialArg: auto, init: proc()): auto
proc useCallback*(callback: proc()): auto
proc useCallback*(callback: proc(), triggerDependencies: auto): auto
proc useMemo*(createFn: proc(), recomputeDependencies: auto): auto
proc useRef*(): Reference
proc useImperativeHandle*(reference: Reference, createHandle: proc())
proc useImperativeHandle*(reference: Reference, createHandle: proc(),
    dependencies: auto)
proc useLayoutEffect*(didUpdate: proc()): auto
proc useLayoutEffect*(didUpdate: proc(), triggerDependencies: auto): auto
proc useDebugValue*(initialState: auto): auto

# concurrent mode hooks (experimental) - see https://reactjs.org/docs/concurrent-mode-reference.html
proc useTransition*(suspenseConfig: ref object): auto
proc useDeferredValue*(value: auto): auto
proc useDeferredValue*(value: auto, suspenseConfig: ref object): auto
{.pop.}
