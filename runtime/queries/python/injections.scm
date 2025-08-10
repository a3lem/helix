((comment) @injection.content
 (#set! injection.language "comment"))

(
  (comment) @injection.language @_comment
  .
  [
    ; Comment above bare string.
    (expression_statement
      (string
        (string_content) @injection.content))
    ; Comment above string being assigned to variable
    (expression_statement
      (assignment
        right: (string
          (string_content) @injection.content)))
    ; comment above string returned by function
    (block
      (return_statement
        (string
          (string_content) @injection.content)))
    ; comment above string assigned to class variable
    (_
      (expression_statement
        (assignment
          right: (string
            (string_content) @injection.content))))

  ]
  ( #match? @_comment "^#\\slang(uage)?\\s=[^\\n]+")
)

