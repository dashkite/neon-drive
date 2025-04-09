import Registry from "@dashkite/helium"

map = ( name ) ->
  ( target ) ->
    router = await Registry.get "router"
    router[ target ] target

Router =

  link: map "link"


export default Router
export { Router }
