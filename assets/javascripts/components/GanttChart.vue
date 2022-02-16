<template>
    <div class="main">
        <div class="headline">
            <div :style="{ width: leftWidth + 'px' }">headline</div>
            <div> timeline </div>
            </div>
        <div class="lines">
            <slot />
        </div>
      
    </div>
</template>

<script>
module.exports = {
  props: [],
  name:"GanttChart",
  data() {
    return {
        leftWidth:200,
    };
  },
  computed: {},
  methods: {},
};
</script>

<style scoped>
.main {
    width:100%
}
.headline {
    width:100%;
}

.headline > div {
    /*white-space: nowrap;*/
    display: inline-block
}

.lines {
    width:100%
}

</style>
