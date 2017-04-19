#!/bin/sh

MOSES_DIR=/work/$USER/moses/mosesdecoder
SRCLANG=ms
TRGLANG=en

nohup nice $MOSES_DIR/scripts/training/train-model.perl \
	-first-step 3 -last-step 9 \
	--root-dir ms-en/unfactored \
	--corpus $PWD/data/train.ted-alt.ms-en.factored \
	--f $SRCLANG --e $TRGLANG \
	--lm 0:5:/home/$USER/projects/smt-baseline/language-models/en/lm.5gr.en.bin \
	--external-bin-dir $MOSES_DIR/tools/mgizapp -mgiza -mgiza-cpus 20 \
	--input-factor-max 4 \
	>& train-unfactored-ms-en49.log &