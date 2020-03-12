
import macros, jsffi
import react16

type
  History* = JsObject

  Location* = JsObject
    pathname*: string
  RouteMatch* = JsObject
  path*: string
  strict*: bool
  sensitive*: bool

{.push importjs.}  
proc useLocation(): Location
proc useHistory(): History
proc useParams[T](): T
proc useRouteMatch(RouteMatch): auto

proc push(history: History, path: string)
proc goBack(history: History)
proc goForward(history: History)
