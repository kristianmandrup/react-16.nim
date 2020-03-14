import jsffi

type
  Context*{.importc.} = JsObject
  Consumer*{.importc.} = JsObject
  Producer*{.importc.} = JsObject
  ReactGlobal* {.importc.} = ref object of RootObj
    version*: cstring
  ReactDOMGlobal* {.importc.} = ref object of RootObj
    version*: cstring
  ReactDescriptor* [P, S] {.importcpp.} = ref object of RootObj
    render*: proc(): ReactNode
    componentWillMount*: proc(): void
    componentWillUnmount*: proc(): void
    componentDidMount*: proc(): void
    componentWillReceiveProps*: proc(nextProps: P): void
    shouldComponentUpdate*: proc(nextProps: P, nextState: S): bool
    componentWillUpdate*: proc(nextProps: P, nextState: S): bool
    componentDidUpdate*: proc(prevProps: P, prevState: S): bool
    getInitialState*: proc(): S
  ReactComponent* {.importc.} = ref object of RootObj
  ReactNode* {.importc.} = ref object of RootObj
  EventTarget* = ref object
    value*: cstring
  Event* = ref object
    target*: EventTarget
    `type`*: cstring
  Attrs* = ref object of RootObj
    onClick*, onChange*: proc(e: Event)
    key*, `ref`*, dangerouslySetInnerHTML*: cstring

    accept*, acceptCharset*, accessKey*, action*, alt*, capture*,
      cellPadding*, cellSpacing*, challenge*, charSet*, cite*, classID*,
      className*, content*, contextMenu*, coords*, crossOrigin*,
      data*, dateTime*, default*, dir*, download*, encType*, form*,
      formAction*, formEncType*, formMethod*, formTarget*, frameBorder*,
      headers*, href*, hrefLang*, htmlFor*, httpEquiv*, icon*, id*, inputMode*,
      integrity*, keyParams*, keyType*, kind*, label*, lang*, list*,
      manifest*, media*, mediaGroup*, `method`*, name*, nonce*, pattern*,
      placeholder*, poster*, profile*, radioGroup*, rel*, role*, sandbox*,
      scope*, scrolling*, seamless*, shape*, sizes*, span*, src*, srcDoc*,
      srcLang*, srcSet*, summary*, tabIndex*, target*, title*, `type`*,
      useMap*, value*, wmode*, wrap*: cstring

    allowFullScreen*, allowTransparency*, async*, autoComplete*, autoFocus*,
      autoPlay*, checked*, contentEditable*, controls*, `defer`*, disabled*,
      draggable*, formNoValidate*, hidden*, loop*, multiple*, muted*,
      noValidate*, open*, preload*, readOnly*, required*, reversed*,
      scoped*, selected*, spellCheck*: bool

    colSpan*, cols*, height*, high*, low*, marginHeight*, marginWidth*, max*,
      maxLength*, min*, minLength*, optimum*, rowSpan*, rows*, size*, start*,
      step*, width*: cint

    style*: Style
  Style* = ref object
    color*, backgroundColor*: cstring
    marginTop*, marginBottom*, marginLeft*, marginRight*: int