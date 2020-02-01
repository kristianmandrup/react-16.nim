import react16/globals, react16/types, jsffi

{.push importcpp.}
proc createContext*(context: JsObject): Context
proc createElement*(tag: cstring, props: Attrs): ReactNode
proc createElement*(tag: cstring, props: Attrs,
    n1: auto): ReactNode
proc createElement*(tag: cstring, props: Attrs, n1,
    n2: auto): ReactNode
proc createElement*(tag: cstring, props: Attrs, n1, n2,
    n3: auto): ReactNode
proc createElement*(tag: cstring, props: Attrs, n1, n2, n3,
    n4: auto): ReactNode
proc createElement*(tag: cstring,
    props: SvgAttrs): ReactNode
proc createElement*(tag: cstring, props: SvgAttrs,
    n1: auto): ReactNode
proc createElement*(tag: cstring, props: SvgAttrs, n1,
    n2: auto): ReactNode
proc createElement*(tag: cstring, props: SvgAttrs, n1, n2,
    n3: auto): ReactNode
proc createElement*(tag: cstring, props: SvgAttrs, n1, n2,
    n3, n4: auto): ReactNode
proc createElement*(c: ReactComponent,
    props: ref RootObj): ReactNode {.varargs.}
proc createElement*(c: ReactComponent): ReactNode
proc render*(node: ReactNode, el: Element)

# to enable concurrent mode (Suspense) on VDOM
proc createRoot*(rootElement: Element): ReactNode
{.pop.}
