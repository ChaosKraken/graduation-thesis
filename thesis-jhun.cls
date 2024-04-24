% !Mode:: "TeX:UTF-8"

%  Copyright 2016-2024 Chaos Liu <liushichao@stu.jhun.edu.cn>
%
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license or (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.
%
%  This work has the LPPL maintenance status `maintained'.
%
%  The Current Maintainer of this work is Chaos Liu <liushichao@stu.jhun.edu.cn>.
%
%  This work consists of the files thesis-jhun.cls, thesis-jhun.bst.
%

\ProvidesClass{thesis-jhun}[2024/04/23 v0.1
    The LaTeX template for thesis of JHUN]
\typeout{Document Class `jhun_thesis' v0.1 by Chaos (2024/04)}

\LoadClass[zihao=-4, a4paper, openany, twoside]{ctexbook}

% check XETEX
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
    \ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
        Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

% color
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

% caption style
% 设置浮动体的标题
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6pt]{caption}

% 表格
\RequirePackage{tabularx, array}
% booktabs 提供了\toprule 等命令
\RequirePackage{booktabs}
\setlength{\heavyrulewidth}{0.9pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\arrayrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}

\RequirePackage{setspace}
% multirow 支持在表格中跨行
\RequirePackage{multirow}
% ams 数学公式拓展
\RequirePackage[tbtags]{amsmath}
% 在 amsfonts 基础上将 ams 拓展符号定义成命令
\RequirePackage{amssymb}
% ams 定理证明环境设计
% \RequirePackage{amsthm}
% ams 拉丁字符
\RequirePackage{lmodern}
% 术语表
\RequirePackage[nopostdot]{glossaries}
% 数学模式下的字母为 Times New Roman
% \RequirePackage{mathspec}

% For the `\hyp{}` command. Allow the user to insert `hyp{}` manually to
% adjust the line break when necessary.
\RequirePackage{hyphenat}


% -------------------- font -----------------------

% 主要字体为Times New Roman和宋体
% 模板某些标题需要华文行楷和32号字
\setmainfont{Times New Roman}
% 不需要设置CJKmainfont，ctex 宏包已经很好的处理了
% 不仅设置了粗体为黑体，斜体为楷体，还兼容了winfonts和adobefonts
% 直接设置反而会在只有adobefonts的情况下报错
% \setCJKmainfont{宋体}
% 重新定义了一下宋体和黑体，让其能支持textbf
% 华文行楷、华文楷体同上
\let\songti\relax
\let\heiti\relax
\setCJKfamilyfont{songti}[AutoFakeBold = {2.17}]{SimSun}
\setCJKfamilyfont{heiti}[AutoFakeBold = {2.17}]{SimHei}
\setCJKfamilyfont{hwxingkai}[AutoFakeBold = {2.17}]{STXingkai}
\setCJKfamilyfont{hwkaiti}[AutoFakeBold = {2.17}]{STKaiti}
\newcommand{\songti}{\CJKfamily{songti}}
\newcommand{\heiti}{\CJKfamily{heiti}}
\newcommand{\hwxingkai}{\CJKfamily{hwxingkai}}
\newcommand{\hwkaiti}{\CJKfamily{hwkaiti}}

