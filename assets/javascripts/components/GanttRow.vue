<template>
  <div :style="cssVars" class="gantt-row">
    <div class="left">{{ name }}</div>
    <div class="right" ref="right">
      <div v-for="i in colCount" :key="'col' + i" class="col"></div>
      <slot />
    </div>
    
  </div>
</template>

<script>
module.exports = {
  props: ["name"],
  name: "GanttRow",
  data() {
    return {
      leftWidth: this.$parent.leftWidth,
      colCount: this.$parent.colCount,
      colWidth: this.$parent.colWidth,
      timeBeam: this.$parent.timeBeam,
      rowHeight: this.$parent.rowHeight,
    };
  },
  computed: {
    cssVars() {
      return {
        "--leftWidth": this.leftWidth + "px",
        "--colWidth": this.colWidth + "px",
        "--rowHeight": this.rowHeight+"px",
      };
    },
  },
  methods: {},
};
</script>

<style scoped>
.gantt-row {
  display: block;
  height: var(--rowHeight);
  overflow: hidden;
}
.left {
  float: left;
  width: var(--leftWidth);
  height: var(--rowHeight);
}
.right {
  width: calc(100% - var(--leftWidth));
  float: left;
  height: var(--rowHeight);
  position: relative;
}

.col {
  float: left;
  width: var(--colWidth); 
  font-size: x-small;
  padding: 0;
  border-left: 1px solid #ccc;
  height: var(--rowHeight);
  z-index: 1;
}
.col:hover {
  background-color: #EEE;
}
</style>
