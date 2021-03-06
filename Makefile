.SUFFIXES: .erl .beam .yrl

MODS := $(wildcard *.erl)

%.beam: %.erl
	erlc  -W $< 

tests: beam erl_parse.beam
	./erl2 tests.erl2

erl_parse.beam: erl_parse.yrl
	erlc erl_parse.yrl
	erlc erl_parse.erl

beam: ${MODS:%.erl=%.beam}

clean:
	rm -rf *.beam *~ erl_crash.dump erl_parse.erl all.gen exprs.tmp









