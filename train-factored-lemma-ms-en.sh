#!/bin/sh
# source (German) factors: surface form, lemma, part of speech, part of speech with additional morphological information.
# target (English) factors: surface form, lemma, part of speech
# translation-factors 0-0,2
# source: factor 0 (surface), target: factors 0,2 (surface, part of speech)

MOSES_DIR=/work/$USER/moses/mosesdecoder
SRCLANG=ms
TRGLANG=en

nohup nice $MOSES_DIR/scripts/training/train-model.perl \
	--root-dir ms-en/lemma \
	--corpus $PWD/data/train.ted-alt.ms-en.factored \
	--f $SRCLANG --e $TRGLANG \
	--lm 0:5:/home/$USER/projects/smt-baseline/language-models/en/lm.5gr.en.bin \
	--lm 2:3:$PWD/lm/pos.lm \
	--translation-factors 0-0,1 \
	--external-bin-dir $MOSES_DIR/tools/mgizapp -mgiza -mgiza-cpus 20 \
	>& train-factored-lemma-ms-en.log &