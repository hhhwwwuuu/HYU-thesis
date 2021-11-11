\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hanyang-thesis}[2021/10/29 v0.1 Hanyang University Thesis Class]
\LoadClass[11pt, oneside]{report}


\RequirePackage{{tabularx}}
\RequirePackage{cite}
\RequirePackage{graphicx}
\RequirePackage{textcomp}
\RequirePackage{multirow}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage[table,xcdraw]{xcolor}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{rotating}
\RequirePackage[caption=false,font=small]{subfig}
\RequirePackage{adjustbox}
\RequirePackage[alpine]{ifsym}


\RequirePackage[hidelinks]{hyperref}

% set line pacing
\RequirePackage{setspace}
\setstretch{1.6}

% for lowercase to uppercase i.e. {\sc All} -> ALL
\RequirePackage[small, md, sc]{titlesec}





% for font
% Korean
\RequirePackage{kotex}
% English
%\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX,BoldFont=*,BoldFeatures=FakeBold,ItalicFont=*,ItalicFeatures=FakeSlant]{Batang}


% font size
\newcommand{\etal}{\textit{et al}. }
\newcommand{\largefont}{\fontsize{16}{\baselineskip}\selectfont}
\newcommand{\mediumfont}{\fontsize{13}{\baselineskip}\selectfont}
\newcommand{\subheadfont}{\fontsize{12}{\baselineskip}\selectfont}



