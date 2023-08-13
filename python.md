## Python



python -m venv myenv 在项目主目录下创建虚拟环境
进入到myenv/Scripts/activate激活虚拟环境
deactivate退出虚拟环境
rm -rf myenv删除虚拟环境

pip freeze > requirements.txt 生成依赖文件
pip install -r requirements.txt 安装依赖文件