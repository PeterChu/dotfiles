# Remove all previous environment defined aliases.
#
unalias -a

# General aliases.
#
alias cp='/bin/cp -i'
alias dbs54='dbsxy 5.4'
alias dbs60='dbsxy 6.0'
alias dbs61='dbsxy 6.1'
alias dir='ls -l'
alias g=egrep
alias gv=gvim
alias h=history
alias l=ls
alias ll='ls -la'
alias lss='ls -la --sort=size | more'
alias lst='ls -la --sort=time | more'
alias ls='ls --color=auto -F --si'
alias m=less
alias mv='/bin/mv -i'
alias psu='ps -u $USER -f'
alias rel54='relmachine.sh 5.4'
alias rel60='relmachine.sh 6.0'
alias rel61='relmachine.sh 6.1'
alias rm='/bin/rm -i'
alias src='. ~/.bashrc'
alias x=exit
alias esc='xmodmap ~/.esc_swap'

# General environment variables.
#
export EDITOR=vi
export LS_COLORS="no=00:fi=00:di=01;34:ow=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.tbz2=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:*.tiff=01;35:*.JPG=01;35:*.mpg=01;33:*.mpeg=01;33:*.MPG=01;33:*.mpe=01;33:*.mpv=01;33:*.avi=01;33:*.mov=01;33:*.rm=01;33:*.mp3=01;33:*.ogg=01;33:*akefile=01;35:*.pdf=01;37:*.wmv=01;33:*.wma=01;33:*.flv=01;33:*.mp4=01;33:*.flac=01;33:*.mkv=01;33"
export PAGER=less

# The operating system in use.
#
export OS=`uname`

# Set the architecture variable.
#
if [ $OSTYPE = cygwin ]; then
    export ARCH=x86_64
else
    export ARCH=`uname -m | sed -e s'/^i[3-6]/x/' -e s'/^i86pc/x86_64/' -e s'/^sun4u/sparc/'`
fi

# Set the default user if one is not set.
#
if [ -z $USER ]; then
    export USER=pdc
fi

# Set the domain.
#
if [ $OS = Linux ]; then
    export DOMAIN=`dnsdomainname`
    export HOST=`hostname -s`
elif [ $OS = SunOS ]; then
    export DOMAIN=`domainname`
    export HOST=`hostname`
else
    export HOST=`hostname`
fi

# Set the DISPLAY variable.
#
if [ -z $DISPLAY ]; then
    if [ "$DOMAIN" = "teratext.saic.com.au" ]; then
        export DISPLAY=pdcpc:0.0
    else
        export DISPLAY=:0.0
    fi
fi

# By default bash saves away too much history, set the history size to a saner
# value.
#
HISTSIZE=100
HISTFILESIZE=0


# Set the appropriate umask.
#
umask 002


# Functions.
#
clang-debug()
{
    clang-common linux-clang-$ARCH
}

clang-O()
{
    clang-common linux-clang-$ARCH-O
}

clang-common()
{
    export TCONFIG=$1
    prompt $TCONFIG
    unixTtEnv
    PATH=/usr/local/clang/bin:$TT_OBJDIR/$TCONFIG/bin:$PATH
    LD_LIBRARY_PATH=/usr/local/gcc/lib64:$LD_LIBRARY_PATH
}

clean()
{
    unset TCONFIG TT_ACE_PATH TT_DBS_CONFIG TT_ENTITY_PATH \
          TT_IGNORE_MANUALS TT_MESSAGE_PATH TT_OBJDIR TT_SRC TT_TODO_DISABLE
    libraryPath
    path
    prompt
}

dbsxy()
{
    clean
    prompt dbs"$1"
    if [ $OSTYPE = cygwin ]; then
        local DRIVE=p

        if [ $ARCH = x86_64 ]; then
            DRIVE=q
        fi

        export TT_ACE_PATH="$DRIVE:\TeraText\DBS\r"$1"\lib;."
        export TT_ENTITY_PATH="$DRIVE:\TeraText\DBS\r"$1"\entity"
        PATH=/cygdrive/$DRIVE/TeraText/DBS/r$1/bin:$PATH
    else
        export TT_ACE_PATH=/opt/TeraText/DBS/r$1/lib:.
        export TT_ENTITY_PATH=/opt/TeraText/DBS/r$1/entity
        PATH=/opt/TeraText/DBS/r$1/bin:$PATH
        MANPATH=/opt/TeraText/DBS/r$1/man:$MANPATH
    fi
}

