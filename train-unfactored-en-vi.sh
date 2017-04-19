#!/bin/sh

MOSES_DIR=/work/$USER/moses/mosesdecoder
SRCLANG=en
TRGLANG=vi

nohup nice $MOSES_DIR/scripts/training/train-model.perl \
	-first-step 3 -last-step 9 \
	--root-dir en-vi/unfactored \
	--corpus $PWD/data/train.ted-alt.en-vi.factored \
	--f $SRCLANG --e $TRGLANG \
	--lm 0:5:/home/$USER/projects/smt-baseline/language-models/vi/lm.5gr.vi.bin \
	--external-bin-dir $MOSES_DIR/tools/mgizapp -mgiza -mgiza-cpus 20 \
	--input-factor-max 4 \
	>& train-unfactored-en-vi49.log &