#include <X11/XF86keysym.h>

/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx = 1; /* border pixel of windows */
static const unsigned int gappx = 0;
static const unsigned int snap = 30;                            /* snap pixel */
static const char panel[][20] = {"xfce4-panel", "Xfce4-panel"}; /* name & cls of panel win */
static const unsigned int gappih = 0; /* horiz inner gap between windows */
static const unsigned int gappiv = 0; /* vert inner gap between windows */
static const unsigned int gappoh = 0; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov = 0; /* vert outer gap between windows and screen edge */
static const int smartgaps = 1;       /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning =
    0; /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft =
    0; /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2; /* systray spacing */
static const int systraypinningfailfirst =
    1; /* 1: if pinning fails, display systray on the first monitor, False: display systray on the
          last monitor*/
static const int showsystray = 0;    /* 0 means no systray */
static const int showbar = 1;        /* 0 means no bar */
static const int topbar = 1;         /* 0 means bottom bar */
static const Bool viewontag = False; /* Switch view on tag switch */
static const char buttonbar[] = "";
static const int user_bh = 20;                /* 0 means that dwm will calculate bar height, >=
                                                 1 means dwm will user_bh as bar height */
static const int enable_autostart_script = 1; /*0 means disable autostart, 1 means enable*/
/*  Display modes of the tab bar: never shown, always shown, shown only in  */
/*  monocle mode in the presence of several windows.                        */
/*  Modes after showtab_nmodes are disabled.                                */
enum showtab_modes
{
    showtab_never,
    showtab_auto,
    showtab_nmodes,
    showtab_always
};
static const int showtab = showtab_auto; /* Default tab bar show mode */
static const int toptab = False;         /* False means bottom tab bar */

static const char* fonts[] = {"Fira Code Nerd Font Mono:size=10"};
static const char dmenufont[] = "Fira Code Nerd Font Mono:size=10";
static char normbgcolor[] = "#2E3440";
static char normbordercolor[] = "#3B4252";
static char normfgcolor[] = "#ECEFF4";
static char selfgcolor[] = "#D8DEE9";
static char selbordercolor[] = "#5E81AC";
static char selbgcolor[] = "#5E81AC";
static char termcol0[] = "#3b4252";  /* black   */
static char termcol1[] = "#bf616a";  /* red     */
static char termcol2[] = "#a3be8c";  /* green   */
static char termcol3[] = "#ebcb8b";  /* yellow  */
static char termcol4[] = "#81a1c1";  /* blue    */
static char termcol5[] = "#b48ead";  /* magenta */
static char termcol6[] = "#88c0d0";  /* cyan    */
static char termcol7[] = "#e5e9f0";  /* white   */
static char termcol8[] = "#4c566a";  /* black   */
static char termcol9[] = "#bf616a";  /* red     */
static char termcol10[] = "#a3be8c"; /* green   */
static char termcol11[] = "#ebcb8b"; /* yellow  */
static char termcol12[] = "#81a1c1"; /* blue    */
static char termcol13[] = "#b48ead"; /* magenta */
static char termcol14[] = "#8fbcbb"; /* cyan    */
static char termcol15[] = "#eceff4"; /* white   */


static char* termcolor[] = {
    termcol0,
    termcol1,
    termcol2,
    termcol3,
    termcol4,
    termcol5,
    termcol6,
    termcol7,
    termcol8,
    termcol9,
    termcol10,
    termcol11,
    termcol12,
    termcol13,
    termcol14,
    termcol15,
};
static char* colors[][3] = {
    /*               fg           bg           border   */
    [SchemeNorm] = {normfgcolor, normbgcolor, normbordercolor},
    [SchemeSel] = {selfgcolor, selbgcolor, selbordercolor},
    [SchemeHid] = {selbgcolor, normbgcolor, selbordercolor},
};