%chapter
\let\defaultchapter\chapter
\def\chapter{\@ifstar{\defaultchapter*}{\nochapter}}
\newcommand{\nochapter}[1]{\defaultchapter{#1}}
\titleformat{\chapter}{\normalfont\largefont\bfseries\filright}{\chaptertitlename\ \thechapter.\space}{0pt}{}
\titleformat{name=\chapter, numberless}{\normalfont\largefont\bfseries\filcenter}{}{0pt}{}
\titleformat*{\section}{\titlelabel{\thesection\space}\bf\mediumfont}
\titleformat*{\subsection}{\titlelabel{\thesubsection\space}\bf\subheadfont}
\setlength{\parindent}{2em}
\titlespacing*{\chapter}{0pt}{-1\baselineskip}{1em}




% for insertion of 'contents', 'list of tables/figures', and 'bibliography' into TOC
%\RequirePackage[titletoc,page]{appendix}
\RequirePackage[nottoc]{tocbibind}




% Disallow page breaks at hyphens (this will give some underfull vbox's, so an alternative is to use \brokenpenalty=100 and manually search for and fix such page breaks)
\brokenpenalty=100 % ref. Stanford PhD Thesis Class

% Define hyphenation to break word by hyphen
\hyphenation{val-id-ated}
\hyphenation{pro-viders}
\hyphenation{dis-trib-ut-ed}


%%%%%
%%%%%   SETUP MARGINS
%%%%%
\RequirePackage[a4paper, left=35mm, right=35mm, top=53mm, bottom=53mm, head=15mm, foot=15mm]{geometry}



%%%%%
%%%%%   SETUP COMMANDS PECULIAR TO THESES
%%%%%

\def\dept#1{\gdef\@dept{#1}}

\def\principaladviser#1{\gdef\@principaladviser{#1}}
\def\firstreader#1{\gdef\@firstreader{#1}}
\def\secondreader#1{\gdef\@secondreader{#1}}
\def\thirdreader#1{\gdef\@thirdreader{#1}}
\def\fourthreader#1{\gdef\@fourthreader{#1}}
\def\fifthreader#1{\gdef\@fifthreader{#1}}

\def\submitdate#1{\gdef\@submitdate{#1}}
\def\@submitdate{\ifcase\the\month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi \space \number\the\year}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}}
\def\@copyrightyear{\number\the\year}


%%%%%
%%%%%   PREFACE FORMS
%%%%%

%% The front and end space would be decrease approximately 5mm for according to Hanyang Thesis.
\newfontfamily{\setCoverFont}{Times New Roman}

\def\titlep{
	\thispagestyle{empty}
	\begin{center}
		\null
		\setCoverFont
		\vspace{25mm}  \textbf{\largefont{Thesis for the Doctor of Philosophy}} \\
		\vspace{30mm}  \textbf{\huge\expandafter{\@title}} \\
		\vspace{\fill} \textbf{\largefont{\@author}} \\
		\vspace{35mm}  \textbf{\largefont{Graduate School of Hanyang University}} \\
		\vspace{25mm}  \textbf{\largefont{\@submitdate}} \\
		% \vspace{12.5mm}  \null
		\vspace{25mm}  \null
	\end{center}
	\newpage}

\def\submitpage{
	\thispagestyle{empty}
	%\newgeometry{top=21mm, bottom=21mm, left=0mm, right=0mm} % To change the margin
	\begin{center}
		\null
		\setCoverFont
		% \vspace{12.5mm}  \LARGE\uppercase{Thesis For The Degree of Doctor of Philosophy} \\
		\vspace{20mm}  \textbf{\largefont{Thesis for the Doctor of Philosophy}} \\
		\vspace{20mm}  \textbf{\huge{\@title}} \\
		\vspace{\fill} \textbf{\largefont{Thesis Supervisor: \@principaladviser}} \\
		\vspace{15mm}  \hspace{25mm} \textbf{\largefont{A Thesis submitted to the graduate school of \\ Hanyang University in partial fulfillment of the requirements \\ for the degree of Doctor of Philosophy}} \\
		\vspace{30mm}  \textbf{\largefont{\@author}} \\
		\vspace{10mm}  \textbf{\largefont{\@submitdate}} \\
		\vspace{10mm}  \textbf{\largefont{Department of \@dept}} \\
		\vspace{\z@}   \textbf{\largefont{Graduate School of Hanyang University}}
		% \vspace{7.5mm}  \null
		\vspace{15mm}  \null
	\end{center}
	\newpage}

\def\approvalpage{
	\thispagestyle{empty}
	%\newgeometry{top=21mm, bottom=21mm, left=0mm, right=0mm} % To change the margin
	\begin{center}
		\null
		\setCoverFont
		% \vspace{22.5mm}  \LARGE{This thesis, written by \@author, \\ has been approved as a thesis for the Doctor of Philosophy.} \\
		\vspace{30mm}  \textbf{\largefont{This thesis, written by \@author, \\ has been approved as a thesis for the degree of \\ Doctor of Philosophy.}} \\
		\vspace{30mm}  \textbf{\largefont{\@submitdate}} \\
		\vspace{25mm}
		\begin{tabular}{lr}
			\textbf{\largefont{Committee Chairman:}} & \largefont{\underline{\makebox[40mm][c]{\@firstreader}} \hspace{3mm}(Signature)}\\ \\
			\textbf{\largefont{Committee Member:}} & \largefont{\underline{\makebox[40mm][c]{\@secondreader}} \hspace{3mm}(Signature)}\\ \\
			\textbf{\largefont{Committee Member:}} & \largefont{\underline{\makebox[40mm][c]{\@thirdreader}} \hspace{3mm}(Signature)}\\ \\
			\textbf{\largefont{Committee Member:}} & \largefont{\underline{\makebox[40mm][c]{\@fourthreader}} \hspace{3mm}(Signature)}\\ \\
			\textbf{\largefont{Committee Member:}} & \largefont{\underline{\makebox[40mm][c]{\@fifthreader}} \hspace{3mm}(Signature)}\\ \\
		\end{tabular} \\
		\vspace{\fill} \textbf{\largefont{Graduate School of Hanyang University}} \\
		% 		\vspace{17.5mm}  \null
		\vspace{30mm}  \null
	\end{center}
	\newpage}

\def\copyrightpage{
	\newpage 
	\thispagestyle{empty} 
	\setCoverFont
	\vspace*{\fill}
	\noindent \copyright~\textit{\@copyrightyear~\textendash\hspace{3pt}~\textbf{\@author}} \\
	\noindent \textsc{All rights reserved.} \\
	\vspace*{\fill} 
	\newpage}


\def\abstractpage{
	\chapter*{\centering Abstract}
	\begin{center}

		\mediumfont\bfseries{\@title}
	\end{center}
	\vspace{10pt}
	\begin{flushright}
		\@author \\
		Department of \@dept \\
		Graduate School \\
		Hanyang University \\
		Supervised by \@principaladviser
	\end{flushright}
	\addcontentsline{toc}{chapter}{\textbf{Abstract}}
	\input{chapter/abstracteng}
	\vspace*{\fill}\newpage}

\def\beforepreface{
	\pagestyle{plain}
	\newgeometry{top=21mm, bottom=21mm, left=12.5mm, right=12.5mm} % To change the margin
	% \newgeometry{showframe, top=21mm, bottom=21mm, left=12.5mm, right=12.5mm} % To change the margin
	\setstretch{1}
	\titlep
	\submitpage
	\approvalpage
	\restoregeometry % To restore the margin
	\copyrightpage
	\rm % change a font style
	\pagenumbering{roman}
	\setstretch{1.6}
	
	\tableofcontents\newpage
	%\addcontentsline{toc}{chapter}{List of Figures}
	\listoffigures\newpage
	%\addcontentsline{toc}{chapter}{List of Tables}
	\listoftables\newpage
	\setstretch{1.3}
	\abstractpage\newpage
	\pagenumbering{arabic}
}

\def\abstractpagekor{
	\chapter*{요지}
	\addcontentsline{toc}{chapter}{\textbf{요지}}
	\input{chapter/abstractkor}
	\vspace*{\fill}\newpage}

\def\acknowledgments{
	\chapter*{Acknowledgments}
	\addcontentsline{toc}{chapter}{\textbf{Acknowledgments}}
	\input{chapter/acknowledgments}
	\vspace*{\fill}\newpage}


\def\afterpreface{
	\abstractpagekor\newpage
	\acknowledgments\newpage
}


% Redefine \thebibliography to go to a new page and put an entry in the
% table of contents
\renewcommand\bibname{References}
\let\@ldthebibliography\thebibliography

\renewcommand{\thebibliography}[1]{
	\newpage 
	\small   
	\@ldthebibliography{#1}}%




% redefine \@endpart so the blank page after part has a page number
\def\@endpart{
	\vfil\newpage
	\if@twoside
	\if@openright
	\null
	\thispagestyle{plain}%
	\newpage
	\fi
	\fi
	\if@tempswa
	\twocolumn
	\fi
}

% Start out normal
\pagestyle{headings}