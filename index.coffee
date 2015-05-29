


number = /// [0-9]+ ///

operator = ///    c     # change
                | d     # delete
                | y     # yank
                | !     # external filter
                | =     # auto format
                | >     # indent
                | <     # unindent

               #| zf    #
               #| gg    #
               #| g~    #
               #| gu    #
               #| gU    #
               #| g\?   #
               #| g@    #

          ///

doubleOperator = ///
                      yy | dd | >> | <<
                 ///


directActionCommand = ///
                           A    # append at EOL
                         | a    # append
                         | C    # change to EOL
                         | I    # insert at BOL
                         | i    # insert mode
                         | J    # join lines
                         | K    # help
                         | D    # delete to EOL
                         | m    # set mark
                         | O    # open new line above
                         | o    # open new line below
                         | P    # paste before
                         | p    # paste after
                         | m    # set mark
                         | R    # replace mode
                         | r    # replace character
                         | S    # substitute line
                         | s    # substitute character
                         | U    # undo line
                         | u    # undo
                         | V    # visual line mode
                         | v    # visual mode
                         | X    # backspace
                         | x    # delete character
                         | Y    # yank line
                         | :    # ex mode
                         | \.   # repeat last command
                         | ~    # toggle case

                      ///



motion = ///

              h
            | l
            | 0
            | \$
            | \^
            | gg
            | g_
            | \|
            | (?: \'|` ) (?: [a-z] )
            | (?: f | F | t | T )(?: .)
            | ;
            | ,
            | k
            | j
            | \+
            | -
            | _
            | (?:[1-9]+[0-9]*|)G
            | e
            | E
            | w
            | W
            | b
            | B
            | ge
            | gE
            | \(
            | \)
            | \{
            | \}
            | \]\]
            | \]\[
            | \[\[
            | \[\]
            | (?: \? | \/ )(?: \S+ )\n

        ///


countAndOperator = ///
                        ( #{number.source} )( #{operator.source} )
                   ///

countAndMotion =   ///
                        ( #{number.source} )( #{motion.source} )
                   ///


match = exports.match = (string) ->
    int = (str) -> parseInt str, 10

    dac = directActionCommand.exec(string)
    if dac? then return { type: 'directActionCommand', count:1, chars:dac[0] }

    dop = doubleOperator.exec(string)
    if dop? then return { type: 'operator', count:1, chars:dop[0] }

    cao = countAndOperator.exec(string)
    if cao? then return { type: 'operator', count: int(cao[1]), chars:cao[2] }

    cam = countAndMotion.exec(string)
    if cam? then return { type: 'motion', count:int(cam[1]), chars:cam[2] }

    m = motion.exec(string)
    if m? then return { type: 'motion', count:1, chars:m[0] }



# check = (string) -> console.log match(string)
# check('23d')
# check('gg')
# check('S')
# check('yy')
# check('.')
# check('5j')
# check('k')
# check('G')





