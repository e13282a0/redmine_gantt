<template>
  <div class="gantt-row">
    <div class="left" :style="cssVars">{{ name }}</div>
    <div class="right" ref="right" :style="cssVars">
      <div v-for="i in colCount" :key="'col' + i" class="col">{{ i }}</div>
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
      colCount:this.$parent.colCount,
    };
  },
  computed: {
    cssVars() {
      return {
        "--leftWidth": this.leftWidth+"px",
        "--colCount": this.colCount,
      };
    },
  },
  methods: {},
};
</script>

<style scoped>
.gantt-row {
  display: block;
  height:20px;
  overflow: hidden;
}
.left {
  float: left;
  width: var(--leftWidth);
}
.right {
  width: calc(100% - var(--leftWidth));
  float: left;
}

.col {
  float: left;
  width: calc(100% / var(--colCount));
  font-size: x-small;
  padding:0;
}
.col:hover {
  background-color: blue;
}
</style>
