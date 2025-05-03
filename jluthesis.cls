% Forked from Sakura-shem/JLUThesis and modified by geekifan.
% This work may be distributed and/or modified under the
% conditions of the MIT License,
% available at https://mit-license.org/.


%-------------------------------------------------------------------------------
%                标识
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jluthesis}
\LoadClass[UTF8, fntef, fancyhdr, oneside, a4paper, cs4size]{ctexbook}       % 论文使用A4纸，默认小四号字体

\RequirePackage{geometry}
\RequirePackage{tocloft}
\RequirePackage{amsmath}
\RequirePackage{amsfonts,amssymb}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage[colorlinks,linkcolor=black,citecolor=black]{hyperref}
\RequirePackage{algorithmicx,algorithm,algpseudocode}
\RequirePackage{amsthm}
\RequirePackage{caption}
\RequirePackage[super,square,numbers,sort&compress]{natbib} % 引用形式为上标和方括号


\setmainfont{Times New Roman}

\setCJKfamilyfont{cusong}[AutoFakeBold = {2.17}]{SimSun}
\renewcommand*{\songti}{\CJKfamily{cusong}}
\renewcommand{\baselinestretch}{1.5}

\floatname{algorithm}{算法}

\newtheorem{theorem}{\indent 定理}[section]
\newtheorem{lemma}[theorem]{\indent 引理}
\newtheorem{proposition}[theorem]{\indent 命题}
\newtheorem{corollary}[theorem]{\indent 附注}
\newtheorem{definition}{\indent 定义}[section]
\newtheorem{example}{\indent 例}[section]
\newtheorem{remark}{\indent 注}[section]
%\newenvironment{solution}{\begin{proof}[\indent\bf 解]}{\end{proof}}
\renewcommand{\proofname}{\indent \bf 证明}
%\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        %\itshape
    #1\@addpunct{}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
%\makeatother

% % English theorem environment
% \newtheorem{theorem}{Theorem}[section]
% \newtheorem{lemma}[theorem]{Lemma}
% \newtheorem{proposition}[theorem]{Proposition}
% \newtheorem{corollary}[theorem]{Corollary}
% \newtheorem{definition}{Definition}[section]
% \newtheorem{remark}{Remark}[section]
% \newtheorem{example}{Example}[section]
% \newenvironment{solution}{\begin{proof}[Solution]}{\end{proof}}


% 版面设置
\geometry{a4paper, top = 20mm, bottom = 25mm, left = 30mm, right = 30mm}

%-------------------------------------------------------------------------------
%                加载配置文件
%-------------------------------------------------------------------------------
\input{jluthesis.cfg}

