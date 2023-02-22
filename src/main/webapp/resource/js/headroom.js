/*global jQuery */
(function($) {
    "use strict";
    jQuery(document).ready(function($) {
		
			/*---------------------------------
				03. Sticky Header JS
			-----------------------------------*/
			const headroom = $("#header");
			headroom.headroom({
				offset: 800,
				tolerance: 5,
				classes: {
					initial: "headroom",
					pinned: "slideDown",
					unpinned: "slideUp",
					notTop: "is-sticky"
				}
			});
			const headroom2 = $(".top");
			headroom2.headroom({
				offset: 800,
				tolerance: 5,
				classes: {
					initial: "headroom",
					pinned: "slideDown",
					unpinned: "slideUp",
					notTop: "is-sticky"
				}
			});
			
        
    }); //End Ready Function
    
}(jQuery));