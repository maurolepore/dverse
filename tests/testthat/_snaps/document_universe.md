# with url_template longer than 2 yields an error

    Code
      document_universe("base", too_long)
    Condition
      Error in `document_universe_impl()`:
      ! `url_template` must be of length 1 or 2, not 3.

