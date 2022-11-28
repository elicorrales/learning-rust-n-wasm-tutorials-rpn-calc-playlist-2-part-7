(;
 Introduce and work with nested if/else statements
 so that it can handle digits, '+', and '*' inputs.
;)

(module
  (global $add (mut i32) (i32.const 43))    ;;a '+' sign - means to add
  (global $mul (mut i32) (i32.const 42))    ;;a '*' sign - means to multiply
  (global $isAdd (mut i32) (i32.const 100))
  (global $isMul (mut i32) (i32.const 200))
  (global $isUnk (mut i32) (i32.const 999))

    (func $calculate (export "calculate") (param i32) (result i32)
        local.get 0             ;;load input param value onto stack.
        global.get $add         ;;load the '+' equivalent number value onto stack 
        i32.eq
        (if (result i32) 
            (then               ;; if it is a '+'
                global.get $isAdd
            )
            (else               ;; is NOT a '+'
                local.get 0             ;;load input param value onto stack.
                global.get $mul         ;;load the '*' equivalent number value onto stack 
                i32.eq
                (if (result i32)
                    (then
                        global.get $isMul
                    )
                    (else
                        global.get $isUnk
                    )
                )

            )
        )
    )
)

