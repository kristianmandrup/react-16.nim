from dom import Element, Document
import jsconsole, jsffi, strutils, sequtils, sugar
import react16
import react16/reactdom, react16/rglobals, react16/rtypes, react16/react_styles
# from react16/reactdom import ul, li, input, `div`

proc makeTopLevel(): ReactComponent =
  defineComponent:
    proc renderComponent(s: TopLevel): auto =
      `div`(
        Attrs{style: react_styles.Style{marginTop: 50}},
        `div`(Attrs{className: "row"},
          `div`(Attrs{className: "col-md-4"})
        ))  

proc startApp() {.exportc.} =
  console.log React.version
  let
    countries = Countries(countries: @[
      Country(name: "Italy", population: 59859996),
      Country(name: "Mexico", population: 118395054),
      Country(name: "France", population: 65806000),
      Country(name: "Argentina", population: 40117096),
      Country(name: "Japan", population: 127290000)
    ])
  Main = topLevel(countries)
  ReactDOM.render(Main, content)
