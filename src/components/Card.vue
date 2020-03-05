<template>
  <v-card>
    <v-card-title :class="title">
      <slot name="title"></slot>
    </v-card-title>
    <v-card-text :class="text" :style="bl">
      <slot name="text"></slot>
    </v-card-text>
  </v-card>
</template>

<script lang="ts">
import {Component, Vue, Prop} from 'vue-property-decorator'
@Component
export default class IdolCard extends Vue {
  private bl = 'color: rgba(0, 0, 0, 0.87);'

  @Prop()
  private title?: string

  @Prop()
  private text?: string
}
</script>

<style scoped></style>
