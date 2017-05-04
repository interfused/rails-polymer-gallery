Polymer({
  is: "detail-element",

   properties: {
            // declare properties for the element's public API
            alttext: {
              type: String,
              value: "Hello!"
            },
            imgurl: String,
            description: String,
            category: String,
            theme: String,
            active: {
            	type: Boolean,
            	value: false
            }
        },

// https://www.polymer-project.org/1.0/docs/devguide/registering-elements
      ready: function() {
        //this.textContent = 'My element!';
        console.log('ready');
      },

      attached: function() {
        //this.textContent = 'My element!';
        console.log('attached');

      },

      searchGoogle(el){
    window.open('https://www.google.com/search?q='+this.alttext, '_blank');
  },
  handleClick() {

   var tgt = this.$.detail;
 $(tgt).hide();
  }

});