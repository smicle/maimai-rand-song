<template>
  <v-container class="home">
    <h1 class="font-weight-medium">おまかせセレクト</h1>

    <v-row>
      <v-col cols="12">
        <v-expansion-panels :focusable="true" class="px-4">
          <v-expansion-panel class="">
            <v-expansion-panel-header>フィルター</v-expansion-panel-header>
            <v-expansion-panel-content>
              まだ実装してない。
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-col>
    </v-row>

    <v-row class="mx-3">
      <v-col cols="8" md="4" class="pa-1">
        <Card class="mx-0">
          <template v-slot:title>ジャンル</template>
          <template v-slot:text>{{ song.genre }}</template>
        </Card>
      </v-col>

      <v-col cols="4" md="2" class="pa-1">
        <Card class="mx-0">
          <template v-slot:title>Lv</template>
          <template v-slot:text>{{ song.level }}</template>
        </Card>
      </v-col>

      <v-col cols="8" md="4" class="pa-1">
        <Card class="mx-0">
          <template v-slot:title>バージョン</template>
          <template v-slot:text>{{ song.version }}</template>
        </Card>
      </v-col>

      <v-col cols="4" md="2" class="pa-1">
        <Card class="mx-0">
          <template v-slot:title>形式</template>
          <template v-slot:text>{{ song.format }}</template>
        </Card>
      </v-col>
    </v-row>

    <v-row :style="H(150)" class="pa-3">
      <v-col cols="12">
        <v-card class="d-flex mx-0">
          <div>
            <v-avatar tile class="" size="92">
              <img :src="song.src" />
            </v-avatar>
          </div>

          <div style="width: 100%">
            <v-card-title class="caption pa-2 pb-0">楽曲</v-card-title>
            <div style="position:relative" :style="H(56)">
              <v-card-text
                class="body-2"
                style="
                  color: rgba(0, 0, 0, 0.87);
                  position:absolute;
                  top: 50%;
                  transform: translateY(-50%)
                "
                >{{ song.title }}</v-card-text
              >
            </div>
          </div>
        </v-card>
      </v-col>
    </v-row>

    <v-btn @click="result" color="info" class="display-1" :style="H(120) + W(250)">次へ</v-btn>

    <div class="d-flex flex-row-reverse pt-2 pr-4 mt-4">
      <v-btn to="/about" text class="caption" color="blue darken-3" height="20" width="70">
        about
      </v-btn>
    </div>
  </v-container>
</template>

<script lang="ts">
import {Component, Emit, Prop, Vue, Mixins} from 'vue-property-decorator'
import Card from '@/components/Card.vue'
import maimai from '@/json/maimai.json'

interface Song {
  title: string
  genre: string
  version: string
  level: string
  format: string
  src: string
}

@Component
export class MixinStyle extends Vue {
  private H = (n: number): string => `height: ${n}px;`
  private W = (n: number): string => `width: ${n}px;`
}

@Component({
  components: {
    Card,
  },
})
export default class Home extends Mixins(MixinStyle) {
  private song: Song = {
    title: 'ネコ日和。',
    genre: 'maimai',
    version: 'maimai',
    level: '10+',
    format: 'Std',
    src: require('@/assets/img/maimai/ネコ日和。.jpg'),
  }

  private async result() {
    const rand: number = await require('random-number-csprng')(0, maimai.length)
    const song = maimai.splice(rand, 1)[0]

    if (song === undefined) return

    const rep = (title: string): string => title.replace(/\/|"|’|“|”|>|:|♡|!|é|&|✪|♥|－|♣|⤴/g, '')

    this.song = {
      title: song.title,
      genre: song.genre,
      version: song.version,
      level: song.level,
      format: song.format,
      src: require(`@/assets/img/${song.genre.replace('&', '_')}/${rep(song.title)}.jpg`),
    }
  }

  onload = this.result()
}
</script>

<style scoped></style>
