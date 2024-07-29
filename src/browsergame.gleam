import gleam/io
import gleam/string
import lustre
import lustre/attribute
import lustre/element
import lustre/element/html.{canvas, div, style}
import websockets

fn rectangle() {
  let figure =
    canvas([
      attribute.attribute("fillStyle", "green"),
      attribute.width(100),
      attribute.height(100),
      attribute.style([#("background", "green")]),
    ])

  figure
}

fn smt() {
  let s =
    websockets.init("ws:localhost:1234/", fn(event) {
      io.println(string.inspect(event))
    })
  s
}

pub fn main() {
  io.println("Hello from browsergame!")

  let app = lustre.element(div([], [element.text("hello kek"), rectangle()]))
  let s = smt()
  let assert Ok(_) = lustre.start(app, "#app", Nil)
  Nil
}
