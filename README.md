# Latex Book Template

Latex 中文书籍模板, 已调教好中文编码问题, 可正确显示中文字体 (黑体, 斜体等可以正确显示), 书签, 中英文符号
(特别是代码中的单双引号问题)等.

## 依赖安装

- 字体

    使用前确保如下几款字体已经安装到系统中, 这几款字体都是免费开源可商用的.

    - 英文字体

        - Lora: https://fonts.google.com/specimen/Lora
        - Soruce Code Pro: https://fonts.google.com/specimen/Source+Code+Pro?category=Monospace

        注意下载后安装 `-xxx.ttf` 字体, 以 Lora 为例, 应该安装如下字体

            Lora-Bold.ttf
            Lora-BoldItalic.ttf
            Lora-Italic.ttf
            Lora-Medium.ttf
            Lora-MediumItalic.ttf
            Lora-Regular.ttf
            Lora-SemiBold.ttf
            Lora-SemiBoldItalic.ttf

        不要安装单个字体文件包含多种样式的字体, 否则 xelatex 无法设置粗体, 斜体等.

    - 中文字体

        - Source Han Serif SC: https://github.com/adobe-fonts/source-han-serif/releases

            下载 SourceHanSerif.ttc.zip 文件 (名字为 Static Super OTC), 解压后里面就只有一个文件,
            安装即可.

- 第三方库

    *nix 下使用 `bash scripts/install.sh` 即可安装依赖的 pmat 和 typicons 库.

    其中 pmat 用于书写矩阵, 图标包 typicons 用于插入各种图标, 安装目录位于 `$HOME/texmf`.

## 使用

假设你的书籍根目录为 `your_book_root_directory`, 主文件为 `main.tex`,
只需将本仓库放到根目录即可, 目录组织类似如下

    +-- your_book_root_directory
        +-- latex-book-template/
        +-- main.tex

然后在 main.tex 中导入即可

    \input{latex-book-template/src/setup}

    \begin{document}

    \end{document}

要更新本仓库也很方便, 只需进入 `latex-book-template` 使用 git 拉取最新代码即可.

具体可以参考 `example/` 目录下的文件, 进入 `example/` 目录执行 `make` 即可生成 `main.pdf` 样例文件.

## 已知问题

- titlesec bug

    使用 titlesec 2.10.1 版本会导致如下 bug 出现, 详情见:

        https://tex.stackexchange.com/questions/299969/titlesec-loss-of-section-numbering-with-the-new-update-2016-03-15

    该问题在 2.10.2 中已经修复,所以解决方法如下:

        mkdir -p ~/texmf/tex/latex/titlesec/
        wget http://mirrors.ctan.org/macros/latex/contrib/titlesec/titlesec.sty -O ~/texmf/tex/latex/titlesec/titlesec.sty

    在编译的输出中定位 titlesec.sty 的位置, 然后打开该文件即可查看版本信息.
