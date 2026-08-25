let () =
  let service =
    Cloud.create_service
      ~name:"Aura Cloud"
      ~version:"0.1.0"
  in

  Lwt_main.run (Cloud.start service)
