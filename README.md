# kohya-scripts-txt2img


## Installation and setting environment (for linux)

Open terminal and type the following inside:
```
git clone https://github.com/kohya-ss/sd-scripts.git
python3 -m venv .env
source .env/bin/activate
pip install torch==2.1.2 torchvision==0.16.2 --index-url https://download.pytorch.org/whl/cu118
cd sd-scripts
pip install -r requirements.txt
pip install xformers==0.0.23.post1 --index-url https://download.pytorch.org/whl/cu118
pip install datasets

accelarate config default
```
## Install Wandb (optional)

```
pip install wandb 
wandb login
# copy api key from given link
```



