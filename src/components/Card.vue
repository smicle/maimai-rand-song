<template>
  <v-card :color="bgcolor">
    <v-card-title class="caption pa-2">
      <slot name="title"></slot>
    </v-card-title>

    <v-card-text class="body-2" style="color: rgba(0, 0, 0, 0.87)" :class="color">
      <slot name="text"></slot>
    </v-card-text>
  </v-card>
</template>

<script lang="ts">
import {Component, Vue, Prop} from 'vue-property-decorator'

@Component
export default class Card extends Vue {
  @Prop()
  private color?: string

  @Prop()
  private bgcolor?: string
}
</script>

<style scoped></style>
