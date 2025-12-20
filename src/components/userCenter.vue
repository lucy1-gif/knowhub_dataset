<template>
    <div class="user-center">
        {{ initialState.name }}
    </div>
</template>

<script setup>
import { useModel } from "@kesplus/kesplus";

const initialState = useModel("@@initialState");
</script>

<style lang="less">
.user-center {
    text-align: right;
}
</style>
