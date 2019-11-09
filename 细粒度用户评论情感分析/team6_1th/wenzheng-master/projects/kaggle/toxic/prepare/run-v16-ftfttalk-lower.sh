export FAST=1
dir=./mount/temp/toxic/v16/tfrecords/ftfttalk.lower/
vocab_dir=./mount/data/kaggle/toxic/talk_corpus/fastText/result.5epoch.lower/
vocab=$vocab_dir/vocab.txt
python3 ./gen-vocab-parse.py --out_dir $dir --vocab_name vocab.full --min_count -1 --full_tokenizer=0 --lower=1 --ngram_lower=1 --max_ngrams=20000
python3 ./merge-2emb.py --dir $dir --out_name glove.npy --min_count 10 --emb ./mount/data/fasttext/crawl-300d-2M.vec --emb2 $vocab_dir/toxic.vec
#python ./merge-ngram-emb.py --dir $dir --emb ./mount/data/kaggle/toxic/talk_corpus/fastText/result.lower.3gram.5epoch/toxic.ngram
python3 ./merge-charemb.py --dir $dir --min_count=10
cat $dir/vocab.txt | vocab2project.py > $dir/vocab.project 
python3 ./gen-records-parse.py --vocab $dir/vocab.txt  --input $dir/train.csv --lower=1 --ngram_lower=1
python3 ./gen-records-parse.py --vocab $dir/vocab.txt --input $dir/test.csv --lower=1 --ngram_lower=1

input=/home/gezi/data/kaggle/toxic/train.sents.csv
python3 ./gen-vocab-parse.py --out_dir $dir --vocab_name vocab.full --min_count -1 --full_tokenizer=0  --name train.sents.csv --input=$input --lower=1 --ngram_lower=1
python3 ./gen-records-parse.py --vocab $dir/vocab.txt --input $dir/train.sents.csv --lower=1 --ngram_lower=1 --has_dup=1
input=/home/gezi/data/kaggle/toxic/test.sents.csv
python3 ./gen-vocab-parse.py --out_dir $dir --vocab_name vocab.full --min_count -1 --full_tokenizer=0  --name test.sents.csv --input=$input --lower=1 --ngram_lower=1
python3 ./gen-records-parse.py --vocab $dir/vocab.txt --input $dir/test.sents.csv --lower=1 --ngram_lower=1 --has_dup=1

#input=/home/gezi/data/kaggle/toxic/hate-speech-and-offensive-language-master/data/nontoxic.csv
#python3 ./gen-vocab-parse.py --out_dir $dir --vocab_name vocab.full --min_count -1 --full_tokenizer=0  --name nontoxic.csv --input=$input --lower=1 --ngram_lower=1
#python3 ./gen-records-parse.py --vocab $dir/vocab.txt --input $dir/nontoxic.csv --mode_ nontoxic --lower=1 --ngram_lower=1 
export FAST=0

