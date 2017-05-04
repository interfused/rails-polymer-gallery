Polymer({
  is: "gallery-element",

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

      handleClick() {

    if(!this.active){
      console.log('Make me active: ');
    }else{
      console.log('make me inactive');
    }
    this.active = !this.active;
  }

});
