<template>
  <v-container class="home">
    <h1 class="font-weight-medium">おまかせセレクト</h1>

    <v-row>
      <v-col cols="12">
        <v-expansion-panels focusable class="px-4">
          <v-expansion-panel class="">
            <v-expansion-panel-header>フィルター</v-expansion-panel-header>
            <v-expansion-panel-content>
              <v-select label="ジャンル" v-model="select.genre" :items="genreList"></v-select>
              <v-select label="Lv" v-model="select.level" :items="levelList"></v-select>
              <v-select label="バージョン" v-model="select.version" :items="versionList"></v-select>
              <v-select label="形式" v-model="select.format" :items="formatList"></v-select>
              <v-select
                label="難易度"
                v-model="select.difficulty"
                :items="difficultyList"
              ></v-select>
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
        <Card
          class="mx-0"
          :bgcolor="song.difficulty === 'Master' ? 'purple lighten-5' : ''"
          :color="song.difficulty === 'ReMaster' ? 'purple--text text--darken-3' : ''"
        >
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

    <v-row class="pa-3 pt-1">
      <v-col cols="12">
        <v-card class="d-flex mx-1">
          <div>
            <v-avatar tile class="" size="92" style="border-radius: 4px">
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
  difficulty: string
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
  private select = {
    genre: 'All',
    level: 'All',
    version: 'All',
    format: 'All',
    difficulty: 'All',
  }
  private genreList = [
    'All',
    'POPS&アニメ',
    'niconico&ボーカロイド',
    '東方Project',
    'ゲーム&バラエティ',
    'maimai',
    'オンゲキ&CHUNITHM',
  ]
  // prettier-ignore
  private levelList = ['All', '15', '14+', '14', '13+', '13', '12+', '12', '11+', '11', '10+', '10', '9+', '9', '8+', '8', '7+', '7', '6', '5', '4', '3', '2', '1']
  // prettier-ignore
  private versionList = [
    'All',
    'maimai', 'maimai PLUS',
    'GreeN', 'GreeN PLUS',
    'ORANGE', 'ORANGE PLUS',
    'PiNK', 'PiNK PLUS',
    'MURASAKi', 'MURASAKi PLUS',
    'MiLK', 'MiLK PLUS',
    'FiNALE',
    'maimaiでらっくす', 'maimaiでらっくす PLUS',
  ]
  private formatList = ['All', 'Std', 'DX']
  private difficultyList = ['All', 'Master', 'ReMaster']

  private song: Song = {
    title: 'ネコ日和。',
    genre: 'maimai',
    version: 'maimai',
    difficulty: 'Master',
    level: '10+',
    format: 'Std',
    src: require('@/assets/img/maimai/ネコ日和。.jpg'),
  }

  private async result() {
    for (;;) {
      let mList = maimai
      if (this.select) {
        if (this.select.genre !== 'All') mList = mList.filter(m => this.select.genre === m.genre)
        if (this.select.level !== 'All') mList = mList.filter(m => this.select.level === m.level)
        if (this.select.version !== 'All')
          mList = mList.filter(m => this.select.version === m.version)
        if (this.select.format !== 'All') mList = mList.filter(m => this.select.format === m.format)
        if (this.select.difficulty !== 'All')
          mList = mList.filter(m => this.select.difficulty === m.difficulty)
      }

      const rand: number = await require('random-number-csprng')(0, mList.length)
      const song = mList[rand]

      const n = maimai.findIndex(m => JSON.stringify(m) === JSON.stringify(song))
      maimai.splice(n, 1)

      if (song === undefined) continue

      const rep = (title: string): string => title.replace(/\/|"|’|“|”|>|:|♡|!|é|&|✪|♥|－|♣|⤴/g, '')

      this.song = {
        title: song.title,
        genre: song.genre,
        version: song.version,
        difficulty: song.difficulty,
        level: song.level,
        format: song.format,
        src: require(`@/assets/img/${song.genre.replace('&', '_')}/${rep(song.title)}.jpg`),
      }
      return
    }
  }

  onload = this.result()
}
</script>

<style scoped></style>
