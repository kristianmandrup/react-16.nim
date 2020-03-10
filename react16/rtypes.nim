import jsffi

type
  Context*{.importc.} = JsObject
  Consumer*{.importc.} = JsObject
  Producer*{.importc.} = JsObject
  ReactGlobal*{.importc.} = JsObject
    version*: cstring
  ReactDOMGlobal*{.importc.} = JsObject
    version*: cstring
  ReactComponent*{.importc.} = JsObject
  ReactNode*{.importc.} = JsObject
  EventTarget* = JsObject
    value*: cstring
  Event* = JsObject
    target*: EventTarget
    `type`*: cstring
  Attrs* = JsObject
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
