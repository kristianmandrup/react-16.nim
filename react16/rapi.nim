import rglobals, rtypes, jsffi

{.push importcpp.}
proc createContext*(context: JsObject): Context
proc createElem*(tag: cstring, props: Attrs): ReactNode
proc createElem*(tag: cstring, props: Attrs,
    n1: auto): ReactNode
proc createElem*(tag: cstring, props: Attrs, n1,
    n2: auto): ReactNode
proc createElem*(tag: cstring, props: Attrs, n1, n2,
    n3: auto): ReactNode
proc createElem*(tag: cstring, props: Attrs, n1, n2, n3,
    n4: auto): ReactNode
proc createElem*(tag: cstring,
    props: SvgAttrs): ReactNode
proc createElem*(tag: cstring, props: SvgAttrs,
    n1: auto): ReactNode
proc createElem*(tag: cstring, props: SvgAttrs, n1,
    n2: auto): ReactNode
proc createElem*(tag: cstring, props: SvgAttrs, n1, n2,
    n3: auto): ReactNode
proc createElem*(tag: cstring, props: SvgAttrs, n1, n2,
    n3, n4: auto): ReactNode
proc createElem*(c: ReactComponent,
    props: ref RootObj): ReactNode {.varargs.}
proc createElem*(c: ReactComponent): ReactNode
proc render*(node: ReactNode, el: Element)

# to enable concurrent mode (Suspense) on VDOM
proc createRoot*(rootElement: Element): ReactNode
{.pop.}
