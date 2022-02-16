<template>
    <div class="gantt-row">
      <slot />
    </div>
</template>

<script>
module.exports = {
  props: ["title"],
  name:"GanttRow",
  data() {
    return {
      leftWidth: this.$parent.leftWidth
    };
  },
  computed: {},
  methods: {},
};
</script>

<style scoped>
.gantt-row {
  height:20px;
}
</style>
