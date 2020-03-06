<template>
  <v-card class="d-flex mx-1">
    <div>
      <v-avatar tile size="92" style="border-radius: 4px">
        <img :src="song.src" />
      </v-avatar>
    </div>

    <div style="width: 100%">
      <v-card-title class="caption pa-2 pb-0">楽曲</v-card-title>
      <div style="position:relative" :style="H(56)">
        <v-card-text
          class="body-2"
          style="
            position:absolute;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(0, 0, 0, 0.87);
          "
          >{{ song.title }}</v-card-text
        >
      </div>
    </div>
  </v-card>
</template>

<script lang="ts">
import {Component, Vue, Prop} from 'vue-property-decorator'
import {Song} from '@/components/Types'

@Component
export default class SongCard extends Vue {
  private H = (n: number): string => `height: ${n}px;`

  @Prop()
  private song?: Song
}
</script>

<style scoped></style>