/* tagging */
static const char* tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};
// static const char *tags[] = {"", "", "", "", "", "", "", "", ""};
// static const char* tags[] = {" ", " ", " ", " ", " ", " ", " ", " ", " "};
static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class                            instance                    title tags
       mask     isfloating   monitor */
    // {"TelegramDesktop", NULL, NULL, 1 << 7, 1, -1},
    {"virt-manager", NULL, NULL, 1 << 7, 1, -1},
    // {"qv2ray", NULL, NULL, 1 << 8, 0, -1},
    // {"copyq", NULL, NULL, 0, 1, -1},
    // {"Nitrogen", NULL, NULL, 0, 1, -1},
    {"lxappearance", NULL, NULL, 0, 1, -1},
    {panel[1], NULL, NULL, (1 << 9) - 1, 0, -1},
};

/* layout(s) */
static const float mfact = 0.50;     /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;        /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#include "layouts.c"
#include "tcl.c"
static const Layout layouts[] = {
    /* symbol     arrange function */
    {"Tile", tile}, /* first entry is default */
    {"><>", NULL},  /* no layout function means floating behavior */
    {"[M]", monocle},
    {"HHH", grid},
    {"|||", tcl},
    {"TTT", bstack},
    {"===", bstackhoriz},

};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                          \
    {MODKEY, KEY, view, {.ui = 1 << TAG}},                         \
        {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}}, \
        {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},          \
        {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                     \
    {                                  \
        .v = (const char*[]) {         \
            "/bin/sh", "-c", cmd, NULL \
        }                              \
    }
#define CMD(cmd)                       \
    {                                  \
        .v = (const char*[]) {         \
            "/bin/sh", "-c", cmd, NULL \
        }                              \
    }

/* commands */
static const char* termcmd[] = {"alacritty", NULL};

static const char* stcmd[] = {"st", NULL};

static const char* rofidruncmd[] = {"rofi", "-show", "drun", NULL};

static const char* dmenucmd[] = {"dmenu_run", "-fn", dmenufont, topbar ? NULL : "-b", NULL};

static const char* file[] = {"nemo", NULL};

static const char* lock[] = {"betterlockscreen", "-l", NULL};

static const char* screenshot[] = {"flameshot", "gui", NULL};

static const char* fullshot[] = {
    "flameshot", "full", "-p", "/home/eclipse/Pictures/Screenshots/", NULL};

static const char scratchpadname[] = "scratchpad";
static const char* scratchpadcmd[] = {"st", "-t", scratchpadname, "-g", "80x24", NULL};

static const char* upvol[] = {"/usr/bin/pactl", "set-sink-volume", "0", "+3%", NULL};
static const char* downvol[] = {"/usr/bin/pactl", "set-sink-volume", "0", "-3%", NULL};
static const char* mutevol[] = {"/usr/bin/pactl", "set-sink-mute", "0", "toggle", NULL};

static const char* upbrt[] = {"light", "-A", "5", NULL};
static const char* downbrt[] = {"light", "-U", "5", NULL};

static const char* browser[] = {"google-chrome-stable", NULL};

static const char* translate[] = {"dmenu-translate", NULL};

static const char* clip[] = {"clipmenu", NULL};
static const char* layoutmenu_cmd = "~/.local/bin/layoutmenu.sh";
static const Key keys[] = {
    /* modifier                     key             function        argument */
    {MODKEY, XK_Return, spawn, {.v = termcmd}},
    {MODKEY | ShiftMask, XK_Return, spawn, {.v = stcmd}},
    {MODKEY, XK_d, spawn, {.v = dmenucmd}},
    {MODKEY, XK_p, spawn, {.v = rofidruncmd}},
    {MODKEY, XK_Print, spawn, {.v = screenshot}},
    {0, XK_Print, spawn, {.v = fullshot}},
    {MODKEY, XK_minus, scratchpad_show, {0}},
    {MODKEY | ShiftMask, XK_minus, scratchpad_hide, {0}},
    {MODKEY, XK_equal, scratchpad_remove, {0}},
    {MODKEY | ShiftMask, XK_o, winview, {0}},
    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY | ControlMask, XK_m, focusmaster, {0}},

    {MODKEY | ShiftMask, XK_t, spawn, {.v = translate}},
    {MODKEY, XK_v, spawn, {.v = clip}},
    {MODKEY, XK_e, spawn, {.v = file}},
    {MODKEY, XK_l, spawn, {.v = lock}},
    {MODKEY | ShiftMask, XK_g, spawn, {.v = browser}},

    {MODKEY, XK_s, show, {0}},
    {MODKEY, XK_h, hide, {0}},
    {MODKEY, XK_j, focusstackhid, {.i = +1}},
    {MODKEY, XK_k, focusstackhid, {.i = -1}},
    {MODKEY | ShiftMask, XK_j, shiftviewclients, {.i = -1}},
    {MODKEY | ShiftMask, XK_k, shiftviewclients, {.i = +1}},

    //	{ MODKEY,                       XK_i,           incnmaster,     {.i = +1
    //} }, 	{ MODKEY,                       XK_o,           incnmaster, {.i
    //= -1 } },

    {MODKEY | ControlMask, XK_Return, zoom, {0}},

    /* Switch dark and light */
    {MODKEY | ShiftMask, XK_l, spawn, CMD("~/.local/bin/switch l")},
    {MODKEY | ShiftMask, XK_d, spawn, CMD("~/.local/bin/switch d")},

    {MODKEY, XK_Tab, view, {0}},
    {MODKEY, XK_q, killclient, {0}},
    {MODKEY | ControlMask, XK_q, spawn, SHCMD("killall startdwm")},
    {MODKEY, XK_grave, togglescratch, {.v = scratchpadcmd}},

    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY, XK_f, setlayout, {.v = &layouts[1]}},
    {MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
    {MODKEY, XK_g, setlayout, {.v = &layouts[3]}},
    {MODKEY, XK_u, setlayout, {.v = &layouts[4]}},
    {MODKEY, XK_i, setlayout, {.v = &layouts[5]}},
    {MODKEY, XK_o, setlayout, {.v = &layouts[6]}},
    {MODKEY | ShiftMask, XK_f, fullscreen, {0}},

    {MODKEY | ShiftMask, XK_space, togglefloating, {0}},

    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},

    {MODKEY, XK_comma, setmfact, {.f = -0.05}},
    {MODKEY, XK_period, setmfact, {.f = +0.05}},
    {MODKEY | Mod1Mask, XK_comma, focusmon, {.i = -1}},
    {MODKEY | Mod1Mask, XK_period, focusmon, {.i = +1}},
    {MODKEY | ControlMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ControlMask, XK_period, tagmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, shiftview, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, shiftview, {.i = +1}},

    {MODKEY, XK_F5, xrdb, {.v = NULL}},
    /* XF86Keys */
    {0, XF86XK_AudioMute, spawn, {.v = mutevol}},
    {0, XF86XK_AudioLowerVolume, spawn, {.v = downvol}},
    {0, XF86XK_AudioRaiseVolume, spawn, {.v = upvol}},
    {0, XF86XK_MonBrightnessUp, spawn, {.v = upbrt}},
    {0, XF86XK_MonBrightnessDown, spawn, {.v = downbrt}},

    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3) TAGKEYS(XK_5, 4)
        TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8){MODKEY | ShiftMask, XK_q, quit, {0}},
    {MODKEY | ShiftMask, XK_r, quit, {1}},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static const Button buttons[] = {

    /* click                event mask      button          function argument
     */
    {ClkButton, 0, Button1, spawn, SHCMD("~/.local/bin/xmenu.sh")},
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, layoutmenu, {0}},
    {ClkRootWin, 0, Button3, spawn, SHCMD("~/.local/bin/xmenu.sh")},
    // {ClkWinTitle, 0, Button1, togglewin, {0}},
    // {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    // {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
    {ClkTabBar, 0, Button1, focuswin, {0}},
};
