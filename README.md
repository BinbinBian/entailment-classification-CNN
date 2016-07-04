# modelling-entailment-CNN
This implementation benchmarks Kim Yoon's work on the Stanford Natural Language Inference dataset.

The work is influenced from Harvard's NLP group and credit should be given to their implemntation of Kim Yoon's work on Sentence Classifcation with Convolutional Neural Networks.

Instructions to run:

Assuming you have downloaded the SNLI dataset from its dedicated web page.

cd data/scripts
1. run: python process_snli.py /path-to-file/file.txt model

Where model = 1 will process a premise-hypothesis
	     21 will process premise
	     22 will process hypothesis
 
2. word2vec/GloVe: run either of the scripts to prepare either
3. run (assuming you have chosen word2vec in step 2): th main.lua -data snli-w2v.hdf5 -cudnn 1 >> thedate.log
