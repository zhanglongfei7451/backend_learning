## conda
Anaconda Prompt
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ 
conda config --set show_channel_urls yes

1. conda info 查看当前channel

2. conda create -n env8-8  python=3.6
3. conda activate env8-8
4. conda deactivate
5. conda info --envs
6. conda list——查看环境现有的包
7. deactivate 环境名称——提出该环境