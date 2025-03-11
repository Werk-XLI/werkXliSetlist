% setlist.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{setlist}[2025/03/11 Band Setlist Class with Large Font and No Borders]

% Load necessary packages
\LoadClass[12pt]{article} % Base on article
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{svg}

% Geometry setup
\geometry{a4paper, margin=1in}

% Custom section formatting
\titleformat{\section}{\Huge\bfseries\sffamily\color{red}}{}{0em}{}
\titleformat{\subsection}{\LARGE\bfseries\sffamily\color{red}}{}{0em}{}

% Custom header/footer
\pagestyle{fancy}
\fancyhf{}

% Commands to store band info
\newcommand{\bandname}[1]{\def\@bandname{#1}}
\newcommand{\eventinfo}[1]{\def\@eventinfo{#1}}
\newcommand{\dateinfo}[1]{\def\@dateinfo{#1}}

% Header and footer formatting for readability
\fancyhead[L]{\includesvg[width=0.1\textwidth]{Images/logo}}
\fancyhead[R]{\Huge\sffamily\bfseries \@eventinfo}
\fancyfoot[C]{\Huge\sffamily\bfseries \@dateinfo}

% Custom setlist counter
\newcounter{songnumber}

% Custom environment for setlist with large spacing
\newenvironment{setlist}{
    \setcounter{songnumber}{0} % Reset counter at start
    \renewcommand{\arraystretch}{1.5} % Increase row height
    \Huge\sffamily\bfseries % Large, bold font
    \begin{tabular}{ l }
}{ 
    \end{tabular}
}

% Command to add a numbered song (fixing numbering issue)
\newcommand{\song}[1]{
    \stepcounter{songnumber}
    \makebox[1em][r]{\arabic{songnumber}.}~#1 \\
}

% Command to insert an announcement (bold, gray, and centered)
\newcommand{\announcement}[1]{
    
    \noindent\colorbox{gray!30}{\parbox{\dimexpr\linewidth-2\fboxsep}{\centering\textbf{\textsc{#1}}}} \\
}

\endinput
