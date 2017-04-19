#!/bin/sh
# source (German) factors: surface form, lemma, part of speech, part of speech with additional morphological information.
# target (English) factors: surface form, lemma, part of speech
# translation-factors 0-0,2
# source: factor 0 (surface), target: factors 0,2 (surface, part of speech)

MOSES_DIR=/work/$USER/moses/mosesdecoder
SRCLANG=en
TRGLANG=vi

nohup nice $MOSES_DIR/scripts/training/train-model.perl \
	--root-dir en-vi/pos \
	--corpus $PWD/data/train.ted-alt.en-vi.factored \
	--f $SRCLANG --e $TRGLANG \
	--lm 0:5:/home/$USER/projects/smt-baseline/language-models/vi/lm.5gr.vi.bin \
	--translation-factors 0,2-0 \
	--external-bin-dir $MOSES_DIR/tools/mgizapp -mgiza -mgiza-cpus 20 \
	>& train-factored-pos-en-vi.log &