function build-iife-lib
    set entry $argv[1]
    set globalname $argv[2]
    set outfile $argv[3]
    
    if test (count $argv) -lt 3
        echo "Usage: build-iife-lib <entry-point> <global-name> <outfile>"
        echo "Example: build-iife-lib src/index.ts R dist/remeda.min.js"
        return 1
    end
    
    bunx esbuild $entry --bundle --format=iife --global-name=$globalname --minify --sourcemap --outfile=$outfile
end
