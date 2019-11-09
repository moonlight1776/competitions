vocab=./mount/temp/ai2018/sentiment/tfrecords/word.bseg.ner.ft/vocab.txt
python ./gen-lm-records.py --input ./mount/data/my-embedding/GloVe-sentiment-bseg-ner/corpus/valid/ --use_char=1 --max_sentence_len=40 --tfrecord_dir tfrecord.len40 --vocab_ $vocab
python ./gen-lm-records.py --input ./mount/data/my-embedding/GloVe-sentiment-bseg-ner/corpus/train/ --use_char=1 --max_sentence_len=40 --tfrecord_dir tfrecord.len40 --vocab_ $vocab
