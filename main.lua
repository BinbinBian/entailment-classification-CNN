require 'torch'
require 'nn'
require 'nngraph'
require 'optim'
local BatchLoader = require 'utils.BatchLoader'
local main = {}

local cmd = torch.CmdLine()
cmd:text()
cmd:text('Training a simple stuffy stuff.')
cmd:text('Options')
cmd:option('-data_dir', 'data', 'path of the train dataset')
cmd:option('-batch_size', '16', 'number of batches')
-- cmd:option('-max_epochs', 10, 'number of full passes through the training data')
-- cmd:option('-cnn_size', 300, 'dimensionality of sentence embeddings')
-- cmd:option('-word_vec_size', 300, 'dimensionality of word embeddings')
-- cmd:option('-dropout',0.5,'dropout. 0 = no dropout')
cmd:option('-seed',3435,'torch manual random number generator seed')
cmd:option('-max_length', 15, 'max length allowed for each sentence')
-- cmd:option('-print_every',500,'how many steps/minibatches between printing out the loss')
-- cmd:option('-save_every', 25000, 'save epoch')
-- cmd:option('-checkpoint_dir', 'cv4', 'output directory where checkpoints get written')
-- cmd:option('-savefile','model','filename to autosave the checkpont to. Will be inside checkpoint_dir/')
-- cmd:option('-checkpoint', 'checkpoint.t7', 'start from a checkpoint if a valid checkpoint.t7 file is given')
-- cmd:option('-learningRate', 0.001, 'learning rate')
-- cmd:option('-beta1', 0.9, 'momentum parameter 1')
-- cmd:option('-beta2', 0.999, 'momentum parameter 2')
-- cmd:option('-decayRate',0.75,'decay rate for sgd')
-- cmd:option('-decay_when',0.1,'decay if validation does not improve by more than this much')
-- cmd:option('-param_init', 0.05, 'initialize parameters at')
-- cmd:option('-max_grad_norm',5,'normalize gradients at')
-- GPU/CPU
cmd:option('-gpuid', -1,'which gpu to use. -1 = use CPU')
cmd:option('-cudnn', 0,'use cudnn (1=yes). this should greatly speed up convolutions')
cmd:option('-time', 0, 'print batch times')
cmd:text()

-- parse input parameters
params = cmd:parse(arg)
-- params.addTime('CNN SNLI','%F %T')
torch.manualSeed(params.seed)

-- create data loader
loader = BatchLoader.create(params.data_dir, params.max_length,params.batch_size)
-- params.seq_length = loader.max_sentence_l 
-- params.vocab_size = #loader.idx2word
-- params.classes = 3  --fixed here
-- params.word2vec = loader.word2vec