% 预定义的字体大小，以后用得着
\newcommand{\xiaochuhao}{\fontsize{32pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26pt}{39pt}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24pt}{36pt}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{33pt}\selectfont}
\newcommand{\xiaoer}{\fontsize{18pt}{27pt}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{24pt}\selectfont}
\newcommand{\xiaosan}{\fontsize{15pt}{22.5pt}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{21pt}\selectfont}
\newcommand{\xiaosi}{\fontsize{12pt}{18pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{15.75pt}\selectfont}
\newcommand{\xiaowu}{\fontsize{9pt}{13.5pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{11.25pt}\selectfont}

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}

%%%%%%%%%% page margin %%%%%%%%%%
% 页面边距

\RequirePackage{geometry}
\newgeometry{
    top=25.4mm, bottom=25.4mm, left=30mm, right=20mm,
    headsep=5mm %, includefoot
}
\savegeometry{bachelorgeometry}

% geometry for tasks pages for bachelor thesis, see also #270
% \newgeometry{
%     top=30mm, bottom=25mm, left=30mm, right=20mm,
%     headsep=5mm
% }
% \savegeometry{bachelortaskgeometry}

%%%%%%%%%% space %%%%%%%%%%
% 其他间距

\renewcommand{\baselinestretch}{1.5}
\setlength{\parindent}{2em}
\setlength{\floatsep}{3pt plus 3pt minus 2pt}      % 图形之间或图形与正文之间的距离
\setlength{\abovecaptionskip}{10pt plus 1pt minus 1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt} % 表格中的表与标题之间的距离

%%%%%%%%%% header & footer %%%%%%%%%%
% 页眉页脚
\RequirePackage{fancyhdr}

% 自定义页面样式
% 页眉、页脚无分割线，清空内容
% 页眉左边位置（L）显示学校LOGO
% 页脚中间位置（C）显示当前页码
\fancypagestyle{frontmatter}{
    \fancyhf{}
    \fancyhead[L]{
        \includegraphics{style/jhun_mark.jpg}\hfill
    }
    \fancyfoot[C]{\Roman{\thepage}}

    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
% 正文前的页码设置位大写罗马数字
\renewcommand{\frontmatter}{
    \cleardoublepage
    \@mainmatterfalse
    \pagenumbering{Roman}
}

\fancypagestyle{mainmatter}{
    \fancyhf{}

    \fancyhead[L]{
        \includegraphics{style/jhun_mark.jpg}\hfill
    }
    \fancyfoot[C]{\thepage}

    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{plain}{
    \pagestyle{fancy}
}

%%%%%%%%%% title %%%%%%%%%%
% 标题

% 汉化
\renewcommand{\contentsname}{\heiti\zihao{-2}\bfseries 目\qquad 录}
\renewcommand\listfigurename{\heiti\zihao{-2}\bfseries 插\ 图\ 目\ 录}
\renewcommand\listtablename{\heiti\zihao{-2}\bfseries 表\ 格\ 目\ 录}
\renewcommand\bibname{参\ 考\ 文\ 献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% 格式
% 也可以考虑 \titleformat 命令
\ctexset{
    chapter={
      format={\centering\sanhao\heiti},
      number={\arabic{chapter}},
      aftername={\quad},
      titleformat={},
      beforeskip={-.5\baselineskip},
      afterskip={\baselineskip},
     },
    section={
      format={\sihao\heiti},
      number = {\thechapter.\hspace{2pt}\arabic{section}},
      aftername={\quad},
      indent={2\ccwd},
      beforeskip={.5\baselineskip},
      afterskip={.5\baselineskip},
     },
    subsection={
            format={\xiaosi\heiti},
            number = {\thechapter.\hspace{2pt}\arabic{section}.\hspace{2pt}\arabic{subsection}},
            aftername={\quad},
            indent={2\ccwd},
            beforeskip={.5\baselineskip},
            afterskip={.5\baselineskip},
        },
}

%%%%%%%%%% contents %%%%%%%%%%
% 目录
\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\heiti\xiaosi}{\thecontentslabel\ }{}
{\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{section}[2em]{\vspace{0.1\baselineskip}\songti\xiaosi}{\thecontentslabel\ }{}
{\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\songti\xiaosi}{\thecontentslabel\ }{}
{\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}

% 取消图片、表格目录中的章节空格
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

%表目录图目录的格式设置
%表目录与图目录数字前增加“表”与“图”字，并且使目录行间距与section行间距一致

\titlecontents{figure}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{图~\thecontentslabel\quad}}{}
{\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

\titlecontents{table}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{表~\thecontentslabel\quad}}{}
{\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

%%%%%%%%%% cross reference %%%%%%%%%%
% 交叉引用

\RequirePackage[xetex,unicode]{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=cyan,
    filecolor=blue,
    urlcolor=red,
    citecolor=green,
    bookmarksnumbered,
    bookmarksopen,
    pdftitle={JHUN thesis},
    pdfauthor={Chaos},
    pdfsubject={江汉大学毕业设计论文},
    pdfcreator={LaTeXed~By~Chaos}
}

%%%%%%%%%% reference %%%%%%%%%%
% 参考文献
\RequirePackage[sort&compress]{natbib}
\bibpunct{[}{]}{,}{n}{}{}
\setlength{\bibsep}{0pt}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

%%%%%%%%%% table %%%%%%%%%%
% 表格

% 设置三线表格的上下边为粗实线
\RequirePackage{booktabs}

% 长表格
\RequirePackage{longtable}

% 表格中的行合并
\RequirePackage{multirow}

% 重定义table/tabular/tabularx环境，使表格内为5号字
% TODO(huxuan): 支持 longtable
% \let\oldtable\table
% \let\endoldtable\endtable
% \renewenvironment{table}[1][h!]
% {\renewcommand{\arraystretch}{1.5}
%     \oldtable[#1]\zihao{5}}
% {\renewcommand{\arraystretch}{1}
%     \endoldtable}

% \let\oldtabular\tabular
% \let\endoldtabular\endtabular
% \renewenvironment{tabular}[1][h!]
% {\renewcommand{\arraystretch}{1.5}
%     \oldtabular[#1]\zihao{5}}
% {\renewcommand{\arraystretch}{1}
%     \endoldtabular}

% \let\oldtabularx\tabularx
% \let\endoldtabularx\endtabularx
% \renewenvironment{tabularx}[2]
% {\renewcommand{\arraystretch}{1.5}
%     \zihao{5}\oldtabularx{#1}{#2}}
% {\renewcommand{\arraystretch}{1}
%     \endoldtabularx}


%%%%%%%%%% picture %%%%%%%%%%
% 图片

\RequirePackage{graphicx}
\graphicspath{{style/}}
\RequirePackage{pifont} % “秘级”后的五角星
\RequirePackage{subfigure}

%%%%%%%%%% list %%%%%%%%%%
% 列表

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*、}
\setlist[enumerate,2]{label=（\arabic*）}
\setlist{
    topsep=0pt,
    itemsep=0pt,
    partopsep=0pt,
    parsep=\parskip,
}

%%%%%%%%%% code %%%%%%%%%%
% 代码

% Listing 的设置请参考 http://en.wikibooks.org/wiki/LaTeX/Packages/Listings
\RequirePackage{listings}
\lstset{
    backgroundcolor=\color{white},
    basicstyle=\zihao{5}\ttfamily,
    columns=flexible,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    frame=single,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    stepnumber=1,
    rulecolor=\color{black},
    tabsize=2,
    texcl=true,
    title=\lstname,
    escapeinside={\%*}{*)},
    extendedchars=false,
    mathescape=true,
    xleftmargin=3em,
    xrightmargin=3em,
    numberstyle=\color{gray},
    keywordstyle=\color{blue},
    commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
}

% 重命名Listings标题头
\renewcommand{\lstlistingname}{代码}

%%%%%%%%%% theorem %%%%%%%%%%
% 定理
% \theoremsymbol{\ensuremath{\square}}
% \newtheorem*{proof}{证明}
% \theoremstyle{plain}
% \theoremsymbol{}
% \theoremseparator{：}
% \newtheorem{assumption}{假设}[chapter]
% \newtheorem{definition}{定义}[chapter]
% \newtheorem{proposition}{命题}[chapter]
% \newtheorem{lemma}{引理}[chapter]
% \newtheorem{theorem}{定理}[chapter]
% \newtheorem{axiom}{公理}[chapter]
% \newtheorem{corollary}{推论}[chapter]
% \newtheorem{exercise}{练习}[chapter]
% \newtheorem{example}{例}[chapter]
% \newtheorem{remark}{注释}[chapter]
% \newtheorem{problem}{问题}[chapter]
% \newtheorem{conjecture}{猜想}[chapter]

%%%%%%%%%% file directory %%%%%%%%%%
% 文件目录

\RequirePackage{dirtree}

\renewcommand*\DTstylecomment{\ttfamily\color{dkgreen}}
\renewcommand*\DTstyle{\ttfamily\color{red}}


%%%%%%%%%% caption %%%%%%%%%%
% 图表标题

\RequirePackage{caption}
\DeclareCaptionFormat{bachelorfigure}{\songti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{bachelortable}{\heiti\bf\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{bachelorlstlisting}{\songti\bf\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{masterfigure}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{mastertable}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{masterlstlisting}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}

% 本科无论是否是开题报告，图表序号都和章节有关
\captionsetup[figure]{format=bachelorfigure,labelsep=quad}
\captionsetup[table]{format=bachelortable,labelsep=quad}
\captionsetup[lstlisting]{format=bachelorlstlisting,labelsep=quad}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}


% Fix subfigure reference bug
\let\p@subfigure=\thefigure

% 图片表格标题命令，主要用于混排
\newcommand\figcaption{\def\@captype{figure}\caption}
\newcommand\tabcaption{\def\@captype{table}\caption}

%%%%%%%%%% other settings %%%%%%%%%%
% 杂项

% 设置<附录>的图表编号与当前附录章号关联
\newcommand{\rmrelation}{
    % 图、表、公式编号随 chapter 清零
    \@addtoreset{figure}{chapter}
    \@addtoreset{table}{chapter}
    \@addtoreset{equation}{chapter}
    %图、表、公式编号章节关联
    \renewcommand{\thefigure}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
    \renewcommand{\thetable}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
    \renewcommand{\theequation}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
}
\let\oldappendix\appendix
\renewcommand{\appendix}{
    \oldappendix\rmrelation
}

% 下划线
\RequirePackage{ulem}

% 设置行距
\RequirePackage{setspace}

%%%%%%%%%% settings for custom pages %%%%%%%%%%
% 首页重定义

\renewcommand{\maketitle}{
    \pagestyle{empty}
    \songti
    \zihao{-4}

    \makecover
}

%%%%%%%%%% abstract %%%%%%%%%%
% 摘要

% 中文摘要
\newenvironment{chineseAbstract}{
    \newpage
    \vspace*{5bp}
    \centering{\heiti\sanhao 摘~~~~要}

    \setlength{\parindent}{24bp}
}

% 英文摘要
\newenvironment{englishAbstract}{
    \newpage
    \vspace*{5bp}
    \centering{\bf\heiti\zihao{3} Abstract}

    \setlength{\parindent}{24bp}
}

\newcommand{\chineseKeyword}[1]{
    % \vspace{\baselineskip}
    % \noindent
    % \@hangfrom{\makebox[48pt][l]{\textbf{关键词\chinesecolon}}}#1
    \par\vspace{\baselineskip} % 使用 \par 来确保新段落开始  
    \noindent\centering\textbf{关键词\chinesecolon} #1
}

\newcommand{\englishKeyword}[1]{
    % \vspace{\baselineskip}
    % \noindent
    % \@hangfrom{\makebox[2.1cm][l]{\textbf{Keywords:}}}#1
    \par\vspace{\baselineskip} % 使用 \par 来确保新段落开始  
    \noindent\centering\textbf{Keywords:} #1
}

% -------------- cover ----------------------

% 本科生首页底部的填写内容居中
% cvcbc : CoVer - Center - Bottom - Center
\newcommand{\ulinecvcbc}[1]{\uline{\makebox[14em][c]{#1}}}

\newcommand{\makecover}{
    \frontmatter
    \begin{titlepage}

        \begin{flushleft}
            % \sihao\songti 
            \fontsize{14pt}{\baselineskip}\bf 二○二四 届学生毕业论文（设计）\hfill 存档编号：\uline{\makebox[9em]{\hfill}}
            \vskip 30bp
            \includegraphics[width=0.5\textwidth]{jhun_mark.jpg}
        \end{flushleft}

        \vskip 45bp
        \begin{center}
            \centerline{\fontsize{48pt}{\baselineskip} {毕业论文（设计）}}
            ~~\\

            \vskip 50bp
            \begin{tabular}{lp{.8\textwidth}}
                \bfseries\fontsize{16pt}{\baselineskip}\selectfont {论文题目} &
                \multirow{2}{.8\textwidth}
                {
                    \centering
                    \fontsize{18pt}{18pt}\selectfont
                    \zh@thetitle
                }                                                           \\
                \cline{2-2}
                                                                          & \\
                \cline{2-2}
            \end{tabular}\hspace*{\fill} \\[\baselineskip]

            \begin{tabular}{lp{.8\textwidth}}
                \bfseries\fontsize{16pt}{24pt}\selectfont{（英~~文）} & \multirow[t]{2}{.8\textwidth}{
                    \centering
                    \fontsize{18pt}{18pt}\selectfont
                    \en@thetitle
                }                                                                                  \\
                \cline{2-2}
                                                                  &                                \\
                \cline{2-2}
            \end{tabular}\hspace*{\fill} \\[\baselineskip]

            ~~\\
            {
            % \bfseries\fontsize{16pt}{16pt}\selectfont
            \begin{tabular}{cc}
                \sanhao 学~~~~院~~ & \ulinecvcbc{\sihao \zh@theschool}  \\[.4ex]
                \sanhao 专~~~~业~~ & \ulinecvcbc{\sihao \zh@themajor}   \\[.4ex]
                \sanhao 姓~~~~名~~ & \ulinecvcbc{\sihao \zh@theauthor}  \\[.4ex]
                \sanhao 指导教师~~   & \ulinecvcbc{\sihao \zh@theadvisor} \\
            \end{tabular}
            }
            \vskip 60bp
            \centerline{\fontsize{12pt}{12pt}\selectfont \thedatesubmit}
            \centerline{\sanhao \thedateconfer}
        \end{center}
    \end{titlepage}

    \setcounter{page}{1}
    \setlength{\extrarowheight}{2pt}
}

% -------------- Infomation ------------------

\newcommand{\zh@thetitle}{\chinesespace}
\newcommand{\zh@theauthor}{\chinesespace}
\newcommand{\zh@thedate}{\chinesespace}
\newcommand{\zh@theschool}{\chinesespace}
\newcommand{\zh@themajor}{\chinesespace}
\newcommand{\zh@theadvisor}{\chinesespace}

\newcommand{\en@thetitle}{\chinesespace}
\newcommand{\en@theauthor}{\chinesespace}
\newcommand{\en@thedate}{\chinesespace}
\newcommand{\en@theschool}{\chinesespace}
\newcommand{\en@themajor}{\chinesespace}
\newcommand{\en@theadvisor}{\chinesespace}

\newcommand{\thestudentnumber}{\chinesespace}

\renewcommand{\title}[2]{
    \renewcommand{\zh@thetitle}{#1}
    \renewcommand{\en@thetitle}{#2}
}

\renewcommand{\author}[2]{
    \renewcommand{\zh@theauthor}{#1}
    \renewcommand{\en@theauthor}{#2}
}

\renewcommand{\date}[2]{
    \renewcommand{\zh@thedate}{#1}
    \renewcommand{\en@thedate}{#2}
}

\newcommand{\major}[2]{
    \renewcommand{\zh@themajor}{#1}
    \renewcommand{\en@themajor}{#2}
}

\newcommand{\school}[2]{
    \renewcommand{\zh@theschool}{#1}
    \renewcommand{\en@theschool}{#2}
}

\newcommand{\advisor}[2]{
    \renewcommand{\zh@theadvisor}{#1}
    \renewcommand{\en@theadvisor}{#2}
}

\newcommand{\studentnumber}[1]{
    \renewcommand{\thestudentnumber}{#1}
}

\newcommand{\thedateoral}{}
\newcommand{\thedatesubmit}{}
\newcommand{\thedateconfer}{年\chinesespace 月}

\newcommand{\setdate}[2][]{
    \ifthenelse{\equal{#1}{oral}}{
        \renewcommand{\thedateoral}{#2}
    }{}
    \ifthenelse{\equal{#1}{submit}}{
        \renewcommand{\thedatesubmit}{#2}
    }{}
    \ifthenelse{\equal{#1}{confer}}{
        \renewcommand{\thedateconfer}{#2}
    }{}
}