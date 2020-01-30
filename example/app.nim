import dom, jsconsole, jsffi, strutils, sequtils, sugar
import react16
from react/dom import ul, li, input, `div`
from react/hooks import useState # , useEffect, useContext

type
  Country = ref object of RootObj
    name: string
    population: int
  ItemFilter = ref object of RootObj
    countries: seq[Country]
    query: string
  ValueLink = ref object of RootObj
    value: string
    handler: proc(s: string)
  Countries = ref object of RootObj
    countries: seq[Country]
  Filter = ref object of RootObj
    query: string
  Search = ref object of StatelessComponent[ValueLink]
  Items = ref object of StatelessComponent[ItemFilter]
  TopLevel = ref object of Component[Countries, Filter]

##### Items

proc items(countries: array[Country], query: string): ReactComponent =
  let
    f = xs.props
    countries = countries.filter((s) => s.name.toLowerAscii.contains(query))
    list = ul(countries.map((c) => li(
      Attrs{key: c.name},
      c.name & ": " & $c.population))
    )
  return `div`(Attrs{className: "col-md-4"}, list)

##### Search

proc search(value: string, setValue: proc(e: auto)): ReactComponent =
  `div`(
    Attrs{className: "form-group"},
    input(Attrs{
      className: "form-control",
      onChange: proc(e: react.Event) = setValue($e.target.value),
      value: s.props.value,
      placeholder: "Filter here",
      `type`: "text"
    })
  )

##### Top level

proc topLevel(): ReactComponent =
  `div`(
    Attrs{style: react.Style{marginTop: 50}},
    `div`(Attrs{className: "row"},
      `div`(Attrs{className: "col-md-4"},
        search(ValueLink(
          value: query,
          setValue: proc(q: string) = setQuery(Filter(query: q))
    ))
  )
    ),
    `div`(Attrs{className: "row"},
      items(ItemFilter(
        countries: countries,
        query: query
      ))
    )
  )

##### Main

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
    Main = topLevel(countries)
  ReactDOM.render(Main, content)
