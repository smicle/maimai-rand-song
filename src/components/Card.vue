<template>
  <v-card>
    <v-card-title class="caption pa-2">
      <slot name="title"></slot>
    </v-card-title>
    <v-card-text class="body-2" :style="bl">
      <slot name="text"></slot>
    </v-card-text>
  </v-card>
</template>

<script lang="ts">
import {Component, Vue} from 'vue-property-decorator'
@Component
export default class IdolCard extends Vue {
  private bl = 'color: rgba(0, 0, 0, 0.87);'
}
</script>

<style scoped></style>