emake()
{
    tmake $* 2>&1 | ~/scripts/compilerfilt.py
    return ${PIPESTATUS[0]}
}

gcc-debug()
{
    if [ $OS = Linux ]; then
        gcc-common linux-gcc-$ARCH
    elif [ $OS = SunOS ]; then
        gcc-common sol-gcc-$ARCH
    fi
}

gcc-O()
{
    if [ $OS = Linux ]; then
        gcc-common linux-gcc-$ARCH-O
    elif [ $OS = SunOS ]; then
        gcc-common sol-gcc-$ARCH-O
    fi
}

gcc-common()
{
    export TCONFIG=$1
    prompt $TCONFIG
    unixTtEnv
    PATH=/usr/local/gcc/bin:$TT_OBJDIR/$TCONFIG/bin:$PATH
    if [ $OS = Linux ]; then
        LD_LIBRARY_PATH=/usr/local/gcc/lib64:$LD_LIBRARY_PATH
    else
        LD_LIBRARY_PATH=/usr/local/gcc/lib/amd64:$LD_LIBRARY_PATH
    fi
    MANPATH=/usr/local/gcc/share/man:$MANPATH
}

libraryPath()
{
    export LD_LIBRARY_PATH=~/local/lib:/usr/local/lib
}

msvc()
{
    msvc-2012-common win-msvc-$ARCH
}

msvc-O()
{
    msvc-2012-common win-msvc-$ARCH-O
}

msvc-2012-common()
{
    export TCONFIG=$1
    prompt $1
    winTtEnv

    PATH=`cygpath $TT_OBJDIR`/$TCONFIG/bin:"/cygdrive/p/microsoft visual studio 11.0/vc/bin/x86_amd64":"/cygdrive/p/microsoft visual studio 11.0/vc/bin":"/cygdrive/p/microsoft visual studio 11.0/common7/ide":"/cygdrive/p/windows kits/8.0/bin/x64":"/cygdrive/p/visual leak detector/bin/win64":$PATH
    export INCLUDE="p:\microsoft visual studio 11.0\vc\include;p:\windows kits\8.0\include\shared;p:\windows kits\8.0\include\um;p:\visual leak detector\include"
    export LIB="p:\microsoft visual studio 11.0\vc\lib\amd64;p:\windows kits\8.0\lib\win8\um\x64;p:\visual leak detector\lib\win64"
}

path()
{
    PATH=/usr/local/bin:/bin:/usr/bin:/usr/sbin
    export MANPATH=~/local/man:/usr/local/man:/usr/man:/usr/share/man
    if [ $OSTYPE = cygwin ]; then
        PATH=$PATH:/usr/X11R6/bin:/cygdrive/c/windows:/cygdrive/c/windows/system32
        MANPATH=/usr/X11R6/man:$MANPATH
    elif [ $OS = Linux ]; then
        PATH=$PATH:/usr/X11R6/bin
        MANPATH=$MANPATH:/usr/X11R6/man
    elif [ $OS = SunOS ]; then
        PATH=/usr/sfw/bin:/opt/sfw/bin:/usr/ccs/bin:$PATH:/usr/openwin/bin
        MANPATH=/usr/sfw/man:/opt/sfw/man:/usr/openwin/share/man:$MANPATH
    fi
    PATH=~/local/bin:~/scripts:'.':$PATH
}

prompt()
{
    local BOLD_BLUE='\[\033[01;34m\]'
    local GREEN='\[\033[00;32m\]'
    local BOLD_WHITE='\[\033[01;37m\]'
    local NO_COLOUR='\[\033[0;0m\]'
    local COLOR_TERMINAL=off

    if [ $TERM = xterm ] || [ $TERM = cygwin ]; then
        COLOR_TERMINAL=on
    fi

    if [ $# = 1 ]; then
        if [ $COLOR_TERMINAL = on ]; then
            PS1="$BOLD_WHITE\h$BOLD_BLUE:$BOLD_WHITE$1$GREEN:$NO_COLOUR\w> "
        else
            PS1="\h:$1:\w> "
        fi
    else
        if [ $COLOR_TERMINAL = on ]; then
            PS1="$BOLD_WHITE\h$GREEN:$NO_COLOUR\w> "
        else
            PS1='\h:\w> '
        fi
    fi
}

rsync-commit()
{
    if [ -z $TT_SRC ]; then
        printf "Please set the TT_SRC environment variable."
        return
    fi

    # Obtain confirmation prior to a source code commit.
    printf "Are you sure you wish to rsync-commit [y/n]: "
    read resp
    case "$resp" in
        [yY]* )
            ;;
        * )
            return
            ;;
    esac

    local SRC_PATH=$TT_SRC
    if [ $OSTYPE = cygwin ]; then
        SRC_PATH=`cygpath $TT_SRC`
    fi

    if [ $# = 1 ]; then
        rsync --archive --verbose --compress --cvs-exclude --exclude='.*' $SRC_PATH/$1/ mimas:ttsrc/$1
    else
        rsync --archive --verbose --compress --cvs-exclude --exclude='.*' $SRC_PATH/ mimas:ttsrc
    fi
}

