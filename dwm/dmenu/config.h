/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;  /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char* fonts[] = {"FiraCode Nerd Font Mono:size=10"};
static char normbgcolor[] = "#2E3440";
static char normbordercolor[] = "#3B4252";
static char normfgcolor[] = "#ECEFF4";
static char selfgcolor[] = "#D8DEE9";
static char selbordercolor[] = "#5E81AC";
static char selbgcolor[] = "#5E81AC";

static const char* prompt = NULL; /* -p  option; prompt to the left of input field */
static const char* colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = {normfgcolor, normbgcolor},
    [SchemeSel] = {selfgcolor, selbgcolor},
    [SchemeSelHighlight] = {"#ffc978", selbgcolor},
    [SchemeNormHighlight] = {"#ffc978", normbgcolor},
    [SchemeOut] = {normbgcolor, normfgcolor},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;
/* -h option; minimum height of a menu line */
static unsigned int lineheight = 0;
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
