# CUCThesis-bachelor

本模版基于 [ThuThesis v7.2.3](https://github.com/tuna/thuthesis) 与 [CucThesis v0.0.1](https://github.com/YunYouJun/cucthesis) 进行修改。

旨在用于编写中国传媒大学「本科毕业」论文。

## Makefile 的用法

```shell
make [{thesis|clean|cleanall}]
```

- `make thesis` 生成论文 main.pdf；
- `make clean` 删除示例文件的中间文件（不含 main.pdf）；
- `make cleanall` 删除示例文件的中间文件和 main.pdf；

## 自定义格式

本模版所做的部分自定义格式修改。

> CUC 论文格式

- 总体格式
  - [x] 行间距 22 磅（bp）
  - [x] 全文英文一律采用 Times New Roman 字体
  - [x] 左右边距 2.5cm，上下边距 3.5cm
  - [x] 一二三四级标题格式
  - [x] 空一格为半角一格
- 摘要
  - [x] 题目、摘要格式
  - [x] 没有页眉
  - [x] 记入罗马数字页数
  - [x] 中文关键词四号，关键词内容小四号，空行基本相似
  - [x] 英文文关键词与内容均为小四号，空行基本相似
  - [x] 不加入目录
- 目录
  - [x] 没有页眉
  - [x] 记入罗马数字页数
- 章节
  - [x] 章节起始为 1
  - [x] 章节顶格不居中
- 页眉页脚
  - [x] 页眉小五，双页左侧中国传媒大学硕士学位论文，单页右侧一级标题
  - [x] 页脚页码小五号，居中
- 题注
  - [x] 图注放在图片下方，连接符为横线
  - [x] 表注放在表格上方，连接符为横线
  - [x] 公式编号全文统一顺序编号，不分章节编号
- 参考文献
  - [x] 首行缩进，后面不缩进
  - [x] 只有会议用双斜线
  - [x] 作者只首字母大写
  - [ ] 不支持axiv引用的自动排序与格式化，如果导出的bibtex含有iso号等内容需手动删去

## Windows下环境配置

推荐使用scoop和choco进行环境配置，推荐使用miktex作为latex编译环境。（miktex相当于Windows特化的texlive，推荐在Windows用miktex，WSL中用texlive）

1. scoop

    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    irm get.scoop.sh | iex
    scoop bucket add extras
    scoop bucket add nonportable
    scoop bucket add java
    scoop install busybox
    ```

2. plantuml

    ```powershell
    # recommend
    scoop install plantuml
    # 或手动下载安装 https://github.com/plantuml/plantuml/releases/download/v1.2023.5/plantuml-1.2023.5.jar
    ```

3. graphviz

    ```powershell
    # recommend
    scoop install graphviz
    # 或手动下载安装 https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/8.0.2/windows_10_cmake_Release_graphviz-install-8.0.2-win64.exe，并配置GRAPHVIZ_DOT环境变量
    ```

4. dot2tex

    ```powershell
    pip install dot2tex
    ```

5. inkscape

    ```powershell
    # recommend
    scoop install inkscape
    # 或手动下载安装 https://inkscape.org/release/inkscape-1.2.2/windows/64-bit/msi/dl/
    ```

6. choco

    ```powershell
    # choco权限管理很乱，但是rsvg_convert的安装Choco最方便。
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```

7. rsvg_convert

    ```powershell
    scoop install sudo
    sudo choco install rsvg_convert
    ```

8. miktex

    ```powershell
    scoop install miktex
    ```

## 常用命令

1. plantuml

    ```bash
    # scoop安装的plantuml相当于java -jar plantuml.jar命令

    # 生成tex插图
    java -jar plantuml.jar -Tlatex:nopreamble <file>

    # 将依赖jar包与plantuml.jar放到同一目录下
    wget http://beta.plantuml.net/batikAndFop.zip
    # 生成pdf插图
    java -jar plantuml.jar -Tpdf <file>
    ```

2. graphviz

    ```bash
    # 生成tex插图
    dot -Txdot <input_file> | dot2tex --figonly -o <output_file>
    dot2tex --figonly <input_file> -o <output_file>

    # 生成pdf插图
    dot -Txdot <input_file> -o <output_file>
    ```

3. inkscape

    ```bash
    # svg to pdf
    inkscape --export-type=pdf <input_file> -o <output_file>

    # svg to tex
    inkscape --export-latex <input_file> -o <output_file>
    ```

4. rsvg_convert

    ```bash
    # svg to pdf
    sudo rsvg-convert -f pdf <input_file> -o <output_file>
    ```
