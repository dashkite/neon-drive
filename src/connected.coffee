import * as Fn from "@dashkite/joy/function"
import * as Pred from "@dashkite/joy/predicate"
import * as Ne from "@dashkite/neon"
import Registry from "@dashkite/helium"
import Profile from "@dashkite/neon-profile"
import Router from "@dashkite/rio-oxygen"

connected = ({ path, name, view, success, properties... }) ->

  router = await Registry.get "router"

  router.add path,
    { name, properties... }
    Pred.branch [
      [ 
        Profile.connected
        Fn.flow [
          Profile.load
          # Ne.render "header", header
          # Ne.render "footer", footer
          Ne.view "main", view
          Ne.show
          Ne.dispose
          if success?
            Ne.success Router.browse success
          else Fn.identity
        ]
      ]
      [ 
        ( Fn.wrap true )
        Router.browse name: "connect"
      ]
    ]

export { connected }