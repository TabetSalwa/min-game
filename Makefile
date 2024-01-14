
default:
	@echo 'type `make <target>` where <target> is either ide, replay, tests or doc'

ide:
	why3 ide min_game.mlw

replay:
	why3 replay min_game

tests:
	why3 execute min_game.mlw --use MinGame "config0 ()"
	why3 execute min_game.mlw --use MiniMax "test0 ()"
	why3 execute min_game.mlw --use AlphaBeta "test_alphabeta ()"

test_min_game:
	why3 extract -D ocaml64 min_game.mlw -o minGameExtract.ml
	ocamlbuild -pkg unix -pkg zarith test_min_game.native
	./test_min_game.native

doc:
	why3 doc min_game.mlw
	why3 session html min_game
