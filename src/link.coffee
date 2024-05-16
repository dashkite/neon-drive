import Router from "#helpers/router"

link = ({ query..., bindings: parameters }) ->
  ( await Router.link { query, parameters }).toString()

export { link }