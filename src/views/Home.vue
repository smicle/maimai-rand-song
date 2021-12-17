<template>
  <v-container class="home">
    <h1 class="font-weight-medium">おまかせセレクト</h1>

    <v-row>
      <v-col cols="12">
        <SongFilter v-model="select"></SongFilter>
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
        <Card class="mx-0" :bgcolor="BgColor(song.difficulty)" :color="Color(song.difficulty)">
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
        <SongCard :song="song"></SongCard>
      </v-col>
    </v-row>

    <v-btn @click="result" color="info" class="display-1" :style="H(120) + W(250)">次へ</v-btn>

    <div class="d-flex flex-row-reverse pt-2 pr-4 mt-4">
      <v-btn to="/about" text class="caption" color="blue darken-3" height="20" width="70"> about </v-btn>
    </div>
  </v-container>
</template>

<script lang="ts">
import {Component, Vue, Mixins} from 'vue-property-decorator'
import {Select, Song} from '@/components/Types'
import Card from '@/components/Card.vue'
import SongFilter from '@/components/SongFilter.vue'
import SongCard from '@/components/SongCard.vue'
import maimai from '@/json/maimai.json'
@Component
export class MixinStyle extends Vue {
  private H = (n: number) => `height: ${n}px;`
  private W = (n: number) => `width: ${n}px;`
  private BgColor = (d: string): string => (d === 'Master' ? 'purple lighten-5' : '')
  private Color = (d: string) => (d === 'ReMaster' ? 'purple--text text--darken-3' : '')
}

@Component({
  components: {
    Card,
    SongFilter,
    SongCard,
  },
})
export default class Home extends Mixins(MixinStyle) {
  private select: Select = {
    genre: 'All',
    level: 'All',
    version: 'All',
    format: 'All',
    difficulty: 'All',
  }

  private song = {
    title: '',
    genre: '',
    version: '',
    difficulty: '',
    level: '',
    format: '',
    src: require('@/assets/img/default.jpg'),
  }

  private async result() {
    for (;;) {
      let songList: Song[] = maimai

      if (this.select) {
        ;['genre', 'level', 'version', 'format', 'difficulty']
          .filter(s => this.select[s] !== 'All')
          .forEach(s => (songList = songList.filter(m => this.select[s] === m[s])))
      }

      const rand: number = await require('random-number-csprng')(0, songList.length)
      const song = songList[rand]

      if (song === undefined) continue

      const i = maimai.findIndex(m => JSON.stringify(m) === JSON.stringify(song))
      maimai.splice(i, 1)

      const esc = /\/|"|’|“|”|>|\*|:|♡|!|é|Ä|ö|&|✪|♥|－|♣|⤴/g
      this.song = {
        title: song.title,
        genre: song.genre,
        version: song.version,
        difficulty: song.difficulty,
        level: song.level,
        format: song.format,
        // prettier-ignore
        src: require(`@/assets/img/${song.genre.replace(/&|＆/g, '_')}/${song.title.replace(esc,'')}.jpg`),
      }
      return
    }
  }

  onload = this.result()
}
</script>

<style scoped></style>
