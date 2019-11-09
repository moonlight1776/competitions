python3 ./gen-vocab.py --out_dir ./mount/temp/toxic/v3/tfrecords/glove-1000/ --vocab_name vocab.full --min_count -1
python3 ./merge-glove.py --dir ./mount/temp/toxic/v3/tfrecords/glove-1000/
python3 ./merge-charemb.py --dir ./mount/temp/toxic/v3/tfrecords/glove-1000/
python3 ./gen-records.py --vocab ./mount/temp/toxic/v3/tfrecords/glove-1000/vocab.txt --comment_limt 1000
python3 ./gen-records.py --vocab ./mount/temp/toxic/v3/tfrecords/glove-1000/vocab.txt --comment_limt 1000 --input ~/data/kaggle/toxic/test.csv

