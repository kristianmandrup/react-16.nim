import jsffi, dom
import ../react16, rglobals, rtypes, svg_attrs

{.push importcpp.}
proc createContext*(react: ReactGlobal, context: JsObject): Context
proc createElement*(react: ReactGlobal, tag: cstring, props: Attrs): ReactNode
proc createElement*(react: ReactGlobal, tag: cstring, props: Attrs,
    n1: auto): ReactNode
proc createElement*(react: ReactGlobal, tag: cstring, props: Attrs, n1,
    n2: auto): ReactNode
proc createElement*(react: ReactGlobal, tag: cstring, props: Attrs, n1, n2,
    n3: auto): ReactNode
proc createElement*(react: ReactGlobal, tag: cstring, props: Attrs, n1, n2, n3,
    n4: auto): ReactNode
proc createElement*(react: ReactGlobal, tag: cstring,
    props: SvgAttrs): ReactNode
proc createElement*(react: ReactGlobal, tag: cstring, props: SvgAttrs,
    n1: auto): ReactNode
proc createElement*(react: ReactGlobal, tag: cstring, props: SvgAttrs, n1,
    n2: auto): ReactNode
proc createElement*(react: ReactGlobal, tag: cstring, props: SvgAttrs, n1, n2,
    n3: auto): ReactNode
proc createElement*(react: ReactGlobal, tag: cstring, props: SvgAttrs, n1, n2,
    n3, n4: auto): ReactNode
proc createElement*(react: ReactGlobal, c: ReactComponent,
    props: ref RootObj): ReactNode {.varargs.}
proc createElement*(react: ReactGlobal, c: ReactComponent): ReactNode
proc render*(reactDom: ReactDOMGlobal, node: ReactNode, el: Element)

# to enable concurrent mode (Suspense) on VDOM
proc createRoot*(rootElement: Element): ReactNode
{.pop.}
