\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hanyang-thesis}[2021/10/29 v0.1 Hanyang University Thesis Class]
\LoadClass[11pt]{book}




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
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX,BoldFont=*,BoldFeatures=FakeBold,ItalicFont=*,ItalicFeatures=FakeSlant]{Batang}

% font size
\newcommand{\etal}{\textit{et al}.}
\newcommand{\largefont}{\fontsize{16}{\baselineskip}\selectfont}
\newcommand{\mediumfont}{\fontsize{13}{\baselineskip}\selectfont}



%chapter
\let\defaultchapter\chapter
\def\chapter{\@ifstar{\defaultchapter*}{\nochapter}}
\newcommand{\nochapter}[1]{\defaultchapter{#1}}
\titleformat{\chapter}[hang]{\normalfont\largefont\bfseries\filcenter}{\chaptertitlename\ \thechapter.}{0pt}{} 
\titleformat*{\section}{\titlelabel{\thesection\space}\bf\mediumfont}

% for insertion of 'contents', 'list of tables/figures', and 'bibliography' into TOC
%\RequirePackage[nottoc]{tocbibind}
\RequirePackage[titles]{tocloft}
%%% Format for Table of Contents
\renewcommand{\cftchapdotsep}{\cftdotsep}  %add dot separators
\renewcommand{\cftchapfont}{\bfseries}  %set title font weight
\renewcommand{\cftchappagefont}{}  %set page number font weight
\renewcommand{\cftchappresnum}{Chapter }
\renewcommand{\cftchapaftersnum}{. }
\renewcommand{\cftchapnumwidth}{5em}






% Disallow page breaks at hyphens (this will give some underfull vbox's, so an alternative is to use \brokenpenalty=100 and manually search for and fix such page breaks)
\brokenpenalty=100 % ref. Stanford PhD Thesis Class

% Define hyphenation to break word by hyphen
\hyphenation{val-id-ated}
\hyphenation{pro-viders}
\hyphenation{dis-trib-ut-ed}


%%%%%
%%%%%   SETUP MARGINS
%%%%%
\RequirePackage[a4paper, left=35mm, right=35mm, top=40mm, bottom=40mm, head=15mm, foot=15mm]{geometry}



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

\def\titlep{
	\thispagestyle{empty}
	\newgeometry{top=21mm, bottom=21mm, left=0mm, right=0mm} % To change the margin
	\begin{center}
		\null 
%		\setFontToArnoPro % change a font style
		% \vspace{17.5mm}  \LARGE\uppercase{Thesis For The Degree of Doctor of Philosophy} \\
		\vspace{25mm}  \textbf{\largefont{Thesis for the Doctor of Philosophy}} \\
		\vspace{30mm}  \textbf{\huge\expandafter{\@title}} \\
		\vspace{\fill} \largefont{\@author} \\
		\vspace{35mm}  \textbf{\largefont{Graduate School of Hanyang University}} \\
		\vspace{25mm}  \textbf{\largefont{\@submitdate}} \\
		% \vspace{12.5mm}  \null
		\vspace{25mm}  \null
	\end{center}
	\newpage}

\def\submitpage{
	\thispagestyle{empty}
	\newgeometry{top=21mm, bottom=21mm, left=0mm, right=0mm} % To change the margin
	\begin{center}
		\null
		% \setFontToArnoPro % change a font style
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
	\newgeometry{top=21mm, bottom=21mm, left=0mm, right=0mm} % To change the margin
	\begin{center}
		\null
		% \setFontToArnoPro % change a font style
		% \vspace{22.5mm}  \LARGE{This thesis, written by \@author, \\ has been approved as a thesis for the Doctor of Philosophy.} \\
		\vspace{30mm}  \textbf{\largefont{This thesis, written by \@author, \\ has been approved as a thesis for the degree of \\ Doctor of Philosophy.}} \\
		\vspace{30mm}  \textbf{\largefont{\@submitdate}} \\
		\vspace{25mm}
		\begin{tabular}{lr}
			\textbf{\largefont{Committee Chairman:}} & \largefont{\underline{\makebox[45mm][r]{\@firstreader}} \hspace{3mm}(Signature)}\\ \\
			\textbf{\largefont{Committee Member:}} & \largefont{\underline{\makebox[45mm][r]{\@secondreader}} \hspace{3mm}(Signature)}\\ \\
			\textbf{\largefont{Committee Member:}} & \largefont{\underline{\makebox[45mm][r]{\@thirdreader}} \hspace{3mm}(Signature)}\\ \\
			\textbf{\largefont{Committee Member:}} & \largefont{\underline{\makebox[45mm][r]{\@fourthreader}} \hspace{3mm}(Signature)}\\ \\
			\textbf{\largefont{Committee Member:}} & \largefont{\underline{\makebox[45mm][r]{\@fifthreader}} \hspace{3mm}(Signature)}\\ \\
		\end{tabular} \\
		\vspace{\fill} \textbf{\largefont{Graduate School of Hanyang University}} \\
		% 		\vspace{17.5mm}  \null
		\vspace{30mm}  \null
	\end{center}
	\newpage}

\def\copyrightpage{
	\newpage 
	\thispagestyle{empty} 
	%\setFontToArnoPro % change a font style
	\vspace*{\fill}
	\noindent \copyright~\textit{\@copyrightyear~\textendash\hspace{3pt}~\textbf{\@author}} \\
	\noindent \textsc{All rights reserved.} \\
	\vspace*{\fill} 
	\newpage}


\def\abstractpage{
	
	\begin{center}
		\chapter*{Abstract}
		\large{\@title}
	\end{center}
	\vspace{1mm}
	\begin{flushright}
		\@author \\
		Department of \@dept \\
		The Graduate School \\
		Hanyang University \\
	\end{flushright}
	\addcontentsline{toc}{chapter}{Abstract}
	\input{chapter/abstracteng}
	\vspace*{\fill}\newpage}

\def\beforepreface{
	\pagestyle{plain}
%	\newgeometry{top=21mm, bottom=21mm, left=0mm, right=0mm} % To change the margin
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
	\addcontentsline{toc}{chapter}{List of Figures}
	\listoffigures\newpage
	\addcontentsline{toc}{chapter}{List of Tables}
	\listoftables\newpage
	\setstretch{1.3}
	\abstractpage\newpage
	\pagenumbering{arabic}
}

\def\abstractpagekor{
	\chapter*{국문요지}
	\addcontentsline{toc}{chapter}{\textbf{국문요지}}
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
	\fi}

% Start out normal
\pagestyle{headings}