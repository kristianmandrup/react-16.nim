import macros, jsffi
import react

type
  State* = JsObject
  Context* = JsObject
  Reference* = JsObject
    current*: auto

proc useState*(): seq[auto] {. importjs "React.useState" .}
proc useState*(initialState: State): seq[auto] {. importjs "React.useState" .}
proc useEffect*(didUpdate: proc(), triggerDependencies: seq[auto]) {. importjs "React.useEffect" .}
proc useContext*(context: JsObject): Context {. importjs "React.useContext" .}
proc useReducer*(reducer: proc(), initialArg: auto) {. importjs "React.useReducer" .}
proc useReducer*(reducer: proc(), initialArg: auto, init: proc()) {. importjs "React.useReducer" .}
proc useCallback*(callback: proc(), triggerDependencies: seq[auto]) {. importjs "React.useCallback" .}
proc useMemo*(createFn: proc(), recomputeDependencies: seq[auto]) {. importjs "React.useMemo" .}
proc useRef*(): Reference {. importjs "React.useRef" .}

proc useImperativeHandle*(reference: Reference, createHandle: proc(), 
    dependencies: sea[auto]) {. importjs "React.ImperativeHandle" .}

proc useLayoutEffect*(didUpdate: proc(), triggerDependencies: seq[auto]) {. importjs "React.useLayoutEffect" .}
proc useDebugValue*(initialState: auto): auto {. importjs "React.useDebugValue" .}

# concurrent mode hooks (experimental) - see https://reactjs.org/docs/concurrent-mode-reference.html
proc useTransition*(suspenseConfig: JsObject): auto {. importjs "React.useTransition" .}

proc useDeferredValue*(value: auto, suspenseConfig: JsObject): auto {. importjs "React.useDeferredValue" .}
