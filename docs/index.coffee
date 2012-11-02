HTML lang: "en",
  HEAD {},
    TITLE "dōmo: Markup, style, and code in one language."

    LINK
      rel: "stylesheet"
      type: "text/css"
      href: "//fonts.googleapis.com/css?family=Titillium+Web:900&subset=latin-ext"

    STYLE type: "text/css",
      (CSS ".#{key}", {color} for key, color of {
        pln: "#000", str: "#080", kwd: "#008", com: "#800", typ: "#606"
        lit: "#066", pun: "#660", opn: "#660", clo: "#660", tag: "#008"
        atn: "#606", atv: "#080", dec: "#606", var: "#606", fun: "red"
      })

    STYLE type: "text/css",
      CSS ".prettyprint"                        , padding: 2
      CSS ".linenums"                           , marginTop: "0 auto 0"
      CSS ".L0,.L1,.L2,.L3,.L4,.L5,.L6,.L7,.L8" , listStyleType: "none"
      CSS ".L1,.L3,.L5,.L7,.L9"                 , background: "#eee"

    STYLE type: "text/css",

      CSS "body"
        background: "#eee"
        color: "#333"
        font: "18px/1.5 Helvetica, Arial, sans-serif"
        margin: "0 0 2em"
        padding: 0

      CSS "h1, h2, h3, p, ul, pre"
        width: 600
        margin: "1em auto"

      CSS "h1"
        margin: "30px auto -70px auto"
        fontSize: 150
        fontFamily: "Titillium Web"

      CSS "a"
        color: "#cc0082"
        textDecoration: "none"

      CSS ".sub"
        background: "#fff"
        margin: "1em 0 0"
        padding: "1em 0"
        border: "1px solid #ccc"
        borderWidth: "1px 0 1px 0"

      CSS "pre, code"
        fontSize: "0.9em"
        fontFamily: "Monaco, Courier New, monospace"

      CSS ".github"
        position: "absolute"
        top: 0
        right: 0
        border: 0

      CSS ".why-domo"
        CSS "li"
          marginTop: 15

  BODY onload: "prettyPrint()",
    A href: "https://github.com/jed/domo",
      IMG
        class: "github"
        src: "//s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"
        alt: "Fork me on GitHub"

    H1 "dōmo"
    H2 "Markup, style, and code in one language."

    P {},
      "dōmo lets you write HTML markup and CSS style in JavaScript syntax, in the browser and on the server. "
      "At less than #{Math.ceil(domo.stats.size / 1000)}kb of minizipped JavaScript, dōmo is a simpler, easier, and more reliable alternative to template engines and CSS pre-processors."

    H3 "Example"

    P {},
      "The following is a simple, self-contained example using dōmo in the browser. "
      "It replaces the existing documentElement with a DOM tree, using a simple function as a CSS mixin."

    DIV class: "sub",
      PRE class: "prettyprint",
        CODE class: "html", """
          <!doctype html>
          <script src="domo.js"><\/script>
          <script>
            function opacity(pct) {
              return {opacity: String(pct / 100), filter: "alpha(opacity=" + pct + ")"}
            }

            HTML({lang: "en"},
              HEAD(
                TITLE("Simple dōmo example"),
                STYLE({type: "text/css"},
                  CSS("body", {textAlign: "center", fontSize: 100}),
                  CSS("h1", opacity(50), {background: "#000", color: "#fff"})
                )
              ),

              BODY(H1("Loading"))
            )
          <\/script>
        """

    H3 "Why dōmo?"

    UL class: "why-dōmo",
      LI B "Reduce your exposure to XSS attacks. "
      "Writing straight from JavaScript to DOM without an HTML step means you don't need to rely on a library to sanitize your rendered data because the browser does it for you automatically."

      LI B "Eliminate a separate compile step. "
      "With dōmo, 'compilation' is done in the same JavaScript process as your code, which means that any syntax errors are thrown with line numbers in the same JavaScript process."

      LI B "Don't let implementations drive architectural decisions. "
      "If you're writing a view that renders a DOM node, you can write it directly within the rendering code for convenience, and then pull it out into its own file when the size of your app requires it."

      LI B "Use JavaScript syntax everywhere. "
      "Instead of remembering which HAML or LESS symbols map to which behaviors, like looping or escaping or conditionals or negation, just use JavaScript."

      LI B "Decouple your syntax sugar. "
      "Instead of choosing a template engine or CSS compiler with the ideal syntax, just use JavaScript, and do your sweetening on a more reliable level. CoffeeScript can go a long way in making DOM building code look like HAML, for example."

      LI B "Reduce the number of moving parts. "
      "Instead of shipping HTML containing strings that compile into JavaScript functions that return HTML used to create DOM nodes, just use JavaScript to create DOM nodes, potentially eliminating underscore.js/jQuery dependencies at the same time."

      LI B "Reuse existing infrastructure. "
      "Any tools you use in your JavaScript workflow, such as minification or packaging, can now be used for your styles and markup too. You can even use something like [browserify][browserify] to easily discover all app dependencies and maintain code modularity."

      LI B "Lessen the burden of context switching. "
      "Whether using JavaScript on both the client and server enables code reuse is debatable, but that it prevents the overhead of switching contexts between languages is less so. It may be subjective, but I think using one language everywhere reduces the congitive overhead for web app development."

    H3 "Using dōmo on the server"

    P {},
      "dōmo really shines when used to build DOM code on the client. "
      "But since you'll likely need to render an HTML client in the first place, dōmo also ships with a window.document shim for rendering HTML on the server. "
      "It's a small (under 1KB minizipped) mock DOM implementation with just enough logic to render HTML. "

    P {},
      "Once you've run npm install domo, the API for the server is the same as that for the client. "
      "Just `require('domo')`, create a DOM, and then use the `outerHTML` property to serialize it into HTML."

    P {},
      "dōmo also adds a top-level `DOCUMENT` function for creating an entire HTML document with doctype, like this:"

    SCRIPT src: "docs/vendor/prettify.js", onload: "prettyPrint()"
    SCRIPT src: "docs/vendor/coffee.js"
