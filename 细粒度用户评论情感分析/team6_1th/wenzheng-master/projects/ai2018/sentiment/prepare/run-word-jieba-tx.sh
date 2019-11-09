dir=./mount/temp/ai2018/sentiment/tfrecords/word.jieba.tx
emb=./mount/data/word-emb/Tencent_AILab_ChineseEmbedding.txt
emb_dim=200

python ./merge-emb.py --input_vocab=$dir/vocab.ori.txt --emb=$emb --emb_dim=$emb_dim --add_additional=0

sh ./run-noemb.sh $dir/vocab.txt

pushd .
cd ..
python ./read-records.py --type=dump --base=$dir
popd
