import * as Fn from "@dashkite/joy/function"
import * as Pred from "@dashkite/joy/predicate"
import Registry from "@dashkite/helium"
import Router from "@dashkite/neon-oxygen"

redirect = ({ path, name, to, properties... }) ->

  router = await Registry.get "router"

  router.add path,
    { name, properties... },
    Router.redirect to

export { redirect }