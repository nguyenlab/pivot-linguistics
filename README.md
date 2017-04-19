This is the repository for the following paper:

Enhancing Pivot Translation Using Grammatical and Morphological Information


# Training

1. Stanford-corenlp: part-of-speech, lemma

  STANFORD_CORENLP_DIR/corenlp.sh -annotators tokenize,ssplit,pos,lemma,ner -outputFormat conll -file data/train.ted-alt.ms-en.en -ssplit.eolonly

  STANFORD_CORENLP_DIR/corenlp.sh -annotators tokenize,ssplit,pos,lemma,ner -outputFormat conll -file data/train.ted-alt.en-vi.en -ssplit.eolonly
  
2. prepare data for factored training
  python prepare-factored-corpus.py train.ted-alt.ms-en.en.conll data/train.ted-alt.ms-en.factored.en

  python prepare-factored-corpus.py train.ted-alt.en-vi.en.conll data/train.ted-alt.en-vi.factored.en