rsync-update()
{
    if [ -z $TT_SRC ]; then
        printf "Please set the TT_SRC environment variable."
        return
    fi

    local SRC_PATH=$TT_SRC
    if [ $OSTYPE = cygwin ]; then
        SRC_PATH=`cygpath $TT_SRC`
    fi

    if [ $# = 1 ]; then
        rsync --archive --verbose --compress --recursive --cvs-exclude --include='.svn*' --exclude='.*swp' --delete mimas:ttsrc/$1/ $SRC_PATH/$1 | grep -v '.svn'
    else
        rsync --archive --verbose --compress --recursive --cvs-exclude --include='.svn*' --exclude='.*swp' --delete mimas:ttsrc/ $SRC_PATH | grep -v '.svn'
    fi
}

svnView()
{
    local TEMP_FILE=/tmp/$USER-`basename $1 | sed -e 's/@.*//'`
    svn cat $1 > $TEMP_FILE
    gvim -f $TEMP_FILE
    \rm -f $TEMP_FILE
}

unixTtEnv()
{
    export TT_SRC=~/ttsrc
    export TT_OBJDIR=/tt/local/obj/$USER
    export TT_ACE_PATH=$TT_OBJDIR/$TCONFIG/lib:$TT_SRC/ACELIBS:$TT_SRC/CLI/formatters:$TT_SRC/AS/admin:.
    export TT_ENTITY_PATH=$TT_SRC/SGML/entity:$TT_SRC/SGML/sp/pubtext
    unset TT_MESSAGE_PATH
    for i in ACE ACELIBS API AS ASADMIN ASAPPS ASN1 BLU CLI CS GSS IMAGING ISYS LDAP RELEASE SAL SGML SSL STORAGE SUPPORT TOOLS W3C Z3950; do
        export TT_MESSAGE_PATH=$TT_SRC/$i/messages:$TT_MESSAGE_PATH
    done
    libraryPath
    path
    export SVN_DBS=svn://svnserver/tt/repositories/svn-dbs
    export SVN_DIFF=tkdiff
    export SVN_VIEW=svnView
    export TT_IGNORE_MANUALS=
    export TT_TODO_DISABLE=
    export TT_DBS_CONFIG=~/local/tt/config-x.y
    ulimit -c unlimited
}

winTtEnv()
{
    export TT_SRC='l:\ttsrc'
    export TT_OBJDIR="f:\\tt\obj\\$USER"
    export TT_ACE_PATH="$TT_OBJDIR\\$TCONFIG\\lib;$TT_SRC\\ACELIBS;$TT_SRC\\CLI\\formatters;$TT_SRC\\AS\\admin;."
    export TT_ENTITY_PATH="$TT_SRC\\SGML\\entity;$TT_SRC\\SGML\\sp\\pubtext"
    unset TT_MESSAGE_PATH
    for i in ACE ACELIBS API AS ASADMIN ASAPPS ASN1 BLU CLI CS GSS IMAGING ISYS LDAP RELEASE SAL SGML SSL STORAGE SUPPORT TOOLS W3C Z3950; do
        export TT_MESSAGE_PATH="$TT_SRC\\$i\\messages;$TT_MESSAGE_PATH"
    done
    path
    export TT_IGNORE_MANUALS=1
    export TT_TODO_DISABLE=
    export TT_DBS_CONFIG='l:\local\tt\config-x.y'
}


# Carry out machine specific specializations.
#
if [ $HOST = elara ] || [ $HOST = mimas ]; then
    gcc-debug
    cd ~
elif [ $HOST = itami ]; then
    msvc
    cd $TT_SRC
else
    if [ $OS = Linux ] || [ $OS = SunOS ]; then
        libraryPath
    fi
    path
    prompt
    cd ~
fi
