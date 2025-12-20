<template>
  <div class="page">
    <KDashboard />
  </div>
</template>
<script setup>
import { defineRouteMeta, KDashboard } from "@kesplus/kesplus";
defineOptions({
  name: "UserHome",
});
</script>
<script>
defineRouteMeta({
  name: "home",
  title: "工作台",
  "keep-alive": true,
  icon: "HomeFilled",
  isAffix: true,
});
</script>

<style>
.page {
  height: 1000px;
}
</style>
