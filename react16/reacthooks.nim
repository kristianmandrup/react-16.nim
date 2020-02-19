import macros, jsffi
import react

type
  State* = JsObject
  Context* = JsObject
  Reference* = JsObject
    current*: auto


{.push importjs.}  
proc useState*(react: ReactGlobal, initialState: State): tuple(state: JsObject, setterFn: proc(newState: JsObject))

proc useEffect*(react: ReactGlobal, didUpdate: proc(), triggerDependencies: seq[auto])
proc useContext*(react: ReactGlobal, context: JsObject): Context
proc useReducer*(react: ReactGlobal, reducer: proc(): auto, initialArg: auto, init: proc())

proc useCallback*(react: ReactGlobal, callback: proc(), triggerDependencies: auto)
proc useMemo*(react: ReactGlobal, createFn: proc(), recomputeDependencies: auto)
proc useRef*(react: ReactGlobal, react: ReactGlobal): Reference

proc useImperativeHandle*(react: ReactGlobal, reference: Reference, createHandle: proc(), 
    dependencies: sea[auto])

proc useLayoutEffect*(react: ReactGlobal, didUpdate: proc(), triggerDependencies: seq[auto])
proc useDebugValue*(react: ReactGlobal, initialState: auto): auto

# concurrent mode hooks (experimental) - see https://reactjs.org/docs/concurrent-mode-reference.html
proc useTransition*(react: ReactGlobal, suspenseConfig: JsObject): auto

proc useDeferredValue*(react: ReactGlobal, value: auto, suspenseConfig: JsObject): auto 
