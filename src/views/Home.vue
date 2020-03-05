<template>
  <v-container class="home">
    <h1 class="font-weight-medium">おまかせセレクト</h1>

    <v-row>
      <v-col cols="7" class="pr-0">
        <Card class="ml-4 mr-2" title="caption">
          <template v-slot:title>ジャンル</template>
          <template v-slot:text>{{ song.genre }}</template>
        </Card>
      </v-col>

      <v-col cols="2" class="px-0">
        <Card title="caption" text="caption">
          <template v-slot:title>形式</template>
          <template v-slot:text>{{ song.format }}</template>
        </Card>
      </v-col>

      <v-col cols="3" class="pl-0">
        <Card class="mx-2" title="caption" text="caption">
          <template v-slot:title>Lv</template>
          <template v-slot:text>{{ song.level }}</template>
        </Card>
      </v-col>
    </v-row>

    <v-row :style="H(160)">
      <v-col cols="8" class="pr-0">
        <Card class="ma-4 mt-0 mr-0" title="body-2" text="body-1">
          <template v-slot:title>楽曲</template>
          <template v-slot:text>{{ song.title }}</template>
        </Card>
      </v-col>

      <v-col cols="4" class="pl-0">
        <img :src="song.src" :style="H(92)" />
      </v-col>
    </v-row>

    <v-btn @click="result" color="info" class="display-1	" :style="H(120) + W(250)">次へ</v-btn>

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
  level: string
  format: string
  DXscore: string
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
    level: '10+',
    format: 'Std',
    DXscore: '1038',
    src: require('@/assets/img/maimai/ネコ日和。.jpg'),
  }

  private async result() {
    const rand: number = await require('random-number-csprng')(0, maimai.length)
    const song = maimai.splice(rand, 1)[0]

    const rep = (title: string): string => title.replace(/\/|"|’|“|”|>|:|♡|!|é|&|✪|♥|－|♣|⤴/g, '')

    this.song = {
      title: song.title,
      genre: song.genre,
      level: song.level,
      format: song.format,
      DXscore: song.DXscore,
      src: require(`@/assets/img/${song.genre.replace('&', '_')}/${rep(song.title)}.jpg`),
    }
  }

  onload = this.result()
}
</script>

<style scoped></style>
