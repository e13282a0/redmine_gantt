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
      timeBeam: this.$parent.timeBeam,
      rowHeight: 20
    };
  },
  computed: {
    cssVars() {
      return {
        "--leftWidth": this.leftWidth + "px",
        "--colCount": this.colCount,
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
}

.col {
  float: left;
  width: calc((100% / var(--colCount)) - 1px); /* subtract border width*/
  font-size: x-small;
  padding: 0;
  border-right: 1px solid #ccc;
  height: var(--rowHeight);
}
.col:hover {
  background-color: #EEE;
}
</style>
