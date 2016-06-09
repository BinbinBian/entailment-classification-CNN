require 'dp'
nWordsInDictionary = 100000
embeddingSize = 100
sentenceLength = 5
-- function classifier_simple:classify()
m = nn.Sequential() -- a container that chains modules one after another
m:add(nn.LookupTable(nWordsInDictionary, embeddingSize))
m:add(nn.TemporalConvolution(sentenceLength, 150, embeddingSize))
m:add(nn.Max(1))
m:add(nn.Linear(150, 1024))
m:add(nn.HardTanh())
m:add(nn.Linear())
 
-- m:cuda() -- transfer the model to GPU
-- end