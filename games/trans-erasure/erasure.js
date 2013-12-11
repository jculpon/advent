var erasure = {
    targetWords: ['text', 'test'],
    decorateTargets: function() {
        /*
         * Build a regexp based on target words:
         *    ['foo', 'bar', 'baz'] -> \\b(foo|bar|baz)\\b
         */
        var delim = erasure.targetWords.reduce(function(a,b) { return a + '|' + b; });
        var regexp = new RegExp('\\b(' + delim + ')\\b', 'g');

        /*
         * Replace the level display area with a version with the target
         * words wrapped in the span defined by addSpan
         * There has to be a prettier way to do this... 
         */
        $('#levelDisplay').html($('#levelDisplay').text().replace(regexp, erasure.addSpan));

        erasure.updateProgress()
    },
    addSpan: function(text) {
        return '<span class="erasable">' + text + '</span>';
    },
    targetWordsTotal: function() {
        return $('.erasable').size();
    },
    targetWordsRemaining: function() {
        return $('.erasable:visible').size();
    },
    updateProgress: function() {
        var remaining = erasure.targetWordsRemaining();
        var total = erasure.targetWordsTotal();

        $('#progress').text('Left: ' + remaining + '/' + total);
    }
    
};

$(document).ready(function() {
    console.log('ready!');

    erasure.decorateTargets();

    $('.erasable').click(function() {
        $(this).fadeOut(400, erasure.updateProgress);
        return false;
    });
});

