
open Format

let run msg f d =
  let t = Unix.gettimeofday () in
  let x = f d in
  let t = Unix.gettimeofday () -. t in
  printf "@[[%2.2f] %s(%d): %a@]@." t msg d Z.pp_print x

let z = Z.of_int

(* pseudo-random arrays as test *)
let random_array size =
  let () = Random.init 2024 in
  Array.init size (fun _ -> z (Random.int 2024 - 1000))

open MinGameExtract

let random_config size : config = {
  stack = random_array size;
  pos = z 0;
  turn = Alice;
  score_alice = z 0;
  score_bob = z 0;
}

let () =
  (* testing alpha-beta *)
  let f d = MinGameExtract.alpha_beta None None (random_config d) (z d) in
  run "alpha_beta" f 0;
  run "alpha_beta" f 1;
  run "alpha_beta" f 2;
  run "alpha_beta" f 3;
  run "alpha_beta" f 5;
  run "alpha_beta" f 10;
  run "alpha_beta" f 15;
  run "alpha_beta" f 20;
  run "alpha_beta" f 25;
  run "alpha_beta" f 30;
  run "alpha_beta" f 35;
  (* comment some of the tests below if it takes too long time *)
  run "alpha_beta" f 40;
  run "alpha_beta" f 41;
  run "alpha_beta" f 42;
  run "alpha_beta" f 43;
  run "alpha_beta" f 44;
  run "alpha_beta" f 45;
  run "alpha_beta" f 46;
  run "alpha_beta" f 47;
  run "alpha_beta" f 48;
  run "alpha_beta" f 49;
  run "alpha_beta" f 50;
  run "alpha_beta" f 51;
  (* testing dynamic programming *)
  let h d = MinGameExtract.dynamic (random_array d)  in
  run "dynamic" h 0;
  run "dynamic" h 1;
  run "dynamic" h 2;
  run "dynamic" h 3;
  run "dynamic" h 5;
  run "dynamic" h 10;
  run "dynamic" h 15;
  run "dynamic" h 20;
  run "dynamic" h 25;
  run "dynamic" h 30;
  run "dynamic" h 35;
  run "dynamic" h 40;
  run "dynamic" h 41;
  run "dynamic" h 42;
  run "dynamic" h 43;
  run "dynamic" h 44;
  run "dynamic" h 45;
  run "dynamic" h 46;
  run "dynamic" h 47;
  run "dynamic" h 48;
  run "dynamic" h 49;
  run "dynamic" h 50;
  run "dynamic" h 51;
  run "dynamic" h 100;
  run "dynamic" h 1024;
  run "dynamic" h 2024;
  ()
