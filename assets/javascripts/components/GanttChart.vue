<template>
  <div class="main" ref="main">
    <div class="headline">
      <div :style="{ width: leftWidth + 'px' }">headline</div>
      <div>timeline</div>
    </div>
    <div class="lines">
      <slot />
    </div>
  </div>
</template>

<script>
module.exports = {
  props: [],
  name: "GanttChart",
  data() {
    return {
      leftWidth: 200,
      colCount:90,
    };
  },
  computed: {
      cols:function(){
        return Math.floor((this.mainWidth-this.leftWidth)/this.gridColumnWidth)
      }
  },
  methods: {},
  mounted(){
      this.mainWidth=this.$refs.main.clientWidth;
  }
};
</script>

<style scoped>
.main {
  width: 100%;
}
.headline {
  width: 100%;
}

.headline > div {
  /*white-space: nowrap;*/
  display: inline-block;
}

.lines {
  width: 100%;
}
</style>
