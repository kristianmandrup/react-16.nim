# from dom import document, Element, Document
import dom
import jsconsole, jsffi, strutils, sequtils, sugar
import react16
import react16/reactapi
import react16/reactdom, react16/rglobals, react16/rtypes, react16/react_styles
from react16/reactdom import ul, li, input, `div`

type
  Country = ref object of RootObj
    name: string
    population: int
  Countries = ref object of RootObj
    countries: seq[Country]

proc makeTopLevel(): ReactNode =
  # defineComponent:
  #   var x = 2
    # proc renderComponent(s: TopLevel): auto =
      `div`(
        Attrs{style: react_styles.Style{marginTop: 50}}
        )  

# let topLevel = makeTopLevel()


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
    content = document.getElementById("content")
  ReactDOM.render(content, makeTopLevel())
