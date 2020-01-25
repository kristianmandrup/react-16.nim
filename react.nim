import macros, dom, jsffi

{.experimental: "callOperator".}

when not defined(js):
  {.error: "React.nim is only available for the JS target".}

type
  Context*{.importc.} = ref object of RootObj
  Consumer*{.importc.} = ref object of RootObj
  Producer*{.importc.} = ref object of RootObj
  ReactGlobal*{.importc.} = ref object of RootObj
    version*: cstring
  ReactDOMGlobal*{.importc.} = ref object of RootObj
    version*: cstring
  ReactComponent*{.importc.} = ref object of RootObj
  ReactNode*{.importc.} = ref object of RootObj
  EventTarget* = ref object
    value*: cstring
  Event* = ref object
    target*: EventTarget
    `type`*: cstring
  Attrs* = ref object
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
    alignContent*, #	Sets or returns the alignment between the lines inside a flexible container when the items do not use all available space	3
    alignItems*, #	Sets or returns the alignment for items inside a flexible container	3
    alignSelf*, #	Sets or returns the alignment for selected items inside a flexible container	3
    animation*, #	A shorthand property for all the animation properties below, except the animationPlayState property	3
    animationDelay*, #	Sets or returns when the animation will start	3
    animationDirection*, #	Sets or returns whether or not the animation should play in reverse on alternate cycles	3
    animationDuration*, #	Sets or returns how many seconds or milliseconds an animation takes to complete one cycle	3
    animationFillMode*, #	Sets or returns what values are applied by the animation outside the time it is executing	3
    animationIterationCount*, #	Sets or returns the number of times an animation should be played	3
    animationName*, #	Sets or returns a name for the @keyframes animation	3
    animationTimingFunction*, #	Sets or returns the speed curve of the animation	3
    animationPlayState*, #	Sets or returns whether the animation is running or paused	3
    background*, #	Sets or returns all the background properties in one declaration	1
    backgroundAttachment*, #	Sets or returns whether a background-image is fixed or scrolls with the page	1
    backgroundColor*, #	Sets or returns the background-color of an element	1
    backgroundImage*, #	Sets or returns the background-image for an element	1
    backgroundPosition*, #	Sets or returns the starting position of a background-image	1
    backgroundRepeat*, #	Sets or returns how to repeat (tile) a background-image	1
    backgroundClip*, #	Sets or returns the painting area of the background	3
    backgroundOrigin*, #	Sets or returns the positioning area of the background images	3
    backgroundSize*, #	Sets or returns the size of the background image	3
    backfaceVisibility*, #	Sets or returns whether or not an element should be visible when not facing the screen	3
    border*, #	Sets or returns borderWidth, borderStyle, and borderColor in one declaration	1
    borderBottom*, #	Sets or returns all the borderBottom properties in one declaration	1
    borderBottomColor*, #	Sets or returns the color of the bottom border	1 
    borderBottomLeftRadius*, #	Sets or returns the shape of the border of the bottom-left corner	3
    borderBottomRightRadius*, #	Sets or returns the shape of the border of the bottom-right corner	3
    borderBottomStyle*, #	Sets or returns the style of the bottom border	1
    borderBottomWidth*, #	Sets or returns the width of the bottom border	1
    borderCollapse*, #	Sets or returns whether the table border should be collapsed into a single border, or not	2
    borderColor*, #	Sets or returns the color of an element's border (can have up to four values)	1
    borderImage*, #	A shorthand property for setting or returning all the borderImage properties	3
    borderImageOutset*, #	Sets or returns the amount by which the border image area extends beyond the border box	3
    borderImageRepeat*, #	Sets or returns whether the image-border should be repeated, rounded or stretched	3
    borderImageSlice*, #	Sets or returns the inward offsets of the image-border	3
    borderImageSource*, #	Sets or returns the image to be used as a border	3
    borderImageWidth*, #	Sets or returns the widths of the image-border	3
    borderLeft*, #	Sets or returns all the borderLeft properties in one declaration	1
    borderLeftColor*, #	Sets or returns the color of the left border	1
    borderLeftStyle*, #	Sets or returns the style of the left border	1
    borderLeftWidth*, #	Sets or returns the width of the left border	1
    borderRadius*, #	A shorthand property for setting or returning all the four borderRadius properties	3
    borderRight*, #	Sets or returns all the borderRight properties in one declaration	1
    borderRightColor*, #	Sets or returns the color of the right border	1
    borderRightStyle*, #	Sets or returns the style of the right border	1
    borderRightWidth*, #	Sets or returns the width of the right border	1
    borderSpacing*, #	Sets or returns the space between cells in a table	2
    borderStyle*, #	Sets or returns the style of an element's border (can have up to four values)	1
    borderTop*, #	Sets or returns all the borderTop properties in one declaration	1
    borderTopColor*, #	Sets or returns the color of the top border	1
    borderTopLeftRadius*, #	Sets or returns the shape of the border of the top-left corner	3
    borderTopRightRadius*, #	Sets or returns the shape of the border of the top-right corner	3
    borderTopStyle*, #	Sets or returns the style of the top border	1
    borderTopWidth*, #	Sets or returns the width of the top border	1
    borderWidth*, #	Sets or returns the width of an element's border (can have up to four values)	1
    bottom*, #	Sets or returns the bottom position of a positioned element	2
    boxDecorationBreak*, #	Sets or returns the behaviour of the background and border of an element at page-break, or, for in-line elements, at line-break.	3
    boxShadow*, #	Attaches one or more drop-shadows to the box	3
    boxSizing*, #	Allows you to define certain elements to fit an area in a certain way	3
    captionSide*, #	Sets or returns the position of the table caption	2
    clear*, #	Sets or returns the position of the element relative to floating objects	1
    clip*, #	Sets or returns which part of a positioned element is visible	2
    color*, #	Sets or returns the color of the text	1
    columnCount*, #	Sets or returns the number of columns an element should be divided into	3
    columnFill*, #	Sets or returns how to fill columns	3
    columnGap*, #	Sets or returns the gap between the columns	3
    columnRule*, #	A shorthand property for setting or returning all the columnRule properties	3
    columnRuleColor*, #	Sets or returns the color of the rule between columns	3
    columnRuleStyle*, #	Sets or returns the style of the rule between columns	3
    columnRuleWidth*, #	Sets or returns the width of the rule between columns	3
    columns*, #	A shorthand property for setting or returning columnWidth and columnCount	3
    columnSpan*, #	Sets or returns how many columns an element should span across	3
    columnWidth*, #	Sets or returns the width of the columns	3
    content*, #	Used with the :before and :after pseudo-elements, to insert generated content	2
    counterIncrement*, #	Increments one or more counters	2
    counterReset*, #	Creates or resets one or more counters	2
    cursor*, #	Sets or returns the type of cursor to display for the mouse pointer	2
    direction*, #	Sets or returns the text direction	2
    display*, #	Sets or returns an element's display type	1
    emptyCells*, # Setsor returns whether to show the border and background of empty cells, or not	2
    filter*, # Setsor returns image filters (visual effects, like blur and saturation)	3
    flex*, # Setsor returns the length of the item, relative to the rest	3
    flexBasis*, # Setsor returns the initial length of a flexible item	3
    flexDirection*, # Setsor returns the direction of the flexible items	3
    flexFlow*, #	A shorthand property for the flexDirection and the flexWrap properties	3
    flexGrow*, # Setsor returns how much the item will grow relative to the rest	3
    flexShrink*, # Setsor returns how the item will shrink relative to the rest	3
    flexWrap*, # Setsor returns whether the flexible items should wrap or not	3
    cssFloat*, # Setsor returns the horizontal alignment of an element	1
    font*, # Setsor returns fontStyle, fontVariant, fontWeight, fontSize, lineHeight, and fontFamily in one declaration	1
    fontFamily*, # Setsor returns the font family for text	1
    fontSize*, # Setsor returns the font size of the text	1
    fontStyle*, # Setsor returns whether the style of the font is normal, italic or oblique	1
    fontVariant*, # Setsor returns whether the font should be displayed in small capital letters	1
    fontWeight*, # Setsor returns the boldness of the font	1
    fontSizeAdjust*, #	Preserves the readability of text when font fallback occurs	3
    fontStretch*, #	Selects a normal, condensed, or expanded face from a font family	3
    hangingPunctuation*, #	Specifies whether a punctuation character may be placed outside the line box	3
    height*, # Setsor returns the height of an element	1
    hyphens*, # Setshow to split words to improve the layout of paragraphs	3
    icon*, #	Provides the author the ability to style an element with an iconic equivalent	3
    imageOrientation*, #	Specifies a rotation in the right or clockwise direction that a user agent applies to an image	3
    isolation*, #	Defines whether an element must create a new stacking content	3
    justifyContent*, # Setsor returns the alignment between the items inside a flexible container when the items do not use all available space.	3
    left*, # Setsor returns the left position of a positioned element	2
    letterSpacing*, # Setsor returns the space between characters in a text	1
    lineHeight*, # Setsor returns the distance between lines in a text	1
    listStyle*, # Setsor returns listStyleImage, listStylePosition, and listStyleType in one declaration	1
    listStyleImage*, # Setsor returns an image as the list-item marker	1
    listStylePosition*, # Setsor returns the position of the list-item marker	1
    listStyleType*, # Setsor returns the list-item marker type	1
    margin*, # Setsor returns the margins of an element (can have up to four values)	1
    marginBottom*, # Setsor returns the bottom margin of an element	1
    marginLeft*, # Setsor returns the left margin of an element	1
    marginRight*, # Setsor returns the right margin of an element	1
    marginTop*, # Setsor returns the top margin of an element	1
    maxHeight*, # Setsor returns the maximum height of an element	2
    maxWidth*, # Setsor returns the maximum width of an element	2
    minHeight*, # Setsor returns the minimum height of an element	2
    minWidth*, # Setsor returns the minimum width of an element	2
    navDown*, # Setsor returns where to navigate when using the arrow-down navigation key	3
    navIndex*, # Setsor returns the tabbing order for an element	3
    navLeft*, # Setsor returns where to navigate when using the arrow-left navigation key	3
    navRight*, # Setsor returns where to navigate when using the arrow-right navigation key	3
    navUp*, # Setsor returns where to navigate when using the arrow-up navigation key	3
    objectFit*, #	Specifies how the contents of a replaced element should be fitted to the box established by its used height and width	3
    objectPosition*, #	Specifies the alignment of the replaced element inside its box	3
    opacity*, # Setsor returns the opacity level for an element	3
    order*, # Setsor returns the order of the flexible item, relative to the rest	3
    orphans*, # Setsor returns the minimum number of lines for an element that must be left at the bottom of a page when a page break occurs inside an element	2
    outline*, # Setsor returns all the outline properties in one declaration	2
    outlineColor*, # Setsor returns the color of the outline around a element	2
    outlineOffset	Off*, # Setsan outline, and draws it beyond the border edge	3
    outlineStyle*, # Setsor returns the style of the outline around an element	2
    outlineWidth*, # Setsor returns the width of the outline around an element	2
    overflow*, # Setsor returns what to do with content that renders outside the element box	2
    overflowX*, #	Specifies what to do with the left/right edges of the content, if it overflows the element's content area	3
    overflowY*, #	Specifies what to do with the top/bottom edges of the content, if it overflows the element's content area	3
    padding*, # Setsor returns the padding of an element (can have up to four values)	1
    paddingBottom*, # Setsor returns the bottom padding of an element	1
    paddingLeft*, # Setsor returns the left padding of an element	1
    paddingRight*, # Setsor returns the right padding of an element	1
    paddingTop*, # Setsor returns the top padding of an element	1
    pageBreakAfter*, # Setsor returns the page-break behavior after an element	2
    pageBreakBefore*, # Setsor returns the page-break behavior before an element	2
    pageBreakInside*, # Setsor returns the page-break behavior inside an element	2
    perspective*, # Setsor returns the perspective on how 3D elements are viewed	3
    perspectiveOrigin*, # Setsor returns the bottom position of 3D elements	3
    position*, # Setsor returns the type of positioning method used for an element (static, relative, absolute or fixed)	2
    quotes*, # Setsor returns the type of quotation marks for embedded quotations	2
    resize*, # Setsor returns whether or not an element is resizable by the user	3
    right*, # Setsor returns the right position of a positioned element	2
    tableLayout*, # Setsor returns the way to lay out table cells, rows, and columns	2
    tabSize*, # Setsor returns the length of the tab-character	3
    textAlign*, # Setsor returns the horizontal alignment of text	1
    textAlignLast*, # Setsor returns how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"	3
    textDecoration*, # Setsor returns the decoration of a text	1
    textDecorationColor*, # Setsor returns the color of the text-decoration	3
    textDecorationLine*, # Setsor returns the type of line in a text-decoration	3
    textDecorationStyle*, # Setsor returns the style of the line in a text decoration	3
    textIndent*, # Setsor returns the indentation of the first line of text	1
    textJustify*, # Setsor returns the justification method used when text-align is "justify"	3
    textOverflow*, # Setsor returns what should happen when text overflows the containing element	3
    textShadow*, # Setsor returns the shadow effect of a text	3
    textTransform*, # Setsor returns the capitalization of a text	1
    top*, # Setsor returns the top position of a positioned element	2
    transform*, #	Applies a 2D or 3D transformation to an element	3
    transformOrigin*, # Setsor returns the position of transformed elements	3
    transformStyle*, # Setsor returns how nested elements are rendered in 3D space	3
    transition*, #	A shorthand property for setting or returning the four transition properties	3
    transitionProperty*, # Setsor returns the CSS property that the transition effect is for	3
    transitionDuration*, # Setsor returns how many seconds or milliseconds a transition effect takes to complete	3
    transitionTimingFunction*, # Setsor returns the speed curve of the transition effect	3
    transitionDelay*, # Setsor returns when the transition effect will start	3
    unicodeBidi*, # Setsor returns whether the text should be overridden to support multiple languages in the same document	2
    userSelect*, # Setsor returns whether the text of an element can be selected or not	2
    verticalAlign*, # Setsor returns the vertical alignment of the content in an element	1
    visibility*, # Setsor returns whether an element should be visible	2
    whiteSpace*, # Setsor returns how to handle tabs, line breaks and whitespace in a text	1
    width*, # Setsor returns the width of an element	1
    wordBreak*, # Setsor returns line breaking rules for non-CJK scripts	3
    wordSpacing*, # Setsor returns the spacing between words in a text	1
    wordWrap*, #	Allows long, unbreakable words to be broken and wrap to the next line	3
    widows*, # Setsor returns the minimum number of lines for an element that must be visible at the top of a page	2
    zIndex*, # Setsor returns the stack order of a positioned element	2

  # Add more from: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute
  SvgAttrs* = ref object
    onClick*: proc(e: Event)
    `accentHeight`*,
    accumulate*
    additive*
    alignmentBaseline*
    allowReorder*
    alphabetic*
    amplitude*
    arabicForm*
    ascent*
    attributeName*
    attributeType*
    autoReverse*
    azimuth*,
    baseFrequency*,
    baselineShift*,
    baseProfile*,
    bbox*,
    begin*,
    bias*,
    by*,
    calcMode*,
    capHeight*,
    clip*,
    clipPathUnits*,
    clipPath*,
    clipRule*,
    color*,
    colorInterpolation*,
    colorInterpolationFilters*,
    colorProfile*,
    colorRendering*,
    contentScriptType*,
    contentStyleType*,
    cursor*,
    cx*: cint,
    cy*: cint,
    d*,
    decelerate*,
    descent*,
    diffuseConstant*,
    direction*,
    display*,
    divisor*,
    dominantBaseline*,
    dur*,
    dx*: cint,
    dy*: cint,
    edgeMode*,
    elevation*,
    enableVackground*,
    `end`*,
    exponent*,
    externalResourcesRequired*,
    fill*,
    fillOpacity*,
    fillRule*,
    filter*,
    filterRes*,
    filterUnits*,
    floodColor*,
    floodOpacity*,
    fontFamily*,
    fontSize*,
    fontSizeAdjust*,
    fontStretch*,
    fontStyle*,
    fontVariant*,
    fontWeight*,
    format*,
    `from`*,
    fr*,
    fx*,
    fy*, 
    g1*,
    g2*,
    glyphName*,
    glyphOrientationHorizontal*,
    glyphOrientationVertical*,
    glyphRef*,
    gradientTransform*,
    gradientUnits*,
    hanging*,
    height*,
    href*,
    hreflang*,
    horizAdvX*,
    horizOriginX*,
    id*,
    ideographic*,
    imageRendering*,
    `in`*,
    in2*,
    intercept*,
    k*,
    k1*,
    k2*,
    k3*,
    k4*,
    kernelMatrix*,
    kernelUnitLength*,
    kerning*,
    keyPoints*,
    keySplines*,
    keyTimes*,
    key*, 
    lang*, 
    lengthAdjust*,
    letterSpacing*,
    lightingColor*,
    limitingConeAngle*,
    local*,
    markerEnd*,
    markerMid*,
    markerStart*,
    markerHeight*,
    markerUnits*,
    markerWidth*,
    mask*,
    maskContentUnits*,
    maskUnits*,
    mathematical*,
    max*,
    media*,
    `method`*,
    min*,
    mode*,
    name*,
    numOctaves*,
    offset*,
    opacity*,
    operator*,
    order*,
    orient*,
    orientation*,
    origin*,
    overflow*,
    overlinePosition*,
    overlineThickness*,  
    panose1*,
    paintOrder*,
    path*,
    pathLength*,
    patternContentUnits*,
    patternTransform*,
    patternUnits*,
    ping*,
    pointerEvents*,
    points*: cstring, 
    pointsAtX*,
    pointsAtY*,
    pointsAtZ*,
    preserveAlpha*,
    preserveAspectRatio*,
    primitiveUnits*,
    r*,
    radius*,
    referrerPolicy*,
    refX*,
    refY*,
    rel*,
    renderingIntent*,
    repeatCount*,
    repeatDur*,
    requiredExtensions*,
    requiredFeatures*,
    restart*,
    result*,
    rotate*,
    rx*: cint,
    ry*: cint,
    `ref`*, 
    scale*,
    seed*,
    shapeRendering*,
    slope*,
    spacing*,
    specularConstant*,
    specularExponent*,
    speed*,
    spreadMethod*,
    startOffset*,
    stdDeviation*,
    stemh*,
    stemv*,
    stitchTiles*,
    stopColor*,
    stopOpacity*,
    strikethroughPosition*,
    strikethroughThickness*,
    `string`*,
    stroke*,
    strokeDasharray*,
    strokeDashoffset*,
    strokeLinecap*,
    strokeLinejoin*,
    strokeMiterlimit*,
    strokeOpacity*,
    strokeWidth *: cint,
    style*,
    surfaceScale*,
    systemLanguage*,    
    tabindex*,
    tableValues*,
    target*,
    targetX*,
    targetY*,
    textAnchor*,
    textDecoration*,
    textRendering*,
    textLength*,
    to*,
    transform*,
    `type`*,
    u1*,
    u2*,
    underlinePosition*,
    underlineThickness*,
    unicode*,
    unicodeBidi*,
    unicodeRange*,
    unitsPerEm*, 
    vAlphabetic*,
    vHanging*,
    vIdeographic*,
    vMathematical*,
    values*,
    vectorEffect*,
    version*,
    vertAdvY*,
    vertOriginX*,
    vertOriginY*,
    viewBox*,
    viewTarget*,
    visibility*,  
    width*,  
    widths*,
    wordSpacing*,  
    writingMode*,  
    x*,
    xHeight*,
    x1*,
    x2*,
    xChannelSelector*,
    y*,
    y1*,
    y2*,
    yChannelSelector*,
    z*,
    zoomAndPan*,
    
{.push importcpp.}
proc createContext*(react: ReactGlobal, context: ref object): Context
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

var
  React*{.importc, nodecl.}: ReactGlobal
  ReactDOM*{.importc, nodecl.}: ReactDOMGlobal

type
  Component*[P, S] = ref object of RootObj
    props*: P
    state*: S
    setState*{.importcpp.}: proc(s: S)
  StatelessComponent*[P] = Component[P, void]

proc `()`*[P](c: ReactComponent, p: P): ReactNode =
  React.createElement(c, p)
