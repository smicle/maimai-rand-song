<template>
  <v-container class="home">
    <h1 class="font-weight-medium">maimaiランダム選曲</h1>

    <v-row :style="H_150">
      <v-col cols="8" class="pr-0">
        <Card class="mr-0">
          <template v-slot:title>楽曲</template>
          <template v-slot:text>{{ song.title }}</template>
        </Card>
      </v-col>

      <v-col cols="4" class="pl-0">
        <img :src="song.src" :style="H_92" />
      </v-col>
    </v-row>

    <v-btn @click="result" color="info" class="display-2" :style="H_100 + W_250">選曲</v-btn>

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
  private H_92 = 'height: 92px;'
  private H_100 = 'height: 100px;'
  private H_150 = 'height: 150px;'
  private W_250 = 'width: 250px;'
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
