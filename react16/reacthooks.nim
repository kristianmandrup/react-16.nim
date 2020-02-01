import macros, jsffi
import react

type
  State* = JsObject
  Context* = JsObject
  Reference* = JsObject
    current*: auto

# please note that seqs cannot have differing types, even in the js target 
proc tuplifyState(self: seq[JsObject]): tuple[state, setter: JsObject] = 
(state: self[0], setter: self[1])
  
proc useStateImpl(react: ReactGlobal, initialState: State): seq[JsObject] {.importjs "useState".}

proc useState*(react: ReactGlobal, initialState: State): tuple(state: JsObject, setterFn: proc(newState: JsObject)) =
  tuplifyState(useStateImpl(react, initialState))

{.push importjs.}  
proc useEffect*(react: ReactGlobal, didUpdate: proc())
proc useEffect*(react: ReactGlobal, didUpdate: proc(), triggerDependencies: seq[auto])
proc useContext*(react: ReactGlobal, context: JsObject): Context
proc useReducer*(react: ReactGlobal, reducer: proc(): auto)
proc useReducer*(react: ReactGlobal, reducer: proc(): auto, initialArg: auto)
proc useReducer*(react: ReactGlobal, reducer: proc(): auto, initialArg: auto, init: proc())
proc useCallback*(react: ReactGlobal, callback: proc())
proc useCallback*(react: ReactGlobal, callback: proc(), triggerDependencies: auto)
proc useMemo*(react: ReactGlobal, createFn: proc(), recomputeDependencies: auto)
proc useRef*(react: ReactGlobal, react: ReactGlobal): Reference
proc useImperativeHandle*(react: ReactGlobal, reference: Reference, createHandle: proc())
proc useImperativeHandle*(react: ReactGlobal, reference: Reference, createHandle: proc(), 
    dependencies: sea[auto])
proc useLayoutEffect*(react: ReactGlobal, didUpdate: proc())
proc useLayoutEffect*(react: ReactGlobal, didUpdate: proc(), triggerDependencies: seq[auto])
proc useDebugValue*(react: ReactGlobal, initialState: auto): auto

# concurrent mode hooks (experimental) - see https://reactjs.org/docs/concurrent-mode-reference.html
proc useTransition*(react: ReactGlobal, suspenseConfig: JsObject): auto
proc useDeferredValue*(react: ReactGlobal, value: auto): auto 
proc useDeferredValue*(react: ReactGlobal, value: auto, suspenseConfig: JsObject): auto 