%-------------------------------------------------------------------------------
%                封面设计
%-------------------------------------------------------------------------------
\newcommand{\clearpagebyprint}{\if@twoside\cleardoublepage\else\clearpage\fi}
\newcommand{\fillinblank}[2]{\CJKunderline{\makebox[#1]{#2}}}
\newcommand{\makecover}{
    \begin{titlepage}
        \newcommand{\HRule}{\rule{\linewidth}{1mm}}
        \quad \\[0.42cm]
        {\centering\includegraphics[width = 0.89 \textwidth]{figures/logo.png}\\[0.77cm] }
        \center
        \songti \zihao{-0} \bfseries 本科生毕业论文（设计）  \\[2.43cm]

        \songti \zihao{3} \bfseries 中文题目 \hspace{-0.4cm} \underline{\makebox[11cm]{\songti \zihao{3} \bfseries \cover@ctitlef}}  \\[3pt]
                                    \hspace{2cm}    \underline{\makebox[11cm]{\songti \zihao{3} \bfseries \cover@ctitles}}  \\
        \songti \zihao{3} \bfseries 英文题目 \hspace{-0.4cm} \underline{\makebox[11cm]{\songti \zihao{3} \bfseries \cover@etitlef}}  \\[3pt]
                                    \hspace{2cm}    \underline{\makebox[11cm]{\songti \zihao{3} \bfseries \cover@etitles}}  
                                    % \\[3pt]
                                    % 注释掉以下这行, 因为 \cover@etitlet 未定义. 如果要使用第三行英文标题, 建议在 jluthesis.cfg 中定义 \cover@etitlet.
                                    % \hspace{2cm}    \underline{\makebox[11cm]{\songti \zihao{3} \bfseries \cover@etitlet}}  
                                    \\[2.3cm]

        \songti \zihao{3} \bfseries 学生姓名            \underline{\makebox[11cm]{\cover@author}}  \\[3pt]
        \songti \zihao{3} \bfseries 学\hspace{2em}号    \underline{\makebox[11cm]{\cover@studentid}}  \\[3pt]
        \songti \zihao{3} \bfseries 学\hspace{2em}院    \underline{\makebox[11cm]{\cover@school}}  \\[3pt]
        \songti \zihao{3} \bfseries 专\hspace{2em}业    \underline{\makebox[11cm]{\cover@major}}  \\[3pt]
        \songti \zihao{3} \bfseries 指导教师            \underline{\makebox[11cm]{\cover@mentor}} \\[1.9cm]

        {\songti \zihao{3} \bfseries \cover@time}
        \vfill
    \end{titlepage}
}



%-------------------------------------------------------------------------------
%                页眉页脚设计
%-------------------------------------------------------------------------------



% \setlength{\topmargin}{-5mm} % 页眉顶端距离页边距的距离
\setlength{\headheight}{5mm}
\setlength{\headsep}{5mm}
\setlength{\footskip}{5mm}

\fancypagestyle{style@empty}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{style@onlyfoot}{
    \fancyhf{}
	\fancyfoot[R]{\zihao{-5} \thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{style@normal}{
	\fancyhead{}
	\fancyhead[C]{\zihao{-4} \kaishu 吉林大学\hspace{0.5em}计算机科学与技术学院\hspace{0.5em}毕业论文}
	\fancyfoot{}
	\fancyfoot[R]{\zihao{-5} \thepage}
	\renewcommand{\headrulewidth}{0.4pt}
	\renewcommand{\footrulewidth}{0pt}
    %\renewcommand{\headruleskip}{2.5pt}
}

%-------------------------------------------------------------------------------
%                承诺书
%-------------------------------------------------------------------------------
\newcommand{\commitment}[0]{
    \setlength{\baselineskip}{30pt}
    \chapter*{\zihao{-2} \songti \commitment@title}
    % \addcontentsline{toc}{chapter}{\commitment@title}
    \vspace{1.5cm}
    {\zihao{4} \songti \commitment@content} \\[10cm]
    \leftline{\zihao{4} \songti \hspace{8cm} \commitment@sign} \\
    \rightline{\zihao{4} \songti \commitment@time \hspace{2cm}}
    \vfill
}

%-------------------------------------------------------------------------------
%                摘要
%-------------------------------------------------------------------------------

\newcommand{\baseabstract}[2]{
    \chapter*{\zihao{4} \songti \bfseries #1} % 摘要标题四号字
    \zihao{-4} \songti #2 % 摘要正文小四号字
}

% 中文摘要
\newcommand{\cabstract}[2]{
    \pagestyle{style@empty}
    \setlength{\baselineskip}{18pt}
    \chapter*{\textnormal{\zihao{-3} \songti \cover@ctitle}}
    \thispagestyle{style@empty}
    \bigskip
    \begin{center}
        \zihao{4} \songti \bfseries \abstract@cabstract % 摘要标题四号字
    \end{center}

    \zihao{-4} \songti #1 % 摘要正文小四号字
    \bigskip

    \noindent \zihao{4} \songti {\bfseries {\abstract@ckeywords}}

    \zihao{-4} \songti #2
}


% 英文摘要
\newcommand{\eabstract}[2]{
    \pagestyle{style@empty}
    \setlength{\baselineskip}{18pt}
    \chapter*{\textnormal{\zihao{-3} \songti \cover@etitle}}
    \thispagestyle{style@empty}
    \begin{flushright}
        \zihao{-3}
        Author: \cover@eauthor

        Supervisor: \cover@ementor
    \end{flushright}
    \begin{center}
        \zihao{4} \songti \bfseries \abstract@eabstract % 摘要标题四号字
    \end{center}
    
    \zihao{-4} \songti #1 % 摘要正文小四号字
    \bigskip

    \noindent \zihao{4} \songti {\bfseries {\abstract@ekeywords}}
    
    \zihao{-4} \songti #2
}

%-------------------------------------------------------------------------------
%                目录
%-------------------------------------------------------------------------------
\renewcommand{\contentsname}{目 \hspace{2pt} 录}
% \renewcommand{\cftafterZtitle}{[\baselineskip]\mbox{}\hfill{\normalfont Page}\hfill}
\renewcommand{\cfttoctitlefont}{\hfill\Large\bfseries}        % title 前间隔
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand\cftchapfont{\songti \zihao{4}}
\renewcommand\cftsecfont{\songti \zihao{4}}
\renewcommand\cftsubsecfont{\songti \zihao{4}}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftchappagefont }{}                          % 设置索引不加粗
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}       % 目录后一行连续的点
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}       % 目录后一行连续的点
\setlength{\cftbeforetoctitleskip}{0pt}                       % title 上间隔
\setlength{\cftaftertoctitleskip}{0pt}                       % title 下间隔
\setlength{\cftbeforechapskip}{10.5pt}                         % chapter 间隔
\setlength{\cftbeforesecskip}{10.5pt}                          % section 间隔
\setlength{\cftbeforesubsecskip}{10.5pt}                       % subsection 间隔
\setlength{\cftchapindent}{0pt}                             % 设置 chapter 部分缩进
\setlength{\cftsecindent}{10pt}	                            % 设置 section 部分缩进
\setlength{\cftsubsecindent}{20pt}                          % 设置 subsubsection 缩进
\settowidth{\cftchapnumwidth}{\cftsecfont 1.1}              % 设置 chapter 内容部分缩进
\settowidth{\cftsecnumwidth}{\cftsecfont 1.1}               % 设置 section 内容部分缩进
\settowidth{\cftsubsecnumwidth}{\cftsecfont 1.1}            % 设置 subsection 内容部分缩进

%-------------------------------------------------------------------------------
%                版面及标题格式
%-------------------------------------------------------------------------------


\ctexset {
    chapter = {
        format = \centering \zihao{3} \songti \bfseries,
        titleformat = \hspace{0pt}, % -10pt
        beforeskip = {-20pt}, % -15pt
        afterskip = {25pt}, % 5pt
        number = \arabic{chapter},
        pagestyle = style@normal
    },
    section = {
        format = \raggedright \zihao{4} \songti \bfseries,
        titleformat = \hspace{0pt}, % -10pt
        beforeskip = {20pt}, % 0pt
        afterskip = {20pt}, % 5pt
    },
    subsection = {
        format = \raggedright \zihao{-4} \songti \bfseries,
        titleformat = \hspace{0pt}, % -10pt
        afterskip = {15pt}, % 5pt
    },
    subsubsection = {
        format = \zihao{-4} \songti,
        afterskip = {15pt}, % 0pt
    }
}

%-------------------------------------------------------------------------------
%                图表标题格式
%-------------------------------------------------------------------------------

\DeclareCaptionFont{heiti}{\heiti}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}} % 图标题格式为章节号-图号
\captionsetup[figure]{textfont=heiti, labelfont=heiti, labelsep=quad} % 图标题为黑体
\renewcommand{\thetable}{\thechapter-\arabic{table}}    % 表标题格式为章节号-表号
\captionsetup[table]{textfont=heiti, labelfont=heiti, labelsep=quad}  % 表标题为黑体


\renewcommand{\thealgorithm}{\thechapter.\arabic{algorithm}}


%-------------------------------------------------------------------------------
%                致谢
%-------------------------------------------------------------------------------
\newcommand{\acknowledgement}[1]{
    \setlength{\baselineskip}{20pt}
    \chapter*{\zihao{-3} \songti 致\hspace{1em}谢}
    \addcontentsline{toc}{chapter}{致\hspace{1em}谢}
    \markboth{\zihao{-5} \songti 致\hspace{1em}谢}{\zihao{-5} \songti 致\hspace{1em}谢} % 定制页眉
    \vspace{0.5cm}
    {\songti \zihao{-4} #1}
}




%-------------------------------------------------------------------------------
%                参考文献
%-------------------------------------------------------------------------------
\newcommand{\reference}[1]{
    \setlength{\baselineskip}{10.5pt}
    \chapter*{\zihao{3} \songti 参考文献}
    \addcontentsline{toc}{chapter}{参考文献}
    % \markboth{\zihao{-5} \songti 参考文献}{\zihao{-5} \songti 参考文献} % 定制页眉
    \vspace{0.5cm}
    {\songti \zihao{5} #1}
}

\endinput