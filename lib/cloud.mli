type service

val create_service :
  name:string ->
  version:string ->
  service

val info : service -> string

val start : service -> unit Lwt.t
