open Lwt.Infix

type service = {
  name : string;
  version : string;
}

let create_service ~name ~version =
  { name; version }

let info service =
  Printf.sprintf "%s v%s" service.name service.version

let start service =
  Lwt_io.printf "Starting cloud service: %s\n" (info service)
  >>= fun () ->
  Lwt_unix.sleep 0.1
  >>= fun () ->
  Lwt_io.printf "Cloud service started.\n"
