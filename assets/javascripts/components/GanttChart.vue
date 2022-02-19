<template>
  <div :style="cssVars" class="main" ref="main">

    <div class="headline">
      <div class="left">headline</div>
      <div class="right">
        <div class="col" v-for="elm in timeBeam" :key="'date' + elm.startDate">
          {{ elm.startDate.format("dd") }}
        </div>
      </div>
    </div>

    <div class="headline">
      <div class="left">headline</div>
      <div class="right">
        <div class="col" v-for="elm in timeBeam" :key="'date' + elm.startDate">
          {{ elm.startDate.format("DD.") }}
        </div>
      </div>
    </div>


    <div class="rows">
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
      colCount: 90,
      colWidth:20,
      rowHeight:20,
      timeBeam: this.getTimeBeam(),
    };
  },
  computed: {
    cssVars() {
      return {
        "--leftWidth": this.leftWidth + "px",
        "--colWidth": this.colWidth + "px",
        "--rowHeight": this.rowHeight + "px",
      };
    },
  },
  methods: {
    getTimeBeam: function () {
      let days=28;
      let weeks=48;
      let months=90-days-weeks-1; //subtract 1 for the broken month
      let result = [];
      const today = moment();
      const startDate = today.startOf("isoWeek"); // add one day if startday is sunay
      // days
      for (let i = 0; i < days; i++) {
        result.push({
          type: "day",
          startDate: moment(startDate).add(i, "days").startOf("day"),
          endDate: moment(startDate).add(i, "days").endOf("day"),
          holidays: 0,
          majorSeparator: false,
        });
      }

      // weeks
      for (let i = 0; i < weeks; i++) {
        result.push({
          type: "week",
          startDate: moment(startDate)
            .add(days + i * 7, "days")
            .startOf("day"),
          endDate: moment(startDate)
            .add(days + i * 7 + 7, "days")
            .endOf("day"),
          holidays: 0,
          majorSeparator: i === 0,
        });
      }

      // broken month
      let latestDate = moment(startDate).add(
        days + weeks * 7,
        "days"
      );
      result.push({
        type: "month",
        startDate: latestDate,
        endDate: moment(latestDate).endOf("month").endOf("day"),
        holidays: 0,
        majorSeparator: true,
      });
      let startRegMonth = moment(latestDate).endOf("month").add(1, "day");

      // months
      for (let i = 0; i < months; i++) {
        let _startDate = moment(startRegMonth).add(i, "month").startOf("month");
        let _endDate = moment(startRegMonth)
          .add(i, "month")
          .endOf("month")
          .endOf("day");
        result.push({
          type: "month",
          startDate: _startDate,
          endDate: _endDate,
          holidays: 0,
          majorSeparator: i === 0, // separator for broken month
        });
      }
      //debugger;
      // set separators
      for (let index = 0; index < result.length; index++) {
        let elm = result[index];
        let prevElm = result[index - 1];

        switch (elm.type) {
          case "day":
            elm.minorSeparator = index > 0 && elm.startDate.isoWeekday() === 1;
            break;
          case "week":
            elm.minorSeparator =
              prevElm.type !== "day" &&
              elm.startDate.month() !== prevElm.startDate.month();
            break;
          case "month":
            elm.minorSeparator =
              prevElm.type !== "week" &&
              elm.startDate.year() !== prevElm.startDate.year();
            break;
        }
      }
      //this.endDate = result[result.length - 1].endDate;
      //debugger;
      return result;
    },
  }
};
</script>

<style scoped>
.main {
  width: 100%;
}
.headline {
  display: block;
  height: 14px;
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
  height: 14px;
}

.col {
  float: left;
  width: var(--colWidth); /* subtract border width*/
  font-size: x-small;
  padding: 0;
  border-right: 1px solid #ccc;
  height: var(--rowHeight);
  vertical-align: top;
  line-height: 14px;
}
.col:hover {
  background-color: #eee;
}
</style>
