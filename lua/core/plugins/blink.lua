return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets',  "archie-judd/blink-cmp-words" },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'super-tab' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {

        -- Use the thesaurus source
        thesaurus = {
          name = "blink-cmp-words",
          module = "blink-cmp-words.thesaurus",
          -- All available options
          opts = {
            -- A score offset applied to returned items.
            -- By default the highest score is 0 (item 1 has a score of -1, item 2 of -2 etc..).
            score_offset = 0,

            -- Default pointers define the lexical relations listed under each definition,
            -- see Pointer Symbols below.
            -- Default is as below ("antonyms", "similar to" and "also see").
            pointer_symbols = { "!", "&", "^" },
          },
        },

        -- Use the dictionary source
        dictionary = {
          name = "blink-cmp-words",
          module = "blink-cmp-words.dictionary",
          -- All available options
          opts = {
            -- The number of characters required to trigger completion.
            -- Set this higher if completion is slow, 3 is default.
            dictionary_search_threshold = 3,

            -- See above
            score_offset = 0,

            -- See above
            pointer_symbols = { "!", "&", "^" },
          },
        },
      },

      -- Setup completion by filetype
      per_filetype = {
        text = { "dictionary" },
        markdown = { "thesaurus" },
      },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = {
      sorts = {
        'exact',
        'score',
        'sort_text'
      },
      implementation = "prefer_rust_with_warning"
    }
  },
  opts_extend = { "sources.default" }
}
