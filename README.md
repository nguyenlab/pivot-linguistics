This is the repository for the following paper:

Enhancing Pivot Translation Using Grammatical and Morphological Information


# Preparing data

1. Stanford-corenlp: part-of-speech, lemma

        STANFORD_CORENLP_DIR/corenlp.sh -annotators tokenize,ssplit,pos,lemma,ner -outputFormat conll -file data/train.ted-alt.ms-en.en -ssplit.eolonly

        STANFORD_CORENLP_DIR/corenlp.sh -annotators tokenize,ssplit,pos,lemma,ner -outputFormat conll -file data/train.ted-alt.en-vi.en -ssplit.eolonly
  
2. prepare data for factored training
        
        python prepare-factored-corpus.py train.ted-alt.ms-en.en.conll data/train.ted-alt.ms-en.factored.en
        
        python prepare-factored-corpus.py train.ted-alt.en-vi.en.conll data/train.ted-alt.en-vi.factored.en

# Training

1. Training unfactored models
        
        ./ train-unfactored-ms-en.sh
        
        ./ train-unfactored-en-vi.sh

2. Training factored models: part-of-speech
        
        ./ train-factored-pos-ms-en.sh
        
        ./ train-factored-pos-en-vi.sh

3. Training factored models: lemma
        
        ./ train-factored-lemma-ms-en.sh
        
        ./ train-factored-lemma-en-vi.sh
