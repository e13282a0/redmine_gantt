<template>
  <div :style="cssVars" class="bar">
      gallo
  </div>
</template>

<script>
module.exports = {
  props: ["start", "end"],
  data() {
    return {
      timeBeam: this.$parent.timeBeam,
    };
  },
  computed: {
    startIndex:function(){
      let _this = this;
      return this.timeBeam.findIndex(function(elm){
        //console.log(moment(_this.start)+"|"+elm.startDate+"|"+elm.endDate)+"|"+moment(_this.start) >= elm.startDate+"|"+moment(_this.start) <= elm.endDate
        return moment(_this.start) >= elm.startDate && moment(_this.start) <= elm.endDate
      })
    },
    endIndex:function(){
      let _this = this;
      return this.timeBeam.findIndex(function(elm){
        return moment(_this.end) >= elm.startDate && moment(_this.end) <= elm.endDate
      })
    },
    cssVars() {
      return {
        "--startIndex": this.startIndex,
        "--endIndex": this.endIndex,
        "--left":this.startIndex*24+"px",
        "--width":(this.endIndex-this.startIndex)*24+"px",
      };
    },
  },
  methods: {},
};
</script>

<style scoped>
.bar {
  z-index: 9;
  background-color: blue;
  border: 1px solid #d3d3d3;
  text-align: center;
  cursor: move;
  left:var(--left);
  height:10px;
  width:var(--width);
  min-width: 300px;
  max-width: 600px;
}

/*Drgable */

.bar {
  position: absolute;
  /*resize: both; !*enable this to css resize*! */
  overflow: auto;
}

/*Resizeable*/

.popup .resizer-right {
  width: 5px;
  height: 100%;
  background: transparent;
  position: absolute;
  right: 0;
  bottom: 0;
  cursor: e-resize;
}
</style>
