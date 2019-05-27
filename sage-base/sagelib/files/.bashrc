PATH=$PATH:/usr/local/sage/bin
export SAGE_DIRECTORY=/usr/local/sage

if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

