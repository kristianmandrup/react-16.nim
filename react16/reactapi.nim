import jsffi
from dom import Element, Document
import rtypes, svg_attrs, rglobals

{.experimental: "callOperator".}

{.push importcpp.}
proc createContext*(react: ReactGlobal, context: JsObject): Context
# proc createElem*(react: ReactGlobal, tag: cstring, props: Attrs): ReactNode
# proc createElem*(react: ReactGlobal, tag: cstring, props: Attrs,
#     n1: auto): ReactNode
proc createElem*(react: ReactGlobal, tag: cstring, props: Attrs, n1,
    n2: auto): ReactNode
proc createElem*(react: ReactGlobal, tag: cstring, props: Attrs, n1, n2,
    n3: auto): ReactNode
proc createElem*(react: ReactGlobal, tag: cstring, props: Attrs, n1, n2, n3,
    n4: auto): ReactNode
proc createElem*(react: ReactGlobal, tag: cstring,
    props: SvgAttrs): ReactNode
proc createElem*(react: ReactGlobal, tag: cstring, props: SvgAttrs,
    n1: auto): ReactNode
proc createElem*(react: ReactGlobal, tag: cstring, props: SvgAttrs, n1,
    n2: auto): ReactNode
proc createElem*(react: ReactGlobal, tag: cstring, props: SvgAttrs, n1, n2,
    n3: auto): ReactNode
proc createElem*(react: ReactGlobal, tag: cstring, props: SvgAttrs, n1, n2,
    n3, n4: auto): ReactNode

proc createElem*(react: ReactGlobal, c: ReactComponent,
    props: ref RootObj): ReactNode {.varargs.}
proc createElem*(react: ReactGlobal, c: ReactComponent): ReactNode

proc createElem*(react: ReactGlobal, c: ReactNode,
    props: ref RootObj): ReactNode {.varargs.}
proc createElem*(react: ReactGlobal, c: ReactNode): ReactNode

proc render*(reactDom: ReactDOMGlobal, node: Document, el: Element)

# to enable concurrent mode (Suspense) on VDOM
proc createRoot*(rootElement: Element): ReactNode
{.pop.}
