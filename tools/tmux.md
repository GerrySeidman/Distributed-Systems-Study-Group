# Getting Started with tmux 

tmux is an immensely useful Linux tool (you can also use it in Cygwin) that allows you to run multiple text terminals from within a standard terminal window.  For example:
* You can have separate windows for 'watching' status
    * ``` watch tail /var/log/dnf.log```

* You can have windows ssh-ed into different machines

>If tmux is not already installed, you first have to install it 
> * Installation varies in each Linux Distro and Cygwin)

tmux is highly configurable with keyboard shortcuts, functionality, and scripting. Most people have their own personal configuration. Over time, you will likely  add things you pick up from other people into your own personal tmux configuration.    
* The tmux configuration file must be in ```~/.tmux.conf```

* > [See section below on Diving Deeper into configuring tmux](#diving-deeper)


All tmux keyboard commands are done starting a Prefix key followed by the command key(s). For the remainder of this document we will designate it as **[Prefix]**
* The default Prefix key is **Ctl-b**

* Note: One of the first thing most people configure in tmux is to configure the Prefix key to something else because  **Ctl-b** is hard to press all the time.  A common choice for the Prefix key is **Ctl-a** (which is what I use)

From the  tmux command line mode allows you do directly enter tmux commands

* [Prefix] + :  

    * This will open a prompt on the status line for you to directly  type in a tmux command

## Gerry's Basic tmux configuration

I have created a basic tmux configuration that provides interactive mouse control for selecting and resizing windows along with some other basic Pane commands
* [You can find Gerry's basic .tmux.conf  file here](.tmux.conf)

If you chose to use [.tmux.conf](.tmux.conf) file, below describes how it is configured
Here is an outline of the capabilites of Gerry's tmux configuration
* the **[Prefix] key**  is Ctl-a
* tmux command line mode allows you do directly end
    [Prefix]-:
* Pane Commands
    * Vertical Split 
        * [Prefix] + v

        * Specifically: ```Ctl-a + v```

    * Horizontal Split: 
        * [Prefix] + b
    
        * Specifically: ```Ctl-a + b```
    * Identify Panes: Panes are numbered.  This will show you the current pane numbers for those in the current window.
        * [Prefix] + q  
             
        * Specifically: ```Ctl-a + q```

    * Swapping Panes is done via command mode
        * First enter command Mode
            * [Prefix] + :

            * Specifically: ```Ctl-a + q```
        * Then on the prompt found on the status line

            * ```sswap -s <source pane> -t <target pane>```

            * where ```<source pane>``` and ```<target pane>``` are the pane numbers you saw when you entered the Identify Panes command

* You can select and resize windows with your mouse
    * Mouse Control     ```[Prefix]-M```   (on by default)
    * Mouse Control off ```[Prefix]-m```
    * Note: Cut and paste work differ somewhat if Mouse is on or off (see  below)

* Cutting and Pasting between tmux panes

    * Cutting Text
        * Select text from one of the tmux window

        * Hit enter

    * Pasting Text
        * [Prefix] + ]

        * Specifically: ```Ctl-a + ]```

* Cutting and pasting between tmux and host applications 
    * When Mouse Mode is on
        * tmux panes works fine when
        * Host Application to tmux pane does not work
    * With Mouse Mode off
        * [For how to do cut/paste from keyboard mode, see Diving Deeper references](#diving-deeper)


## Diving Deeper 
 
 There are many articles, examples, and cheat sheets on the web of 'how best' to configure and use tmux. 
 * [The Tao of tmux](https://leanpub.com/the-tao-of-tmux/read)
 * [tmux cheatsheet site](https://tmuxcheatsheet.com/)